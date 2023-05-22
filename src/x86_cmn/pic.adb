with Ada.Unchecked_Conversion;
with MythOS.Types; use MythOS.Types;
with HAL;
with x86;
with Ports; use Ports;

package body PIC is

    -- IMPLEMENTATIOM-SPECIFIC UTILITIES

    subtype Bit_Field is Natural range 0 .. 1;

    type ICW1 is record
        IC4  : Boolean;
        SNGL : Boolean;
        ADI  : Boolean;
        LTIM : Boolean;
        INIT : Boolean;
        A    : Bit_Field;
    end record with Size => 8;
    for ICW1 use record
        IC4  at 0 range 0 .. 0;
        SNGL at 0 range 1 .. 1;
        ADI  at 0 range 2 .. 2;
        LTIM at 0 range 3 .. 3;
        INIT at 0 range 4 .. 4;
        A    at 0 range 5 .. 7;
    end record;
    function icw1_to_u8 is new Ada.Unchecked_Conversion(ICW1, u8);

    type ICW4 is record
        UPM  : Boolean;
        AEOI : Boolean;
        MS   : Boolean;
        BUF  : Boolean;
        SFNM : Boolean;
        c0   : Bit_Field; -- Constant: Must be 2#000#
    end record with Size => 8;
    for ICW4 use record
        UPM  at 0 range 0 .. 0;
        AEOI at 0 range 1 .. 1;
        MS   at 0 range 2 .. 2;
        BUF  at 0 range 3 .. 3;
        SFNM at 0 range 4 .. 4;
        c0   at 0 range 5 .. 7;
    end record;
    function icw4_to_u8 is new Ada.Unchecked_Conversion(ICW4, u8);

    type PICs is (Master, Slave);
    for PICs use (Master => 0, Slave => 1);
    cmd_lut  : array(PICs) of Port_Number := (Master => 16#20#, Slave => 16#A0#);
    data_lut : array(PICs) of Port_Number := (Master => 16#21#, Slave => 16#A1#);

    procedure send_command(pic: PICs; command: u8) with Inline is begin
        Ports.outp(cmd_lut(pic), command);
    end send_command;

    procedure send_data(pic: PICs; data: u8) with Inline is begin
        Ports.outp(data_lut(pic), data);
    end send_data;

    function recv_data(pic: PICs) return u8 with Inline is begin
        return Ports.inp(data_lut(pic));
    end recv_data;

    -- IMPLEMENTATION

    procedure remap(master_base, slave_base: HAL.Interrupts.Number) is
        use type u8;

        icw : u8 := icw1_to_u8(ICW1'(A => 0, IC4 => True, INIT => True,
                                     others => False));
    begin
        -- ICW1
        send_command(Master, icw);
        send_command(Slave, icw);

        -- ICW2
        send_data(Master, u8(master_base) and 16#FC#);
        send_data(Slave, u8(slave_base) and 16#FC#);

        -- ICW3
        send_data(Master, 4);
        send_data(Slave, 2);

        -- ICW4
        icw := icw4_to_u8(ICW4'(c0 => 0, UPM => True, others => False));
        send_data(Master, icw);
        send_data(Slave, icw);
    end remap;

    procedure set_mask(mask: u16) is
        use type u16;
    begin
        send_data(Master, u8(mask and 16#FF#));
        send_data(Slave,  u8(shr(mask, 8) and 16#FF#));
    end set_mask;

    procedure toggle(irq_line: x86.IRQ) is
        use type u8;
        use type x86.IRQ;

        pic : PICs := Master;
        data : u8 := u8(irq_line);
    begin
        if irq_line > 7 then
            pic := Slave;
            data := u8(irq_line) - 8;
        end if;

        send_data(pic, recv_data(pic) or shr(u8(1), Natural(data)));
    end toggle;

    procedure toggle(enable: Boolean) is begin
        if not enable then
            send_data(Master, 16#FF#);
            send_data(Slave,  16#FF#);
        else
            send_data(Master, 16#00#);
            send_data(Slave,  16#00#);
        end if;
    end toggle;

end PIC;
