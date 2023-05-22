with MythOS.Types; use MythOS.Types;

package Ports is

    type Port_Number is new u16;

    procedure outp(port: Port_Number; data: u8) with Export, Convention => C,
      External_Name => "Ports_outb";

    function inp(port: Port_Number) return u8 with Export, Convention => C,
      External_Name => "Ports_inb";

end Ports;
