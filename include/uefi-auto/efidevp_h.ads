pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with efibind_h;
with efidef_h;
with System;

package efidevp_h is

   EFI_DP_TYPE_MASK : constant := 16#7F#;  --  ../../gnu-efi/inc/efidevp.h:35
   EFI_DP_TYPE_UNPACKED : constant := 16#80#;  --  ../../gnu-efi/inc/efidevp.h:36

   END_DEVICE_PATH_TYPE : constant := 16#7f#;  --  ../../gnu-efi/inc/efidevp.h:39

   END_ENTIRE_DEVICE_PATH_SUBTYPE : constant := 16#ff#;  --  ../../gnu-efi/inc/efidevp.h:42
   END_INSTANCE_DEVICE_PATH_SUBTYPE : constant := 16#01#;  --  ../../gnu-efi/inc/efidevp.h:43
   --  unsupported macro: END_DEVICE_PATH_LENGTH (sizeof(EFI_DEVICE_PATH_PROTOCOL))
   --  arg-macro: function DP_IS_END_SUBTYPE (a)
   --    return  ((a).SubType = END_ENTIRE_DEVICE_PATH_SUBTYPE ;
   --  arg-macro: function DevicePathType (a)
   --    return  ((a).Type) and EFI_DP_TYPE_MASK ;
   --  arg-macro: function DevicePathSubType (a)
   --    return  (a).SubType ;
   --  arg-macro: function DevicePathNodeLength (a)
   --    return  ((a).Length(0)) or ((a).Length(1) << 8) ;
   --  arg-macro: function NextDevicePathNode (a)
   --    return  (EFI_DEVICE_PATH_PROTOCOL *) ( ((UINT8 *) (a)) + DevicePathNodeLength(a));
   --  arg-macro: function IsDevicePathEndType (a)
   --    return  DevicePathType(a) = END_DEVICE_PATH_TYPE ;
   --  arg-macro: function IsDevicePathEndSubType (a)
   --    return  (a).SubType = END_ENTIRE_DEVICE_PATH_SUBTYPE ;
   --  arg-macro: function IsDevicePathEnd (a)
   --    return  IsDevicePathEndType(a)  and then  IsDevicePathEndSubType(a) ;
   --  arg-macro: function IsDevicePathUnpacked (a)
   --    return  (a).Type and EFI_DP_TYPE_UNPACKED ;
   --  arg-macro: procedure SetDevicePathNodeLength (a, l)
   --    { (a).Length(0) := (UINT8) (l); (a).Length(1) := (UINT8) ((l) >> 8); }
   --  arg-macro: procedure SetDevicePathEndNode (a)
   --    { (a).Type := END_DEVICE_PATH_TYPE; (a).SubType := END_ENTIRE_DEVICE_PATH_SUBTYPE; (a).Length(0) := sizeof(EFI_DEVICE_PATH_PROTOCOL); (a).Length(1) := 0; }

   HARDWARE_DEVICE_PATH : constant := 16#01#;  --  ../../gnu-efi/inc/efidevp.h:78

   HW_PCI_DP : constant := 16#01#;  --  ../../gnu-efi/inc/efidevp.h:80

   HW_PCCARD_DP : constant := 16#02#;  --  ../../gnu-efi/inc/efidevp.h:87

   HW_MEMMAP_DP : constant := 16#03#;  --  ../../gnu-efi/inc/efidevp.h:93

   HW_VENDOR_DP : constant := 16#04#;  --  ../../gnu-efi/inc/efidevp.h:101
   --  unsupported macro: UNKNOWN_DEVICE_GUID { 0xcf31fac5, 0xc24e, 0x11d2, {0x85, 0xf3, 0x0, 0xa0, 0xc9, 0x3e, 0xc9, 0x3b} }

   HW_CONTROLLER_DP : constant := 16#05#;  --  ../../gnu-efi/inc/efidevp.h:115

   ACPI_DEVICE_PATH : constant := 16#02#;  --  ../../gnu-efi/inc/efidevp.h:125

   ACPI_DP : constant := 16#01#;  --  ../../gnu-efi/inc/efidevp.h:127

   EXPANDED_ACPI_DP : constant := 16#02#;  --  ../../gnu-efi/inc/efidevp.h:134

   ACPI_ADR_DP : constant := 3;  --  ../../gnu-efi/inc/efidevp.h:143

   PNP_EISA_ID_CONST : constant := 16#41d0#;  --  ../../gnu-efi/inc/efidevp.h:156
   --  arg-macro: function EISA_ID (_Name, _Num)
   --    return (UINT32) ((_Name) or (_Num) << 16);
   --  arg-macro: function EISA_PNP_ID (_PNPId)
   --    return EISA_ID(PNP_EISA_ID_CONST, (_PNPId));

   PNP_EISA_ID_MASK : constant := 16#ffff#;  --  ../../gnu-efi/inc/efidevp.h:160
   --  arg-macro: function EISA_ID_TO_NUM (_Id)
   --    return (_Id) >> 16;

   MESSAGING_DEVICE_PATH : constant := 16#03#;  --  ../../gnu-efi/inc/efidevp.h:167

   MSG_ATAPI_DP : constant := 16#01#;  --  ../../gnu-efi/inc/efidevp.h:169

   MSG_SCSI_DP : constant := 16#02#;  --  ../../gnu-efi/inc/efidevp.h:177

   MSG_FIBRECHANNEL_DP : constant := 16#03#;  --  ../../gnu-efi/inc/efidevp.h:184

   MSG_FIBRECHANNELEX_DP : constant := 21;  --  ../../gnu-efi/inc/efidevp.h:196

   MSG_1394_DP : constant := 16#04#;  --  ../../gnu-efi/inc/efidevp.h:204

   MSG_USB_DP : constant := 16#05#;  --  ../../gnu-efi/inc/efidevp.h:211

   MSG_SATA_DP : constant := 18;  --  ../../gnu-efi/inc/efidevp.h:222

   MSG_USB_WWID_DP : constant := 16;  --  ../../gnu-efi/inc/efidevp.h:234

   MSG_DEVICE_LOGICAL_UNIT_DP : constant := 17;  --  ../../gnu-efi/inc/efidevp.h:247

   MSG_USB_CLASS_DP : constant := 16#0F#;  --  ../../gnu-efi/inc/efidevp.h:253

   MSG_I2O_DP : constant := 16#06#;  --  ../../gnu-efi/inc/efidevp.h:263

   MSG_MAC_ADDR_DP : constant := 16#0b#;  --  ../../gnu-efi/inc/efidevp.h:269

   MSG_IPv4_DP : constant := 16#0c#;  --  ../../gnu-efi/inc/efidevp.h:276

   MSG_IPv6_DP : constant := 16#0d#;  --  ../../gnu-efi/inc/efidevp.h:290

   MSG_URI_DP : constant := 24;  --  ../../gnu-efi/inc/efidevp.h:309

   MSG_VLAN_DP : constant := 20;  --  ../../gnu-efi/inc/efidevp.h:319

   MSG_INFINIBAND_DP : constant := 16#09#;  --  ../../gnu-efi/inc/efidevp.h:325

   MSG_UART_DP : constant := 16#0e#;  --  ../../gnu-efi/inc/efidevp.h:335

   MSG_VENDOR_DP : constant := 16#0A#;  --  ../../gnu-efi/inc/efidevp.h:345
   --  unsupported macro: EFI_PC_ANSI_GUID { 0xe0c14753, 0xf9be, 0x11d2, {0x9a, 0x0c, 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
   --  unsupported macro: DEVICE_PATH_MESSAGING_PC_ANSI EFI_PC_ANSI_GUID
   --  unsupported macro: EFI_VT_100_GUID { 0xdfa66065, 0xb419, 0x11d3, {0x9a, 0x2d, 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
   --  unsupported macro: DEVICE_PATH_MESSAGING_VT_100 EFI_VT_100_GUID
   --  unsupported macro: EFI_VT_100_PLUS_GUID { 0x7baec70b, 0x57e0, 0x4c76, {0x8e, 0x87, 0x2f, 0x9e, 0x28, 0x08, 0x83, 0x43} }
   --  unsupported macro: DEVICE_PATH_MESSAGING_VT_100_PLUS EFI_VT_100_PLUS_GUID
   --  unsupported macro: EFI_VT_UTF8_GUID { 0xad15a0d6, 0x8bec, 0x4acf, {0xa0, 0x73, 0xd0, 0x1d, 0xe7, 0x7e, 0x2d, 0x88} }
   --  unsupported macro: DEVICE_PATH_MESSAGING_VT_UTF8 EFI_VT_UTF8_GUID

   MEDIA_DEVICE_PATH : constant := 16#04#;  --  ../../gnu-efi/inc/efidevp.h:368

   MEDIA_HARDDRIVE_DP : constant := 16#01#;  --  ../../gnu-efi/inc/efidevp.h:370

   MBR_TYPE_PCAT : constant := 16#01#;  --  ../../gnu-efi/inc/efidevp.h:381
   MBR_TYPE_EFI_PARTITION_TABLE_HEADER : constant := 16#02#;  --  ../../gnu-efi/inc/efidevp.h:382

   SIGNATURE_TYPE_MBR : constant := 16#01#;  --  ../../gnu-efi/inc/efidevp.h:384
   SIGNATURE_TYPE_GUID : constant := 16#02#;  --  ../../gnu-efi/inc/efidevp.h:385

   MEDIA_CDROM_DP : constant := 16#02#;  --  ../../gnu-efi/inc/efidevp.h:387

   MEDIA_VENDOR_DP : constant := 16#03#;  --  ../../gnu-efi/inc/efidevp.h:395

   MEDIA_FILEPATH_DP : constant := 16#04#;  --  ../../gnu-efi/inc/efidevp.h:398
   --  unsupported macro: SIZE_OF_FILEPATH_DEVICE_PATH EFI_FIELD_OFFSET(FILEPATH_DEVICE_PATH,PathName)

   MEDIA_PROTOCOL_DP : constant := 16#05#;  --  ../../gnu-efi/inc/efidevp.h:406

   MEDIA_PIWG_FW_FILE_DP : constant := 6;  --  ../../gnu-efi/inc/efidevp.h:416

   MEDIA_PIWG_FW_VOL_DP : constant := 7;  --  ../../gnu-efi/inc/efidevp.h:426

   MEDIA_RELATIVE_OFFSET_RANGE_DP : constant := 8;  --  ../../gnu-efi/inc/efidevp.h:436

   BBS_DEVICE_PATH : constant := 16#05#;  --  ../../gnu-efi/inc/efidevp.h:448

   BBS_BBS_DP : constant := 16#01#;  --  ../../gnu-efi/inc/efidevp.h:450

   BBS_TYPE_FLOPPY : constant := 16#01#;  --  ../../gnu-efi/inc/efidevp.h:459
   BBS_TYPE_HARDDRIVE : constant := 16#02#;  --  ../../gnu-efi/inc/efidevp.h:460
   BBS_TYPE_CDROM : constant := 16#03#;  --  ../../gnu-efi/inc/efidevp.h:461
   BBS_TYPE_PCMCIA : constant := 16#04#;  --  ../../gnu-efi/inc/efidevp.h:462
   BBS_TYPE_USB : constant := 16#05#;  --  ../../gnu-efi/inc/efidevp.h:463
   BBS_TYPE_EMBEDDED_NETWORK : constant := 16#06#;  --  ../../gnu-efi/inc/efidevp.h:464
   BBS_TYPE_DEV : constant := 16#80#;  --  ../../gnu-efi/inc/efidevp.h:465
   BBS_TYPE_UNKNOWN : constant := 16#FF#;  --  ../../gnu-efi/inc/efidevp.h:466
   --  unsupported macro: EFI_DEVICE_PATH_TO_TEXT_PROTOCOL_GUID { 0x8b843e20, 0x8132, 0x4852, {0x90, 0xcc, 0x55, 0x1a, 0x4e, 0x4a, 0x7f, 0x1c} }
   --  unsupported macro: EFI_DEVICE_PATH_FROM_TEXT_PROTOCOL_GUID { 0x5c99a21, 0xc70f, 0x4ad2, {0x8a, 0x5f, 0x35, 0xdf, 0x33, 0x43, 0xf5, 0x1e} }
   --  unsupported macro: EFI_DEVICE_PATH_UTILITIES_PROTOCOL_GUID { 0x379be4e, 0xd706, 0x437d, {0xb0, 0x37, 0xed, 0xb8, 0x2f, 0xb7, 0x72, 0xa4} }

  --++
  --Copyright (c) 1998  Intel Corporation
  --Module Name:
  --    devpath.h
  --Abstract:
  --    Defines for parsing the EFI Device Path structures
  --Revision History
  ---- 

  -- Device Path structures - Section C
   type anon_array1012 is array (0 .. 1) of aliased efibind_h.UINT8;
   type u_EFI_DEVICE_PATH_PROTOCOL is record
      c_Type : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:27
      c_SubType : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:28
      Length : aliased anon_array1012;  -- ../../gnu-efi/inc/efidevp.h:29
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:26

   subtype EFI_DEVICE_PATH_PROTOCOL is u_EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:30

   subtype u_EFI_DEVICE_PATH is u_EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:32

   subtype EFI_DEVICE_PATH is EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:33

  --#define END_DEVICE_PATH_TYPE                0xff
  --#define END_DEVICE_PATH_TYPE_UNPACKED       0x7f
  --#define IsDevicePathEndType(a)      ( DevicePathType(a) == END_DEVICE_PATH_TYPE_UNPACKED )
  -- * Hardware Device Path (UEFI 2.4 specification, version 2.4 § 9.3.2.)
  --  

   type u_PCI_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:82
      c_Function : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:83
      Device : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:84
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:81

   subtype PCI_DEVICE_PATH is u_PCI_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:85

   type u_PCCARD_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:89
      FunctionNumber : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:90
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:88

   subtype PCCARD_DEVICE_PATH is u_PCCARD_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:91

   type u_MEMMAP_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:95
      MemoryType : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidevp.h:96
      StartingAddress : aliased efidef_h.EFI_PHYSICAL_ADDRESS;  -- ../../gnu-efi/inc/efidevp.h:97
      EndingAddress : aliased efidef_h.EFI_PHYSICAL_ADDRESS;  -- ../../gnu-efi/inc/efidevp.h:98
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:94

   subtype MEMMAP_DEVICE_PATH is u_MEMMAP_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:99

   type u_VENDOR_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:103
      Guid : aliased efidef_h.EFI_GUID;  -- ../../gnu-efi/inc/efidevp.h:104
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:102

   subtype VENDOR_DEVICE_PATH is u_VENDOR_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:105

   type u_UKNOWN_DEVICE_VENDOR_DP is record
      DevicePath : aliased VENDOR_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:111
      LegacyDriveLetter : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:112
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:110

   subtype UNKNOWN_DEVICE_VENDOR_DEVICE_PATH is u_UKNOWN_DEVICE_VENDOR_DP;  -- ../../gnu-efi/inc/efidevp.h:113

   type u_CONTROLLER_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:117
      Controller : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidevp.h:118
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:116

   subtype CONTROLLER_DEVICE_PATH is u_CONTROLLER_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:119

  -- * ACPI Device Path (UEFI 2.4 specification, version 2.4 § 9.3.3 and 9.3.4.)
  --  

   type u_ACPI_HID_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:129
      HID : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidevp.h:130
      UID : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidevp.h:131
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:128

   subtype ACPI_HID_DEVICE_PATH is u_ACPI_HID_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:132

   type anon_array1032 is array (0 .. 0) of aliased efibind_h.UINT8;
   type u_EXPANDED_ACPI_HID_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:136
      HID : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidevp.h:137
      UID : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidevp.h:138
      CID : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidevp.h:139
      HidStr : aliased anon_array1032;  -- ../../gnu-efi/inc/efidevp.h:140
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:135

   subtype EXPANDED_ACPI_HID_DEVICE_PATH is u_EXPANDED_ACPI_HID_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:141

   type u_ACPI_ADR_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:145
      ADR : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidevp.h:146
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:144

   subtype ACPI_ADR_DEVICE_PATH is u_ACPI_ADR_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:147

  -- EISA ID Macro
  -- EISA ID Definition 32-bits
  --  bits[15:0] - three character compressed ASCII EISA ID.
  --  bits[31:16] - binary number
  --   Compressed ASCII is 5 bits per character 0b00001 = 'A' 0b11010 = 'Z'
  -- * Messaging Device Path (UEFI 2.4 specification, version 2.4 § 9.3.5.)
  --  

   type u_ATAPI_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:171
      PrimarySecondary : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:172
      SlaveMaster : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:173
      Lun : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidevp.h:174
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:170

   subtype ATAPI_DEVICE_PATH is u_ATAPI_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:175

   type u_SCSI_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:179
      Pun : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidevp.h:180
      Lun : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidevp.h:181
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:178

   subtype SCSI_DEVICE_PATH is u_SCSI_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:182

   type u_FIBRECHANNEL_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:186
      Reserved : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidevp.h:187
      WWN : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efidevp.h:188
      Lun : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efidevp.h:189
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:185

   subtype FIBRECHANNEL_DEVICE_PATH is u_FIBRECHANNEL_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:190

  --*
  -- * Fibre Channel Ex SubType.
  -- * UEFI 2.0 specification version 2.4 § 9.3.5.6.
  --  

   type anon_array980 is array (0 .. 7) of aliased efibind_h.UINT8;
   type u_FIBRECHANNELEX_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:198
      Reserved : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidevp.h:199
      WWN : aliased anon_array980;  -- ../../gnu-efi/inc/efidevp.h:200
      Lun : aliased anon_array980;  -- ../../gnu-efi/inc/efidevp.h:201
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:197

  -- World Wide Name  
  -- Logical unit, T-10 SCSI Architecture Model 4 specification  
   subtype FIBRECHANNELEX_DEVICE_PATH is u_FIBRECHANNELEX_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:202

   type u_F1394_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:206
      Reserved : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidevp.h:207
      Guid : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efidevp.h:208
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:205

   subtype F1394_DEVICE_PATH is u_F1394_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:209

   type u_USB_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:213
      Port : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:214
      Endpoint : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:215
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:212

   subtype USB_DEVICE_PATH is u_USB_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:216

  --*
  -- * SATA Device Path SubType.
  -- * UEFI 2.0 specification version 2.4 § 9.3.5.6.
  --  

   type u_SATA_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:224
      HBAPortNumber : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidevp.h:225
      PortMultiplierPortNumber : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidevp.h:226
      Lun : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidevp.h:227
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:223

  -- Logical Unit Number  
   subtype SATA_DEVICE_PATH is u_SATA_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:228

  --*
  -- * USB WWID Device Path SubType.
  -- * UEFI 2.0 specification version 2.4 § 9.3.5.7.
  --  

   type anon_array1052 is array (0 .. 0) of aliased efidef_h.CHAR16;
   type u_USB_WWID_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:236
      InterfaceNumber : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidevp.h:237
      VendorId : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidevp.h:238
      ProductId : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidevp.h:239
      SerialNumber : aliased anon_array1052;  -- ../../gnu-efi/inc/efidevp.h:240
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:235

  -- UTF-16 characters of the USB serial number  
   subtype USB_WWID_DEVICE_PATH is u_USB_WWID_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:241

  --*
  -- * Device Logical Unit SubType.
  -- * UEFI 2.0 specification version 2.4 § 9.3.5.8.
  --  

   type u_DEVICE_LOGICAL_UNIT_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:249
      Lun : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:250
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:248

  -- Logical Unit Number  
   subtype DEVICE_LOGICAL_UNIT_DEVICE_PATH is u_DEVICE_LOGICAL_UNIT_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:251

   type u_USB_CLASS_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:255
      VendorId : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidevp.h:256
      ProductId : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidevp.h:257
      DeviceClass : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:258
      DeviceSubclass : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:259
      DeviceProtocol : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:260
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:254

   subtype USB_CLASS_DEVICE_PATH is u_USB_CLASS_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:261

   type u_I2O_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:265
      Tid : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidevp.h:266
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:264

   subtype I2O_DEVICE_PATH is u_I2O_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:267

   type u_MAC_ADDR_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:271
      MacAddress : aliased efidef_h.EFI_MAC_ADDRESS;  -- ../../gnu-efi/inc/efidevp.h:272
      IfType : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:273
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:270

   subtype MAC_ADDR_DEVICE_PATH is u_MAC_ADDR_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:274

   type u_IPv4_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:278
      LocalIpAddress : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efidevp.h:279
      RemoteIpAddress : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efidevp.h:280
      LocalPort : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidevp.h:281
      RemotePort : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidevp.h:282
      Protocol : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidevp.h:283
      StaticIpAddress : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efidevp.h:284
      GatewayIpAddress : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efidevp.h:286
      SubnetMask : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efidevp.h:287
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:277

  -- new from UEFI version 2, code must check Length field in Header  
   subtype IPv4_DEVICE_PATH is u_IPv4_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:288

   type u_IPv6_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:292
      LocalIpAddress : aliased efidef_h.EFI_IPv6_ADDRESS;  -- ../../gnu-efi/inc/efidevp.h:293
      RemoteIpAddress : aliased efidef_h.EFI_IPv6_ADDRESS;  -- ../../gnu-efi/inc/efidevp.h:294
      LocalPort : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidevp.h:295
      RemotePort : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidevp.h:296
      Protocol : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidevp.h:297
      IPAddressOrigin : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efidevp.h:298
      PrefixLength : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:300
      GatewayIpAddress : aliased efidef_h.EFI_IPv6_ADDRESS;  -- ../../gnu-efi/inc/efidevp.h:301
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:291

  -- new from UEFI version 2, code must check Length field in Header  
   subtype IPv6_DEVICE_PATH is u_IPv6_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:302

  --*
  -- * Uniform Resource Identifiers SubType.
  -- * UEFI 2.0 specification version 2.4C § 9.3.5.23.
  --  

   type anon_array1068 is array (0 .. 0) of aliased efidef_h.CHAR8;
   type u_URI_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:311
      Uri : aliased anon_array1068;  -- ../../gnu-efi/inc/efidevp.h:312
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:310

   subtype URI_DEVICE_PATH is u_URI_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:313

  --*
  -- * Device Logical Unit SubType.
  -- * UEFI 2.0 specification version 2.4 § 9.3.5.8.
  --  

   type u_VLAN_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:321
      VlanId : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidevp.h:322
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:320

   subtype VLAN_DEVICE_PATH is u_VLAN_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:323

   type anon_array992 is array (0 .. 15) of aliased efibind_h.UINT8;
   type u_INFINIBAND_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:327
      ResourceFlags : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidevp.h:328
      PortGid : aliased anon_array992;  -- ../../gnu-efi/inc/efidevp.h:329
      ServiceId : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efidevp.h:330
      TargetPortId : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efidevp.h:331
      DeviceId : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efidevp.h:332
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:326

   subtype INFINIBAND_DEVICE_PATH is u_INFINIBAND_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:333

   type u_UART_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:337
      Reserved : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidevp.h:338
      BaudRate : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efidevp.h:339
      DataBits : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:340
      Parity : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:341
      StopBits : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:342
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:336

   subtype UART_DEVICE_PATH is u_UART_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:343

  -- Use VENDOR_DEVICE_PATH struct  
  -- * Media Device Path (UEFI 2.4 specification, version 2.4 § 9.3.6.)
  --  

   type u_HARDDRIVE_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:372
      PartitionNumber : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidevp.h:373
      PartitionStart : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efidevp.h:374
      PartitionSize : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efidevp.h:375
      Signature : aliased anon_array992;  -- ../../gnu-efi/inc/efidevp.h:376
      MBRType : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:377
      SignatureType : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidevp.h:378
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:371

   subtype HARDDRIVE_DEVICE_PATH is u_HARDDRIVE_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:379

   type u_CDROM_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:389
      BootEntry : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidevp.h:390
      PartitionStart : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efidevp.h:391
      PartitionSize : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efidevp.h:392
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:388

   subtype CDROM_DEVICE_PATH is u_CDROM_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:393

  -- Use VENDOR_DEVICE_PATH struct  
   type u_FILEPATH_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:400
      PathName : aliased anon_array1052;  -- ../../gnu-efi/inc/efidevp.h:401
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:399

   subtype FILEPATH_DEVICE_PATH is u_FILEPATH_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:402

   type u_MEDIA_PROTOCOL_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:408
      Protocol : aliased efidef_h.EFI_GUID;  -- ../../gnu-efi/inc/efidevp.h:409
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:407

   subtype MEDIA_PROTOCOL_DEVICE_PATH is u_MEDIA_PROTOCOL_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:410

  --*
  -- * PIWG Firmware File SubType.
  -- * UEFI 2.0 specification version 2.4 § 9.3.6.6.
  --  

   type u_MEDIA_FW_VOL_FILEPATH_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:418
      FvFileName : aliased efidef_h.EFI_GUID;  -- ../../gnu-efi/inc/efidevp.h:419
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:417

   subtype MEDIA_FW_VOL_FILEPATH_DEVICE_PATH is u_MEDIA_FW_VOL_FILEPATH_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:420

  --*
  -- * PIWG Firmware Volume Device Path SubType.
  -- * UEFI 2.0 specification version 2.4 § 9.3.6.7.
  --  

   type u_MEDIA_FW_VOL_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:428
      FvName : aliased efidef_h.EFI_GUID;  -- ../../gnu-efi/inc/efidevp.h:429
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:427

   subtype MEDIA_FW_VOL_DEVICE_PATH is u_MEDIA_FW_VOL_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:430

  --*
  -- * Media relative offset range device path.
  -- * UEFI 2.0 specification version 2.4 § 9.3.6.8.
  --  

   type u_MEDIA_RELATIVE_OFFSET_RANGE_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:438
      Reserved : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidevp.h:439
      StartingOffset : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efidevp.h:440
      EndingOffset : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efidevp.h:441
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:437

   subtype MEDIA_RELATIVE_OFFSET_RANGE_DEVICE_PATH is u_MEDIA_RELATIVE_OFFSET_RANGE_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:442

  -- * BIOS Boot Specification Device Path (UEFI 2.4 specification, version 2.4 § 9.3.7.)
  --  

   type u_BBS_BBS_DEVICE_PATH is record
      Header : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:452
      DeviceType : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidevp.h:453
      StatusFlag : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidevp.h:454
      String : aliased anon_array1068;  -- ../../gnu-efi/inc/efidevp.h:455
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:451

   subtype BBS_BBS_DEVICE_PATH is u_BBS_BBS_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:456

  -- DeviceType definitions - from BBS specification  
   type EFI_DEV_PATH (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            DevPath : aliased EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:469
         when 1 =>
            Pci : aliased PCI_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:470
         when 2 =>
            PcCard : aliased PCCARD_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:471
         when 3 =>
            MemMap : aliased MEMMAP_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:472
         when 4 =>
            Vendor : aliased VENDOR_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:473
         when 5 =>
            UnknownVendor : aliased UNKNOWN_DEVICE_VENDOR_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:474
         when 6 =>
            Controller : aliased CONTROLLER_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:475
         when 7 =>
            Acpi : aliased ACPI_HID_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:476
         when 8 =>
            Atapi : aliased ATAPI_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:478
         when 9 =>
            Scsi : aliased SCSI_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:479
         when 10 =>
            FibreChannel : aliased FIBRECHANNEL_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:480
         when 11 =>
            F1394 : aliased F1394_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:482
         when 12 =>
            Usb : aliased USB_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:483
         when 13 =>
            UsbClass : aliased USB_CLASS_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:484
         when 14 =>
            I2O : aliased I2O_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:485
         when 15 =>
            MacAddr : aliased MAC_ADDR_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:486
         when 16 =>
            Ipv4 : aliased IPv4_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:487
         when 17 =>
            Ipv6 : aliased IPv6_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:488
         when 18 =>
            Uri : aliased URI_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:489
         when 19 =>
            InfiniBand : aliased INFINIBAND_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:490
         when 20 =>
            Uart : aliased UART_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:491
         when 21 =>
            HardDrive : aliased HARDDRIVE_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:493
         when 22 =>
            CD : aliased CDROM_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:494
         when 23 =>
            FilePath : aliased FILEPATH_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:496
         when 24 =>
            MediaProtocol : aliased MEDIA_PROTOCOL_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:497
         when others =>
            Bbs : aliased BBS_BBS_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:499
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- ../../gnu-efi/inc/efidevp.h:501

   type EFI_DEV_PATH_PTR (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            DevPath : access EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:504
         when 1 =>
            Pci : access PCI_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:505
         when 2 =>
            PcCard : access PCCARD_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:506
         when 3 =>
            MemMap : access MEMMAP_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:507
         when 4 =>
            Vendor : access VENDOR_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:508
         when 5 =>
            UnknownVendor : access UNKNOWN_DEVICE_VENDOR_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:509
         when 6 =>
            Controller : access CONTROLLER_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:510
         when 7 =>
            Acpi : access ACPI_HID_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:511
         when 8 =>
            Atapi : access ATAPI_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:513
         when 9 =>
            Scsi : access SCSI_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:514
         when 10 =>
            FibreChannel : access FIBRECHANNEL_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:515
         when 11 =>
            F1394 : access F1394_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:517
         when 12 =>
            Usb : access USB_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:518
         when 13 =>
            UsbClass : access USB_CLASS_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:519
         when 14 =>
            I2O : access I2O_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:520
         when 15 =>
            MacAddr : access MAC_ADDR_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:521
         when 16 =>
            Ipv4 : access IPv4_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:522
         when 17 =>
            Ipv6 : access IPv6_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:523
         when 18 =>
            Uri : access URI_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:524
         when 19 =>
            InfiniBand : access INFINIBAND_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:525
         when 20 =>
            Uart : access UART_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:526
         when 21 =>
            HardDrive : access HARDDRIVE_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:528
         when 22 =>
            FilePath : access FILEPATH_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:530
         when 23 =>
            MediaProtocol : access MEDIA_PROTOCOL_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:531
         when 24 =>
            CD : access CDROM_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:533
         when others =>
            Bbs : access BBS_BBS_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:534
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- ../../gnu-efi/inc/efidevp.h:536

   type EFI_DEVICE_PATH_TO_TEXT_NODE is access function
        (arg1 : access constant EFI_DEVICE_PATH_PROTOCOL;
         arg2 : efidef_h.BOOLEAN;
         arg3 : efidef_h.BOOLEAN) return access efidef_h.CHAR16
   with Convention => C;  -- ../../gnu-efi/inc/efidevp.h:543

   type EFI_DEVICE_PATH_TO_TEXT_PATH is access function
        (arg1 : access constant EFI_DEVICE_PATH_PROTOCOL;
         arg2 : efidef_h.BOOLEAN;
         arg3 : efidef_h.BOOLEAN) return access efidef_h.CHAR16
   with Convention => C;  -- ../../gnu-efi/inc/efidevp.h:551

   type u_EFI_DEVICE_PATH_TO_TEXT_PROTOCOL is record
      ConvertDeviceNodeToText : EFI_DEVICE_PATH_TO_TEXT_NODE;  -- ../../gnu-efi/inc/efidevp.h:558
      ConvertDevicePathToText : EFI_DEVICE_PATH_TO_TEXT_PATH;  -- ../../gnu-efi/inc/efidevp.h:559
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:557

   subtype EFI_DEVICE_PATH_TO_TEXT_PROTOCOL is u_EFI_DEVICE_PATH_TO_TEXT_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:560

   type EFI_DEVICE_PATH_FROM_TEXT_NODE is access function (arg1 : access efidef_h.CHAR16) return access EFI_DEVICE_PATH_PROTOCOL
   with Convention => C;  -- ../../gnu-efi/inc/efidevp.h:567

   type EFI_DEVICE_PATH_FROM_TEXT_PATH is access function (arg1 : access efidef_h.CHAR16) return access EFI_DEVICE_PATH_PROTOCOL
   with Convention => C;  -- ../../gnu-efi/inc/efidevp.h:573

   type EFI_DEVICE_PATH_FROM_TEXT_PROTOCOL is record
      ConvertTextToDeviceNode : EFI_DEVICE_PATH_FROM_TEXT_NODE;  -- ../../gnu-efi/inc/efidevp.h:578
      ConvertTextToDevicePath : EFI_DEVICE_PATH_FROM_TEXT_PATH;  -- ../../gnu-efi/inc/efidevp.h:579
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:580

   type EFI_DEVICE_PATH_UTILS_GET_DEVICE_PATH_SIZE is access function (arg1 : access constant EFI_DEVICE_PATH_PROTOCOL) return efibind_h.UINTN
   with Convention => C;  -- ../../gnu-efi/inc/efidevp.h:587

   type EFI_DEVICE_PATH_UTILS_DUP_DEVICE_PATH is access function (arg1 : access constant EFI_DEVICE_PATH_PROTOCOL) return access EFI_DEVICE_PATH_PROTOCOL
   with Convention => C;  -- ../../gnu-efi/inc/efidevp.h:593

   type EFI_DEVICE_PATH_UTILS_APPEND_PATH is access function (arg1 : access constant EFI_DEVICE_PATH_PROTOCOL; arg2 : access constant EFI_DEVICE_PATH_PROTOCOL) return access EFI_DEVICE_PATH_PROTOCOL
   with Convention => C;  -- ../../gnu-efi/inc/efidevp.h:599

   type EFI_DEVICE_PATH_UTILS_APPEND_NODE is access function (arg1 : access constant EFI_DEVICE_PATH_PROTOCOL; arg2 : access constant EFI_DEVICE_PATH_PROTOCOL) return access EFI_DEVICE_PATH_PROTOCOL
   with Convention => C;  -- ../../gnu-efi/inc/efidevp.h:606

   type EFI_DEVICE_PATH_UTILS_APPEND_INSTANCE is access function (arg1 : access constant EFI_DEVICE_PATH_PROTOCOL; arg2 : access constant EFI_DEVICE_PATH_PROTOCOL) return access EFI_DEVICE_PATH_PROTOCOL
   with Convention => C;  -- ../../gnu-efi/inc/efidevp.h:613

   type EFI_DEVICE_PATH_UTILS_GET_NEXT_INSTANCE is access function (arg1 : System.Address; arg2 : access efibind_h.UINTN) return access EFI_DEVICE_PATH_PROTOCOL
   with Convention => C;  -- ../../gnu-efi/inc/efidevp.h:620

   type EFI_DEVICE_PATH_UTILS_CREATE_NODE is access function
        (arg1 : efibind_h.UINT8;
         arg2 : efibind_h.UINT8;
         arg3 : efibind_h.UINT16) return access EFI_DEVICE_PATH_PROTOCOL
   with Convention => C;  -- ../../gnu-efi/inc/efidevp.h:627

   type EFI_DEVICE_PATH_UTILS_IS_MULTI_INSTANCE is access function (arg1 : access constant EFI_DEVICE_PATH_PROTOCOL) return efidef_h.BOOLEAN
   with Convention => C;  -- ../../gnu-efi/inc/efidevp.h:635

   type u_EFI_DEVICE_PATH_UTILITIES_PROTOCOL is record
      GetDevicePathSize : EFI_DEVICE_PATH_UTILS_GET_DEVICE_PATH_SIZE;  -- ../../gnu-efi/inc/efidevp.h:640
      DuplicateDevicePath : EFI_DEVICE_PATH_UTILS_DUP_DEVICE_PATH;  -- ../../gnu-efi/inc/efidevp.h:641
      AppendDevicePath : EFI_DEVICE_PATH_UTILS_APPEND_PATH;  -- ../../gnu-efi/inc/efidevp.h:642
      AppendDeviceNode : EFI_DEVICE_PATH_UTILS_APPEND_NODE;  -- ../../gnu-efi/inc/efidevp.h:643
      AppendDevicePathInstance : EFI_DEVICE_PATH_UTILS_APPEND_INSTANCE;  -- ../../gnu-efi/inc/efidevp.h:644
      GetNextDevicePathInstance : EFI_DEVICE_PATH_UTILS_GET_NEXT_INSTANCE;  -- ../../gnu-efi/inc/efidevp.h:645
      IsDevicePathMultiInstance : EFI_DEVICE_PATH_UTILS_IS_MULTI_INSTANCE;  -- ../../gnu-efi/inc/efidevp.h:646
      CreateDeviceNode : EFI_DEVICE_PATH_UTILS_CREATE_NODE;  -- ../../gnu-efi/inc/efidevp.h:647
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidevp.h:639

   subtype EFI_DEVICE_PATH_UTILITIES_PROTOCOL is u_EFI_DEVICE_PATH_UTILITIES_PROTOCOL;  -- ../../gnu-efi/inc/efidevp.h:648

end efidevp_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
