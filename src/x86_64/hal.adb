with Ada.Unchecked_Conversion;
with System.Machine_Code;
with MythOS.Types; use MythOS.Types;
with CPUID;
with Ports;
with PIC;
with IDT;

package body HAL is

    -- IMPLEMENTATIOM-SPECIFIC UTILITIES
    
    subtype String4 is String(1..4);
    function u32_to_string is new Ada.Unchecked_Conversion(u32, String4);
    
    edx_features_val : CPUID.EDX_Features;
    edx_feature_mapping : array(Features) of Natural := 
      (FPU => 0, Long_Addresses => 6, APIC => 9);
    
    lapic_id : u8;

    -- IMPLEMENTATION

    procedure init is
        use type u8, u32;
        
        features : CPUID.CPUID_ret := 
          CPUID.CPUID(CPUID.Features);
        caches : CPUID.CPUID_ret := 
          CPUID.CPUID(CPUID.Caches);
    begin
        edx_features_val := CPUID.u32_to_edx_features(features.edx);
        lapic_id := u8(shr(features.ebx, 24) and 16#FF#);

        Physical.cores := u8(shr(caches.eax, 26) and 16#3F#) + 1;

        -- IDT Initialization
        IDT.init;

        -- PIC Initialization
        PIC.remap(16#20#, 16#28#);

        if edx_features_val.APIC then PIC.toggle(False); 
        else PIC.toggle(True); end if;
    end init;

    procedure wait is begin
        System.Machine_Code.Asm("hlt", Volatile => True);
    end wait;

    procedure halt is begin
        System.Machine_Code.Asm("halt.loop: hlt; jmp halt.loop",
                                Volatile => True);
    end halt;

    procedure move_cursor(location: u16) is
        use type u16;
    begin
        Ports.outp(16#3D4#, 16#F#);
        Ports.outp(16#3D5#, u8(location and 16#FF#));
        Ports.outp(16#3D4#, 16#E#);
        Ports.outp(16#3D5#, u8(shr(location, 8) and 16#FF#));
    end move_cursor;

    function vendor return Vendor_String is
        id  : CPUID.CPUID_ret := CPUID.CPUID(CPUID.Vendor);
        ret : Vendor_String := Vendor_String(u32_to_string(id.ebx) &
                                             u32_to_String(id.edx) &
                                             u32_to_string(id.ecx));
    begin
        return ret;
    end vendor;

    function feature_supported(f: Features) return Boolean is
        use CPUID;
        use type u32;
    begin
        return (shr(edx_features_to_u32(edx_features_val), edx_feature_mapping(f)) and 1) = 1;
    end feature_supported;
    
    package body Interrupts is
        
        procedure toggle(enable: Boolean) is begin
            if enable then System.Machine_Code.Asm("sti", Volatile => True);
            else System.Machine_Code.Asm("cli", Volatile => True); end if;
            
            PIC.toggle(enable);
        end toggle;
        
        procedure generate(intr: Number) is begin
            System.Machine_Code.Asm("movb %0, point+1; point: int $0",
                                    Inputs => u8'Asm_Input("ri", u8(intr)),
                                    Volatile => True);
        end generate;
        
        procedure set_handler(intr: Number; ir: Handler) is
            use type u64;
            
            function ir_to_u64 is new Ada.Unchecked_Conversion(Handler, u64);
            
            addr : u64 := ir_to_u64(ir);
        begin
            IDT.IDT(intr).target_lo  := u16(addr and 16#FFFF#);
            IDT.IDT(intr).target_mid := u16(shr(addr, 16) and 16#FFFF#);
            IDT.IDT(intr).target_hi  := u32(shr(addr, 32));

            IDT.IDT(intr).selector := 16#08#;

            IDT.IDT(intr).typ := 16#E#;

            IDT.IDT(intr).DPL := 2#00#;

            IDT.IDT(intr).P := True;
        end set_handler;

    end Interrupts;

end HAL;
