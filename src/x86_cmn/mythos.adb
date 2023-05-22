with System.Machine_Code;
with Ada.Characters.Latin_1; use Ada.Characters.Latin_1;
with MythOS.Types; use MythOS.Types;
with Interfaces; use Interfaces;
with Konsole;
with HAL;
with MSR;
with Bugcheck;
with PIC;

package body MythOS is

    procedure main is
        use HAL;
        use Konsole;

        use type u8, u64;

        apic_base : u64 := MSR.rdmsr(16#0000_001B#) and 16#7FFFFFFFFF000#;
    begin
        HAL.init;
        HAL.Interrupts.toggle(False);

        HAL.Interrupts.set_handler(0, div_0'Access);
        HAL.Interrupts.set_handler(3, brkpt'Access);
        HAL.Interrupts.set_handler(6, invalid_opcode'Access);
        HAL.Interrupts.set_handler(8, double_fault'Access);
        HAL.Interrupts.set_handler(11, invalid_segment'Access);
        HAL.Interrupts.set_handler(13, protection_fault'Access);
        HAL.Interrupts.set_handler(14, page_fault'Access);
        
        HAL.Interrupts.set_handler(33, kbd'Access);

        HAL.Interrupts.toggle(True);

        clear;
        put("Running on " & String(HAL.vendor) & " with " & LF);

        if feature_supported(FPU) then put("  FPU" & LF);
        else put("  no FPU" & LF); end if;

        if feature_supported(Long_Addresses) then put("  >32-bit addressing" & LF);
        else put("  <=32-bit addressing"); end if;

        if feature_supported(APIC) then put("  APIC" & LF);
        else put("  no APIC" & LF); end if;

        put(LF & "#Cores = " & Character'Val(Character'Pos('0') + Physical.cores));

        put(LF & "APIC Base Register = 0x" & String(itoa(apic_base)) & LF);

        PIC.toggle(1);
        HAL.halt;
    end main;
    
    function itoa(num: Unsigned_64) return Hex_Converted is
        use type u64;
        
        ret : Hex_Converted := (9 => '_', others => '0');
    begin
        ret(17) := hex_lookup(num and 15);
        ret(16) := hex_lookup(shr(num, 4) and 15);
        ret(15) := hex_lookup(shr(num, 8) and 15);
        ret(14) := hex_lookup(shr(num, 12) and 15);
        ret(13) := hex_lookup(shr(num, 16) and 15);
        ret(12) := hex_lookup(shr(num, 20) and 15);
        ret(11) := hex_lookup(shr(num, 24) and 15);
        ret(10) := hex_lookup(shr(num, 28) and 15);
        ret(8)  := hex_lookup(shr(num, 32) and 15);
        ret(7)  := hex_lookup(shr(num, 36) and 15);
        ret(6)  := hex_lookup(shr(num, 40) and 15);
        ret(5)  := hex_lookup(shr(num, 44) and 15);
        ret(4)  := hex_lookup(shr(num, 48) and 15);
        ret(3)  := hex_lookup(shr(num, 52) and 15);
        ret(2)  := hex_lookup(shr(num, 56) and 15);
        ret(1)  := hex_lookup(shr(num, 60) and 15);

        return ret;
    end itoa;

    -- Basic Exception Handlers
    procedure div_0 is begin
        Konsole.put(LF & "Divide by Zero!"); HAL.halt;
    end div_0;

    procedure brkpt is begin
        Konsole.put(LF & "Breakpoint!" & LF); 
        Bugcheck.print_backtrace;
        HAL.halt;
    end brkpt;

    procedure invalid_opcode is begin
        Konsole.put(LF & "Invalid Opcode!"); HAL.halt;
    end invalid_opcode;

    procedure double_fault is begin
        Konsole.put(LF & "Double Fault!"); HAL.halt;
    end double_fault;

    procedure invalid_segment is begin
        Konsole.put(LF & "Invalid Segment!"); HAL.halt;
    end invalid_segment;

    procedure protection_fault is
        rip : Unsigned_64;
    begin
        System.Machine_Code.Asm("pop %0", Outputs => Unsigned_64'Asm_Output("=r", rip),
                                Volatile => True);
        
        Konsole.put(LF & "Protection Fault at ");
        Konsole.put(String(itoa(rip)));
    end protection_fault;

    procedure page_fault is begin
        Konsole.put(LF & "Page Fault!"); HAL.halt;
    end page_fault;
    
    procedure kbd is begin
        Konsole.put(LF & "Keyboard Interrupt!"); HAL.halt;
    end kbd;

end MythOS;
