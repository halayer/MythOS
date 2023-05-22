pragma Source_File_Name(MythOS.main, Spec_File_Name => "mythos.ads");

with Interfaces; use Interfaces;

package MythOS is

    procedure main with Convention => C, Export, External_Name => "MythOS_main";

    type Hex_Converted is new String(1 .. 17);
    function itoa(num: Unsigned_64) return Hex_Converted;

    procedure div_0 with Convention => C;
    procedure brkpt with Convention => C;
    procedure invalid_opcode with Convention => C;
    procedure double_fault with Convention => C;
    procedure invalid_segment with Convention => C;
    procedure protection_fault with Convention => C;
    procedure page_fault with Convention => C;

    procedure kbd with Convention => C;

private

    hex_lookup : array(Unsigned_64 range 0 .. 15) of Character :=
      "0123456789ABCDEF";

end MythOS;
