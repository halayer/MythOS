with System.Machine_Code;
with MythOS.Types; use MythOS.Types;

package body Ports is

    procedure outp(port: Port_Number; data: u8) is begin
        System.Machine_Code.Asm("outb %0, %1",
                                Inputs => (u8'Asm_Input("a", data),
                                           u16'Asm_Input("Nd", u16(port))),
                                Volatile => True);
    end outp;

    function inp(port: Port_Number) return u8 is
        data : u8;
    begin
        System.Machine_Code.Asm("inb %1, %0",
                                Outputs => u8'Asm_Output("=a", data),
                                Inputs  => u16'Asm_Input("Nd", u16(port)),
                                Volatile => True);

        return data;
    end inp;

end Ports;
