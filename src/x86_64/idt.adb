with System.Machine_Code;
with System.Address_To_Access_Conversions;
with MythOS.Types; use MythOS.Types;

package body IDT is

    procedure init is begin
        IDTR.base  := addr_to_u64(IDT'Address);
        IDTR.limit := u16(IDT'Size / 8 - 1);

        System.Machine_Code.Asm("lidt %0",
                                Inputs => IDT_Register'Asm_Input("m", IDTR),
                                Volatile => True);
    end init;

end IDT;
