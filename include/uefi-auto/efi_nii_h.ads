pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with efidef_h;
with efibind_h;

package efi_nii_h is

   --  unsupported macro: EFI_NETWORK_INTERFACE_IDENTIFIER_PROTOCOL_GUID { 0xE18541CD, 0xF755, 0x4f73, {0x92, 0x8D, 0x64, 0x3C, 0x8A, 0x79, 0xB2, 0x29} }
   EFI_NETWORK_INTERFACE_IDENTIFIER_PROTOCOL_REVISION : constant := 16#00010000#;  --  ../../gnu-efi/inc/efi_nii.h:23
   --  unsupported macro: EFI_NETWORK_INTERFACE_IDENTIFIER_INTERFACE_REVISION EFI_NETWORK_INTERFACE_IDENTIFIER_PROTOCOL_REVISION

  --++
  --Copyright (c) 2000  Intel Corporation
  --Module name:
  --    efi_nii.h
  --Abstract:
  --Revision history:
  --    2000-Feb-18 M(f)J   GUID updated.
  --                Structure order changed for machine word alignment.
  --                Added StringId[4] to structure.
  --    2000-Feb-14 M(f)J   Genesis.
  ---- 

   subtype EFI_NETWORK_INTERFACE_TYPE is unsigned;
   EFI_NETWORK_INTERFACE_TYPE_EfiNetworkInterfaceUndi : constant EFI_NETWORK_INTERFACE_TYPE := 1;  -- ../../gnu-efi/inc/efi_nii.h:28

   type anon_array2012 is array (0 .. 3) of aliased efidef_h.CHAR8;
   type u_EFI_NETWORK_INTERFACE_IDENTIFIER_PROTOCOL is record
      Revision : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efi_nii.h:32
      ID : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efi_nii.h:35
      ImageAddr : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efi_nii.h:41
      ImageSize : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efi_nii.h:53
      StringId : aliased anon_array2012;  -- ../../gnu-efi/inc/efi_nii.h:57
      c_Type : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efi_nii.h:63
      MajorVer : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efi_nii.h:64
      MinorVer : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efi_nii.h:65
      Ipv6Supported : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efi_nii.h:69
      IfNum : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efi_nii.h:70
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efi_nii.h:30

  -- Revision of the network interface identifier protocol interface.
  -- Address of the first byte of the identifying structure for this
  -- network interface.  This is set to zero if there is no structure.
  -- For PXE/UNDI this is the first byte of the !PXE structure.
  -- Address of the UNrelocated driver/ROM image.  This is set
  -- to zero if there is no driver/ROM image.
  -- For 16-bit UNDI, this is the first byte of the option ROM in
  -- upper memory.
  -- For 32/64-bit S/W UNDI, this is the first byte of the EFI ROM
  -- image.
  -- For H/W UNDI, this is set to zero.
  -- Size of the UNrelocated driver/ROM image of this network interface.
  -- This is set to zero if there is no driver/ROM image.
  -- 4 char ASCII string to go in class identifier (option 60) in DHCP
  -- and Boot Server discover packets.
  -- For EfiNetworkInterfaceUndi this field is "UNDI".
  -- For EfiNetworkInterfaceSnp this field is "SNPN".
  -- Information to be placed into the PXE DHCP and Discover packets.
  -- This is the network interface type and version number that will
  -- be placed into DHCP option 94 (client network interface identifier).
  -- interface number to be used with pxeid structure
   subtype EFI_NETWORK_INTERFACE_IDENTIFIER_PROTOCOL is u_EFI_NETWORK_INTERFACE_IDENTIFIER_PROTOCOL;  -- ../../gnu-efi/inc/efi_nii.h:71

   subtype EFI_NETWORK_INTERFACE_IDENTIFIER_INTERFACE is u_EFI_NETWORK_INTERFACE_IDENTIFIER_PROTOCOL;  -- ../../gnu-efi/inc/efi_nii.h:71

  -- Note: Because it conflicted with the EDK2 struct name, the
  -- 'EFI_NETWORK_INTERFACE_IDENTIFIER_PROTOCOL' GUID definition,
  -- from older versions of gnu-efi, is now obsoleted.
  -- Use 'EFI_NETWORK_INTERFACE_IDENTIFIER_PROTOCOL_GUID' instead.
end efi_nii_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
