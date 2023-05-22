with MythOS.Types; use MythOS.Types;

package HAL is

    procedure init;

    procedure wait with Inline, Export, Convention => C,
        External_Name => "HAL_wait";
    procedure halt with Inline, Export, Convention => C,
        External_Name => "HAL_halt";

    procedure move_cursor(location: u16) with Export, Convention => C,
        External_Name => "HAL_move_cursor";

    type Vendor_String is new String(1 .. 12);
    function vendor return Vendor_String with Export, Convention => C,
        External_Name => "HAL_get_vendor";

    type Features is (FPU, APIC, Long_Addresses);
    function feature_supported(f: Features) return Boolean with Inline,
      Export, Convention => C, External_Name => "HAL_feature_supported";

    package Physical is
        cores : u8 with Export, External_Name => "HAL_physical_cores";
    end Physical;

    package Interrupts is
        type Handler is access procedure with Convention => C;
        subtype Number is Natural range 0 .. 255;

        procedure toggle(enable: Boolean) with Export, Convention => C,
            External_Name => "HAL_Interrupts_toggle";
        procedure generate(intr: Number) with Inline, Export, Convention => C,
            External_Name => "HAL_Interrupts_generate";

        procedure set_handler(intr: Number; ir: Handler) with Export,
          Convention => C, External_Name => "HAL_Interrupts_set_handler";
    end Interrupts;

end HAL;
