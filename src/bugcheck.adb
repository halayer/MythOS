with Ada.Characters.Latin_1; use Ada.Characters.Latin_1;
with MythOS.Types; use MythOS.Types;
with Konsole;

package body Bugcheck is

    procedure print_backtrace is
        bt : Backtrace_Array;
        depth : u8 := 0;

        type Hex_Converted is new String(1 .. 17);
        hex_lookup : array(u64 range 0 .. 15) of Character :=
          "0123456789ABCDEF";

        function itoa(num: u64) return Hex_Converted is
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

    begin
        depth := backtrace(bt'Address);

        for i in 0 .. Natural(depth) loop
            Konsole.put("0x" & String(itoa(bt(i))) & LF);
        end loop;
    end print_backtrace;

end Bugcheck;
