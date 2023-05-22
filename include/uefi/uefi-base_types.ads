-- https://dox.ipxe.org/UefiBaseType_8h_source.html

package UEFI.Base_Types is

    type EFI_GUID is array(Natural range 0 .. 15) of Character;

    type EFI_STATUS (

