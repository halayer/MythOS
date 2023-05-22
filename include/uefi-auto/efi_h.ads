pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package efi_h is

   --  unsupported macro: EFI_FIRMWARE_VENDOR L"INTEL"
   EFI_FIRMWARE_MAJOR_REVISION : constant := 12;  --  ../../gnu-efi/inc/efi.h:37
   EFI_FIRMWARE_MINOR_REVISION : constant := 33;  --  ../../gnu-efi/inc/efi.h:38
   --  unsupported macro: EFI_FIRMWARE_REVISION ((EFI_FIRMWARE_MAJOR_REVISION <<16) | (EFI_FIRMWARE_MINOR_REVISION))

  --++
  --Copyright (c) 1998  Intel Corporation
  --Module Name:
  --    efi.h
  --Abstract:
  --    Public EFI header files
  --Revision History
  ---- 

  -- Add a predefined macro to detect usage of the library
  -- Build flags on input
  --  EFI32
  --  EFI_DEBUG               - Enable debugging code
  --  EFI_NT_EMULATOR         - Building for running under NT
end efi_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
