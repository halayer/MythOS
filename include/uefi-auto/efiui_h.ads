pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with efidef_h;
with efibind_h;

package efiui_h is

   --  unsupported macro: EFI_UI_INTERFACE_PROTOCOL_GUID { 0x32dd7981, 0x2d27, 0x11d4, {0xbc, 0x8b, 0x0, 0x80, 0xc7, 0x3c, 0x88, 0x81} }
   --  unsupported macro: EFI_UI_PROTOCOL EFI_UI_INTERFACE_PROTOCOL_GUID
   EFI_UI_INTERFACE_PROTOCOL_VERSION : constant := 16#00010000#;  --  ../../gnu-efi/inc/efiui.h:47
   --  unsupported macro: EFI_UI_VERSION EFI_UI_INTERFACE_PROTOCOL_VERSION

  --++
  --Copyright (c) 200  Intel Corporation
  --Module Name:
  --    EfiUi.h
  --Abstract:
  --    Protocol used to build User Interface (UI) stuff.
  --    This protocol is just data. It is a multi dimentional array.
  --    For each string there is an array of UI_STRING_ENTRY. Each string
  --    is for a different language translation of the same string. The list
  --    is terminated by a NULL UiString. There can be any number of
  --    UI_STRING_ENTRY arrays. A NULL array terminates the list. A NULL array
  --    entry contains all zeros.
  --    Thus the shortest possible EFI_UI_PROTOCOL has three UI_STRING_ENTRY.
  --    The String, it's NULL terminator, and the NULL terminator for the entire
  --    thing.
  --Revision History
  ---- 

   type UI_STRING_TYPE is 
     (UiDeviceString,
      UiVendorString,
      UiMaxString)
   with Convention => C;  -- ../../gnu-efi/inc/efiui.h:40

   type UI_STRING_ENTRY is record
      LangCode : access efidef_h.ISO_639_2;  -- ../../gnu-efi/inc/efiui.h:43
      UiString : access efidef_h.CHAR16;  -- ../../gnu-efi/inc/efiui.h:44
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiui.h:45

   type u_EFI_UI_INTERFACE_PROTOCOL is record
      Version : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiui.h:51
      c_Entry : access UI_STRING_ENTRY;  -- ../../gnu-efi/inc/efiui.h:52
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiui.h:50

   subtype EFI_UI_INTERFACE_PROTOCOL is u_EFI_UI_INTERFACE_PROTOCOL;  -- ../../gnu-efi/inc/efiui.h:53

   subtype u_UI_INTERFACE is u_EFI_UI_INTERFACE_PROTOCOL;  -- ../../gnu-efi/inc/efiui.h:55

   subtype UI_INTERFACE is EFI_UI_INTERFACE_PROTOCOL;  -- ../../gnu-efi/inc/efiui.h:56

end efiui_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
