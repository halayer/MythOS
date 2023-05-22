with System;
with Ada.Unchecked_Conversion;
with Interfaces;

package MythOS.Types is

    subtype Bit_Field is Natural range 0 .. 1;

    subtype u8 is Interfaces.Unsigned_8;
    subtype u16 is Interfaces.Unsigned_16;
    subtype u32 is Interfaces.Unsigned_32;
    subtype u64 is Interfaces.Unsigned_64;

    function addr_to_u32 is new Ada.Unchecked_Conversion(System.Address, u32);
    function addr_to_u64 is new Ada.Unchecked_Conversion(System.Address, u64);

    function u32_to_addr is new Ada.Unchecked_Conversion(u32, System.Address);
    function u64_to_addr is new Ada.Unchecked_Conversion(u64, System.Address);

    function shr(v: u8;  a: Natural) return u8  renames Interfaces.Shift_Right;
    function shr(v: u16; a: Natural) return u16 renames Interfaces.Shift_Right;
    function shr(v: u32; a: Natural) return u32 renames Interfaces.Shift_Right;
    function shr(v: u64; a: Natural) return u64 renames Interfaces.Shift_Right;

    subtype i8 is Interfaces.Integer_8;
    subtype i16 is Interfaces.Integer_16;
    subtype i32 is Interfaces.Integer_32;
    subtype i64 is Interfaces.Integer_64;

end MythOS.Types;
