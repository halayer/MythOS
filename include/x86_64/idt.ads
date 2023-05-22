with MythOS.Types; use MythOS.Types;
with x86;

package IDT is

    subtype Descriptor_Type is Natural range 0 .. 15;

    type IDT_Descriptor is record
        target_lo : u16;

        selector : u16;

        IST  : Bit_Field;
        res0 : Bit_Field;       -- Ignored
        typ  : Descriptor_Type;
        c0   : Bit_Field;       -- Constant: Must be 0
        DPL  : x86.Privilege_Level;
        P    : Boolean;

        target_mid : u16;
        target_hi  : u32;

        res1 : Bit_Field; -- Ignored
    end record with Size => 128;

    for IDT_Descriptor use record
        target_lo at 0 range 0 ..  15;

        selector at 0 range 16 ..  31;

        IST  at 0 range 32 ..  34;
        res0 at 0 range 35 ..  39;
        typ  at 0 range 40 ..  43;
        c0   at 0 range 44 ..  44;
        DPL  at 0 range 45 ..  46;
        P    at 0 range 47 ..  47;

        target_mid at 0 range 48 ..  63;
        target_hi  at 0 range 64 ..  95;

        res1 at 0 range 96 .. 127;
    end record;

    subtype IDT_Index is Natural range 0 .. 255;
    type IDT_t is array(IDT_Index) of IDT_Descriptor;
    IDT : aliased IDT_t with Import, Address => u64_to_addr(16#40000#),
      External_Name => "IDT_IDT";

    procedure init;

private

    type IDT_Register is record
        limit : u16;
        base  : u64;
    end record with Size => 80;

    for IDT_Register use record
        limit at 0 range  0 .. 15;
        base  at 0 range 16 .. 79;
    end record;

    IDTR : aliased IDT_Register;

end IDT;
