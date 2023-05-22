pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with efidef_h;
with efibind_h;
with System;
limited with efidevp_h;
limited with efiapi_h;

package efiprot_h is

   --  unsupported macro: EFI_FPSWA_PROTOCOL_GUID { 0xc41b6531, 0x97b9, 0x11d3, {0x9a, 0x29, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
   --  unsupported macro: FPSWA_PROTOCOL EFI_FPSWA_PROTOCOL_GUID
   --  unsupported macro: EFI_DEVICE_PATH_PROTOCOL_GUID { 0x9576e91, 0x6d3f, 0x11d2, {0x8e, 0x39, 0x0, 0xa0, 0xc9, 0x69, 0x72, 0x3b} }
   --  unsupported macro: DEVICE_PATH_PROTOCOL EFI_DEVICE_PATH_PROTOCOL_GUID
   --  unsupported macro: EFI_BLOCK_IO_PROTOCOL_GUID { 0x964e5b21, 0x6459, 0x11d2, {0x8e, 0x39, 0x0, 0xa0, 0xc9, 0x69, 0x72, 0x3b} }
   --  unsupported macro: BLOCK_IO_PROTOCOL EFI_BLOCK_IO_PROTOCOL_GUID
   EFI_BLOCK_IO_PROTOCOL_REVISION : constant := 16#00010000#;  --  ../../gnu-efi/inc/efiprot.h:46
   EFI_BLOCK_IO_PROTOCOL_REVISION2 : constant := 16#00020001#;  --  ../../gnu-efi/inc/efiprot.h:47
   --  unsupported macro: EFI_BLOCK_IO_PROTOCOL_REVISION3 ((2<<16) | 31)
   --  unsupported macro: EFI_BLOCK_IO_INTERFACE_REVISION EFI_BLOCK_IO_PROTOCOL_REVISION
   --  unsupported macro: EFI_BLOCK_IO_INTERFACE_REVISION2 EFI_BLOCK_IO_PROTOCOL_REVISION2
   --  unsupported macro: EFI_BLOCK_IO_INTERFACE_REVISION3 EFI_BLOCK_IO_PROTOCOL_REVISION3
   --  unsupported macro: EFI_BLOCK_IO2_PROTOCOL_GUID { 0xa77b2472, 0xe282, 0x4e9f, {0xa2, 0x45, 0xc2, 0xc0, 0xe2, 0x7b, 0xbc, 0xc1} }
   --  unsupported macro: EFI_DISK_IO_PROTOCOL_GUID { 0xce345171, 0xba0b, 0x11d2, {0x8e, 0x4f, 0x0, 0xa0, 0xc9, 0x69, 0x72, 0x3b} }
   --  unsupported macro: DISK_IO_PROTOCOL EFI_DISK_IO_PROTOCOL_GUID

   EFI_DISK_IO_PROTOCOL_REVISION : constant := 16#00010000#;  --  ../../gnu-efi/inc/efiprot.h:190
   --  unsupported macro: EFI_DISK_IO_INTERFACE_REVISION EFI_DISK_IO_PROTOCOL_REVISION
   --  unsupported macro: EFI_DISK_IO2_PROTOCOL_GUID { 0x151c8eae, 0x7f2c, 0x472c, {0x9e, 0x54, 0x98, 0x28, 0x19, 0x4f, 0x6a, 0x88} }

   EFI_DISK_IO2_PROTOCOL_REVISION : constant := 16#00020000#;  --  ../../gnu-efi/inc/efiprot.h:230
   --  unsupported macro: EFI_SIMPLE_FILE_SYSTEM_PROTOCOL_GUID { 0x964e5b22, 0x6459, 0x11d2, {0x8e, 0x39, 0x0, 0xa0, 0xc9, 0x69, 0x72, 0x3b} }
   --  unsupported macro: SIMPLE_FILE_SYSTEM_PROTOCOL EFI_SIMPLE_FILE_SYSTEM_PROTOCOL_GUID

   EFI_SIMPLE_FILE_SYSTEM_PROTOCOL_REVISION : constant := 16#00010000#;  --  ../../gnu-efi/inc/efiprot.h:300
   --  unsupported macro: EFI_FILE_IO_INTERFACE_REVISION EFI_SIMPLE_FILE_SYSTEM_PROTOCOL_REVISION

   EFI_FILE_MODE_READ : constant := 16#0000000000000001#;  --  ../../gnu-efi/inc/efiprot.h:326
   EFI_FILE_MODE_WRITE : constant := 16#0000000000000002#;  --  ../../gnu-efi/inc/efiprot.h:327
   EFI_FILE_MODE_CREATE : constant := 16#8000000000000000#;  --  ../../gnu-efi/inc/efiprot.h:328

   EFI_FILE_READ_ONLY : constant := 16#0000000000000001#;  --  ../../gnu-efi/inc/efiprot.h:331
   EFI_FILE_HIDDEN : constant := 16#0000000000000002#;  --  ../../gnu-efi/inc/efiprot.h:332
   EFI_FILE_SYSTEM : constant := 16#0000000000000004#;  --  ../../gnu-efi/inc/efiprot.h:333
   EFI_FILE_RESERVIED : constant := 16#0000000000000008#;  --  ../../gnu-efi/inc/efiprot.h:334
   EFI_FILE_DIRECTORY : constant := 16#0000000000000010#;  --  ../../gnu-efi/inc/efiprot.h:335
   EFI_FILE_ARCHIVE : constant := 16#0000000000000020#;  --  ../../gnu-efi/inc/efiprot.h:336
   EFI_FILE_VALID_ATTR : constant := 16#0000000000000037#;  --  ../../gnu-efi/inc/efiprot.h:337

   EFI_FILE_PROTOCOL_REVISION : constant := 16#00010000#;  --  ../../gnu-efi/inc/efiprot.h:444
   EFI_FILE_PROTOCOL_REVISION2 : constant := 16#00020000#;  --  ../../gnu-efi/inc/efiprot.h:445
   --  unsupported macro: EFI_FILE_PROTOCOL_LATEST_REVISION EFI_FILE_PROTOCOL_REVISION2
   --  unsupported macro: EFI_FILE_HANDLE_REVISION EFI_FILE_PROTOCOL_REVISION
   --  unsupported macro: EFI_FILE_INFO_ID { 0x9576e92, 0x6d3f, 0x11d2, {0x8e, 0x39, 0x0, 0xa0, 0xc9, 0x69, 0x72, 0x3b} }
   --  unsupported macro: SIZE_OF_EFI_FILE_INFO EFI_FIELD_OFFSET(EFI_FILE_INFO,FileName)
   --  unsupported macro: EFI_FILE_SYSTEM_INFO_ID { 0x9576e93, 0x6d3f, 0x11d2, {0x8e, 0x39, 0x0, 0xa0, 0xc9, 0x69, 0x72, 0x3b} }
   --  unsupported macro: SIZE_OF_EFI_FILE_SYSTEM_INFO EFI_FIELD_OFFSET(EFI_FILE_SYSTEM_INFO,VolumeLabel)
   --  unsupported macro: EFI_FILE_SYSTEM_VOLUME_LABEL_ID { 0xDB47D7D3,0xFE81, 0x11d3, {0x9A, 0x35, 0x00, 0x90, 0x27, 0x3F, 0xC1, 0x4D} }
   --  unsupported macro: SIZE_OF_EFI_FILE_SYSTEM_VOLUME_LABEL_INFO EFI_FIELD_OFFSET(EFI_FILE_SYSTEM_VOLUME_LABEL,VolumeLabel)
   --  unsupported macro: EFI_FILE_SYSTEM_VOLUME_LABEL_INFO_ID EFI_FILE_SYSTEM_VOLUME_LABEL_ID
   --  unsupported macro: EFI_FILE_SYSTEM_VOLUME_LABEL_INFO EFI_FILE_SYSTEM_VOLUME_LABEL
   --  unsupported macro: EFI_LOAD_FILE_PROTOCOL_GUID { 0x56EC3091, 0x954C, 0x11d2, {0x8E, 0x3F, 0x00, 0xA0, 0xC9, 0x69, 0x72, 0x3B} }
   --  unsupported macro: LOAD_FILE_PROTOCOL EFI_LOAD_FILE_PROTOCOL_GUID
   --  unsupported macro: EFI_DEVICE_IO_PROTOCOL_GUID { 0xaf6ac311, 0x84c3, 0x11d2, {0x8e, 0x3c, 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b} }
   --  unsupported macro: DEVICE_IO_PROTOCOL EFI_DEVICE_IO_PROTOCOL_GUID
   --  arg-macro: function EFI_PCI_ADDRESS (_bus, _dev, _func)
   --    return  (UINT64) ( (((UINTN)_bus) << 24) + (((UINTN)_dev) << 16) + (((UINTN)_func) << 8) ) ;
   --  unsupported macro: EFI_UNICODE_COLLATION_PROTOCOL_GUID { 0x1d85cd7f, 0xf43d, 0x11d2, {0x9a, 0xc, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
   --  unsupported macro: UNICODE_COLLATION_PROTOCOL EFI_UNICODE_COLLATION_PROTOCOL_GUID
   --  unsupported macro: EFI_UNICODE_BYTE_ORDER_MARK (CHAR16)(0xfeff)
   --  unsupported macro: UNICODE_BYTE_ORDER_MARK EFI_UNICODE_BYTE_ORDER_MARK
   --  unsupported macro: EFI_HASH_PROTOCOL_GUID { 0xC5184932, 0xDBA5, 0x46DB, { 0xA5, 0xBA, 0xCC, 0x0B, 0xDA, 0x9C, 0x14, 0x35 } }
   --  unsupported macro: HASH_PROTOCOL EFI_HASH_PROTOCOL_GUID
   --  unsupported macro: EFI_HASH_ALGORITHM_SHA1_GUID { 0x2AE9D80F, 0x3FB2, 0x4095, { 0xB7, 0xB1, 0xE9, 0x31, 0x57, 0xB9, 0x46, 0xB6 } }
   --  unsupported macro: EFI_HASH_ALGORITHM_SHA1 EFI_HASH_ALGORITHM_SHA1_GUID
   --  unsupported macro: EFI_HASH_ALGORITHM_SHA224_GUID { 0x8DF01A06, 0x9BD5, 0x4BF7, { 0xB0, 0x21, 0xDB, 0x4F, 0xD9, 0xCC, 0xF4, 0x5B } }
   --  unsupported macro: EFI_HASH_ALGORITHM_SHA224 EFI_HASH_ALGORITHM_SHA224_GUID
   --  unsupported macro: EFI_HASH_ALGORITHM_SHA256_GUID { 0x51AA59DE, 0xFDF2, 0x4EA3, { 0xBC, 0x63, 0x87, 0x5F, 0xB7, 0x84, 0x2E, 0xE9 } }
   --  unsupported macro: EFI_HASH_ALGORITHM_SHA256 EFI_HASH_ALGORITHM_SHA256_GUID
   --  unsupported macro: EFI_HASH_ALGORITHM_SHA384_GUID { 0xEFA96432, 0xDE33, 0x4DD2, { 0xAE, 0xE6, 0x32, 0x8C, 0x33, 0xDF, 0x77, 0x7A } }
   --  unsupported macro: EFI_HASH_ALGORITHM_SHA384 EFI_HASH_ALGORITHM_SHA384_GUID
   --  unsupported macro: EFI_HASH_ALGORITHM_SHA512_GUID { 0xCAA4381E, 0x750C, 0x4770, { 0xB8, 0x70, 0x7A, 0x23, 0xB4, 0xE4, 0x21, 0x30 } }
   --  unsupported macro: EFI_HASH_ALGORITHM_SHA512 EFI_HASH_ALGORITHM_SHA512_GUID
   --  unsupported macro: EFI_HASH_ALGORITHM_MD5_GUID { 0x0AF7C79C, 0x65B5, 0x4319, { 0xB0, 0xAE, 0x44, 0xEC, 0x48, 0x4E, 0x4A, 0xD7 } }
   --  unsupported macro: EFI_HASH_ALGORITHM_MD5 EFI_HASH_ALGORITHM_MD5_GUID
   --  unsupported macro: EFI_HASH_ALGORITHM_SHA1_NOPAD_GUID { 0x24C5DC2F, 0x53E2, 0x40CA, { 0x9E, 0xD6, 0xA5, 0xD9, 0xA4, 0x9F, 0x46, 0x3B } }
   --  unsupported macro: EFI_HASH_ALGORITHM_SHA1_NOPAD EFI_HASH_ALGORITHM_SHA1_NOPAD_GUID
   --  unsupported macro: EFI_HASH_ALGORITHM_SHA256_NOPAD_GUID { 0x8628752A, 0x6CB7, 0x4814, { 0x96, 0xFC, 0x24, 0xA8, 0x15, 0xAC, 0x22, 0x26 } }
   --  unsupported macro: EFI_HASH_ALGORITHM_SHA256_NOPAD EFI_HASH_ALGORITHM_SHA256_NOPAD_GUID
   --  unsupported macro: EFI_GRAPHICS_OUTPUT_PROTOCOL_GUID { 0x9042a9de, 0x23dc, 0x4a38, {0x96, 0xfb, 0x7a, 0xde, 0xd0, 0x80, 0x51, 0x6a } }
   --  unsupported macro: EFI_EDID_DISCOVERED_PROTOCOL_GUID { 0x1C0C34F6, 0xD380, 0x41FA, { 0xA0, 0x49, 0x8a, 0xD0, 0x6C, 0x1A, 0x66, 0xAA} }
   --  unsupported macro: EFI_EDID_ACTIVE_PROTOCOL_GUID { 0xBD8C1056, 0x9F36, 0x44EC, { 0x92, 0xA8, 0xA6, 0x33, 0x7F, 0x81, 0x79, 0x86} }
   --  unsupported macro: EFI_EDID_OVERRIDE_PROTOCOL_GUID { 0x48ECB431, 0xFB72, 0x45C0, { 0xA9, 0x22, 0xF4, 0x58, 0xFE, 0x04, 0x0B, 0xD5} }
   --  unsupported macro: EFI_DRIVER_BINDING_PROTOCOL_GUID { 0x18A031AB, 0xB443, 0x4D1A, { 0xA5, 0xC0, 0x0C, 0x09, 0x26, 0x1E, 0x9F, 0x71} }
   --  unsupported macro: DRIVER_BINDING_PROTOCOL EFI_DRIVER_BINDING_PROTOCOL_GUID
   --  unsupported macro: EFI_DRIVER_SUPPORTED EFI_DRIVER_BINDING_PROTOCOL_SUPPORTED
   --  unsupported macro: EFI_DRIVER_START EFI_DRIVER_BINDING_PROTOCOL_START
   --  unsupported macro: EFI_DRIVER_STOP EFI_DRIVER_BINDING_PROTOCOL_STOP
   --  unsupported macro: EFI_COMPONENT_NAME_PROTOCOL_GUID {0x107A772C, 0xD5E1, 0x11D4, { 0x9A, 0x46, 0x00, 0x90, 0x27, 0x3F, 0xC1, 0x4D} }
   --  unsupported macro: COMPONENT_NAME_PROTOCOL EFI_COMPONENT_NAME_PROTOCOL_GUID
   --  unsupported macro: EFI_COMPONENT_NAME2_PROTOCOL_GUID {0x6A7A5CFF, 0xE8D9, 0x4F70, { 0xBA, 0xDA, 0x75, 0xAB, 0x30, 0x25, 0xCE, 0x14} }
   --  unsupported macro: COMPONENT_NAME2_PROTOCOL EFI_COMPONENT_NAME2_PROTOCOL_GUID
   --  unsupported macro: EFI_LOADED_IMAGE_PROTOCOL_GUID { 0x5B1B31A1, 0x9562, 0x11d2, {0x8E, 0x3F, 0x00, 0xA0, 0xC9, 0x69, 0x72, 0x3B} }
   --  unsupported macro: LOADED_IMAGE_PROTOCOL EFI_LOADED_IMAGE_PROTOCOL_GUID

   EFI_LOADED_IMAGE_PROTOCOL_REVISION : constant := 16#1000#;  --  ../../gnu-efi/inc/efiprot.h:1217
   --  unsupported macro: EFI_IMAGE_INFORMATION_REVISION EFI_LOADED_IMAGE_PROTOCOL_REVISION
   --  unsupported macro: EFI_LOADED_IMAGE_DEVICE_PATH_PROTOCOL_GUID {0xbc62157e, 0x3e33, 0x4fec, {0x99, 0x20, 0x2d, 0x3b, 0x36, 0xd7, 0x50, 0xdf} }
   --  unsupported macro: EFI_RNG_PROTOCOL_GUID { 0x3152bca5, 0xeade, 0x433d, {0x86, 0x2e, 0xc0, 0x1c, 0xdc, 0x29, 0x1f, 0x44} }
   --  unsupported macro: EFI_RNG_ALGORITHM_SP800_90_HASH_256_GUID {0xa7af67cb, 0x603b, 0x4d42, {0xba, 0x21, 0x70, 0xbf, 0xb6, 0x29, 0x3f, 0x96} }
   --  unsupported macro: EFI_RNG_ALGORITHM_SP800_90_HMAC_256_GUID {0xc5149b43, 0xae85, 0x4f53, {0x99, 0x82, 0xb9, 0x43, 0x35, 0xd3, 0xa9, 0xe7} }
   --  unsupported macro: EFI_RNG_ALGORITHM_SP800_90_CTR_256_GUID {0x44f0de6e, 0x4d8c, 0x4045, {0xa8, 0xc7, 0x4d, 0xd1, 0x68, 0x85, 0x6b, 0x9e} }
   --  unsupported macro: EFI_RNG_ALGORITHM_X9_31_3DES_GUID {0x63c4785a, 0xca34, 0x4012, {0xa3, 0xc8, 0x0b, 0x6a, 0x32, 0x4f, 0x55, 0x46} }
   --  unsupported macro: EFI_RNG_ALGORITHM_X9_31_AES_GUID {0xacd03321, 0x777e, 0x4d3d, {0xb1, 0xc8, 0x20, 0xcf, 0xd8, 0x88, 0x20, 0xc9} }
   --  unsupported macro: EFI_RNG_ALGORITHM_RAW {0xe43176d7, 0xb6e8, 0x4827, {0xb7, 0x84, 0x7f, 0xfd, 0xc4, 0xb6, 0x85, 0x61} }
   --  unsupported macro: EFI_PLATFORM_DRIVER_OVERRIDE_PROTOCOL_GUID { 0x6b30c738, 0xa391, 0x11d4, {0x9a, 0x3b, 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
   --  unsupported macro: EFI_BUS_SPECIFIC_DRIVER_OVERRIDE_PROTOCOL_GUID { 0x3bc1b285, 0x8a15, 0x4a82, {0xaa, 0xbf, 0x4d, 0x7d, 0x13, 0xfb, 0x32, 0x65} }
   --  unsupported macro: EFI_DRIVER_FAMILY_OVERRIDE_PROTOCOL_GUID { 0xb1ee129e, 0xda36, 0x4181, {0x91, 0xf8, 0x04, 0xa4, 0x92, 0x37, 0x66, 0xa7} }
   --  unsupported macro: EFI_EBC_INTERPRETER_PROTOCOL_GUID {0x13ac6dd1, 0x73d0, 0x11d4, {0xb0, 0x6b, 0x00, 0xaa, 0x00, 0xbd, 0x6d, 0xe7} }
   --  unsupported macro: EFI_EBC_PROTOCOL_GUID EFI_EBC_INTERPRETER_PROTOCOL_GUID

  --++
  --Copyright (c) 1998  Intel Corporation
  --Module Name:
  --    efiprot.h
  --Abstract:
  --    EFI Protocols
  --Revision History
  ---- 

  --  FPSWA library protocol
  -- Device Path protocol
  -- Block IO protocol
   type u_EFI_BLOCK_IO_PROTOCOL;
   type EFI_BLOCK_RESET is access function (arg1 : access u_EFI_BLOCK_IO_PROTOCOL; arg2 : efidef_h.BOOLEAN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:57

   type EFI_BLOCK_READ is access function
        (arg1 : access u_EFI_BLOCK_IO_PROTOCOL;
         arg2 : efibind_h.UINT32;
         arg3 : efidef_h.EFI_LBA;
         arg4 : efibind_h.UINTN;
         arg5 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:64

   type EFI_BLOCK_WRITE is access function
        (arg1 : access u_EFI_BLOCK_IO_PROTOCOL;
         arg2 : efibind_h.UINT32;
         arg3 : efidef_h.EFI_LBA;
         arg4 : efibind_h.UINTN;
         arg5 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:75

   type EFI_BLOCK_FLUSH is access function (arg1 : access u_EFI_BLOCK_IO_PROTOCOL) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:86

  -- revision 2  
  -- revision 3  
   type EFI_BLOCK_IO_MEDIA is record
      MediaId : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:93
      RemovableMedia : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiprot.h:94
      MediaPresent : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiprot.h:95
      LogicalPartition : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiprot.h:97
      ReadOnly : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiprot.h:98
      WriteCaching : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiprot.h:99
      BlockSize : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:101
      IoAlign : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:102
      LastBlock : aliased efidef_h.EFI_LBA;  -- ../../gnu-efi/inc/efiprot.h:104
      LowestAlignedLba : aliased efidef_h.EFI_LBA;  -- ../../gnu-efi/inc/efiprot.h:107
      LogicalBlocksPerPhysicalBlock : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:108
      OptimalTransferLengthGranularity : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:110
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:111

   type u_EFI_BLOCK_IO_PROTOCOL is record
      Revision : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efiprot.h:114
      Media : access EFI_BLOCK_IO_MEDIA;  -- ../../gnu-efi/inc/efiprot.h:116
      Reset : EFI_BLOCK_RESET;  -- ../../gnu-efi/inc/efiprot.h:118
      ReadBlocks : EFI_BLOCK_READ;  -- ../../gnu-efi/inc/efiprot.h:119
      WriteBlocks : EFI_BLOCK_WRITE;  -- ../../gnu-efi/inc/efiprot.h:120
      FlushBlocks : EFI_BLOCK_FLUSH;  -- ../../gnu-efi/inc/efiprot.h:121
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:113

   subtype EFI_BLOCK_IO_PROTOCOL is u_EFI_BLOCK_IO_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:123

   subtype u_EFI_BLOCK_IO is u_EFI_BLOCK_IO_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:125

   subtype EFI_BLOCK_IO is EFI_BLOCK_IO_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:126

   type EFI_BLOCK_IO2_TOKEN is record
      Event : efidef_h.EFI_EVENT;  -- ../../gnu-efi/inc/efiprot.h:134
      TransactionStatus : aliased efidef_h.EFI_STATUS;  -- ../../gnu-efi/inc/efiprot.h:135
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:136

   type u_EFI_BLOCK_IO2_PROTOCOL;
   type EFI_BLOCK_RESET_EX is access function (arg1 : access u_EFI_BLOCK_IO2_PROTOCOL; arg2 : efidef_h.BOOLEAN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:140

   type EFI_BLOCK_READ_EX is access function
        (arg1 : access u_EFI_BLOCK_IO2_PROTOCOL;
         arg2 : efibind_h.UINT32;
         arg3 : efidef_h.EFI_LBA;
         arg4 : access EFI_BLOCK_IO2_TOKEN;
         arg5 : efibind_h.UINTN;
         arg6 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:147

   type EFI_BLOCK_WRITE_EX is access function
        (arg1 : access u_EFI_BLOCK_IO2_PROTOCOL;
         arg2 : efibind_h.UINT32;
         arg3 : efidef_h.EFI_LBA;
         arg4 : access EFI_BLOCK_IO2_TOKEN;
         arg5 : efibind_h.UINTN;
         arg6 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:158

   type EFI_BLOCK_FLUSH_EX is access function (arg1 : access u_EFI_BLOCK_IO2_PROTOCOL; arg2 : access EFI_BLOCK_IO2_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:169

   type u_EFI_BLOCK_IO2_PROTOCOL is record
      Media : access EFI_BLOCK_IO_MEDIA;  -- ../../gnu-efi/inc/efiprot.h:175
      Reset : EFI_BLOCK_RESET_EX;  -- ../../gnu-efi/inc/efiprot.h:176
      ReadBlocksEx : EFI_BLOCK_READ_EX;  -- ../../gnu-efi/inc/efiprot.h:177
      WriteBlocksEx : EFI_BLOCK_WRITE_EX;  -- ../../gnu-efi/inc/efiprot.h:178
      FlushBlocksEx : EFI_BLOCK_FLUSH_EX;  -- ../../gnu-efi/inc/efiprot.h:179
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:174

   subtype EFI_BLOCK_IO2_PROTOCOL is u_EFI_BLOCK_IO2_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:180

  -- Disk Block IO protocol
   type u_EFI_DISK_IO_PROTOCOL;
   type EFI_DISK_READ is access function
        (arg1 : access u_EFI_DISK_IO_PROTOCOL;
         arg2 : efibind_h.UINT32;
         arg3 : efibind_h.UINT64;
         arg4 : efibind_h.UINTN;
         arg5 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:197

   type EFI_DISK_WRITE is access function
        (arg1 : access u_EFI_DISK_IO_PROTOCOL;
         arg2 : efibind_h.UINT32;
         arg3 : efibind_h.UINT64;
         arg4 : efibind_h.UINTN;
         arg5 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:208

   type u_EFI_DISK_IO_PROTOCOL is record
      Revision : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efiprot.h:218
      ReadDisk : EFI_DISK_READ;  -- ../../gnu-efi/inc/efiprot.h:219
      WriteDisk : EFI_DISK_WRITE;  -- ../../gnu-efi/inc/efiprot.h:220
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:217

   subtype EFI_DISK_IO_PROTOCOL is u_EFI_DISK_IO_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:221

   subtype u_EFI_DISK_IO is u_EFI_DISK_IO_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:223

   subtype EFI_DISK_IO is EFI_DISK_IO_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:224

   type EFI_DISK_IO2_TOKEN is record
      Event : efidef_h.EFI_EVENT;  -- ../../gnu-efi/inc/efiprot.h:235
      TransactionStatus : aliased efidef_h.EFI_STATUS;  -- ../../gnu-efi/inc/efiprot.h:236
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:237

   type u_EFI_DISK_IO2_PROTOCOL;
   type EFI_DISK_CANCEL_EX is access function (arg1 : access u_EFI_DISK_IO2_PROTOCOL) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:241

   type EFI_DISK_READ_EX is access function
        (arg1 : access u_EFI_DISK_IO2_PROTOCOL;
         arg2 : efibind_h.UINT32;
         arg3 : efibind_h.UINT64;
         arg4 : access EFI_DISK_IO2_TOKEN;
         arg5 : efibind_h.UINTN;
         arg6 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:247

   type EFI_DISK_WRITE_EX is access function
        (arg1 : access u_EFI_DISK_IO2_PROTOCOL;
         arg2 : efibind_h.UINT32;
         arg3 : efibind_h.UINT64;
         arg4 : access EFI_DISK_IO2_TOKEN;
         arg5 : efibind_h.UINTN;
         arg6 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:258

   type EFI_DISK_FLUSH_EX is access function (arg1 : access u_EFI_DISK_IO2_PROTOCOL; arg2 : access EFI_DISK_IO2_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:269

   type u_EFI_DISK_IO2_PROTOCOL is record
      Revision : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efiprot.h:275
      Cancel : EFI_DISK_CANCEL_EX;  -- ../../gnu-efi/inc/efiprot.h:276
      ReadDiskEx : EFI_DISK_READ_EX;  -- ../../gnu-efi/inc/efiprot.h:277
      WriteDiskEx : EFI_DISK_WRITE_EX;  -- ../../gnu-efi/inc/efiprot.h:278
      FlushDiskEx : EFI_DISK_FLUSH_EX;  -- ../../gnu-efi/inc/efiprot.h:279
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:274

   subtype EFI_DISK_IO2_PROTOCOL is u_EFI_DISK_IO2_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:280

  -- Simple file system protocol
   type u_EFI_SIMPLE_FILE_SYSTEM_PROTOCOL;
   type u_EFI_FILE_HANDLE;
   type EFI_VOLUME_OPEN is access function (arg1 : access u_EFI_SIMPLE_FILE_SYSTEM_PROTOCOL; arg2 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:295

   type u_EFI_SIMPLE_FILE_SYSTEM_PROTOCOL is record
      Revision : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efiprot.h:304
      OpenVolume : EFI_VOLUME_OPEN;  -- ../../gnu-efi/inc/efiprot.h:305
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:303

   subtype EFI_SIMPLE_FILE_SYSTEM_PROTOCOL is u_EFI_SIMPLE_FILE_SYSTEM_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:306

   subtype u_EFI_FILE_IO_INTERFACE is u_EFI_SIMPLE_FILE_SYSTEM_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:308

   subtype EFI_FILE_IO_INTERFACE is EFI_SIMPLE_FILE_SYSTEM_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:309

   type EFI_FILE_OPEN is access function
        (arg1 : access u_EFI_FILE_HANDLE;
         arg2 : System.Address;
         arg3 : access efidef_h.CHAR16;
         arg4 : efibind_h.UINT64;
         arg5 : efibind_h.UINT64) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:317

  -- Open modes
  -- File attributes
   type EFI_FILE_CLOSE is access function (arg1 : access u_EFI_FILE_HANDLE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:341

   type EFI_FILE_DELETE is access function (arg1 : access u_EFI_FILE_HANDLE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:347

   type EFI_FILE_READ is access function
        (arg1 : access u_EFI_FILE_HANDLE;
         arg2 : access efibind_h.UINTN;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:353

   type EFI_FILE_WRITE is access function
        (arg1 : access u_EFI_FILE_HANDLE;
         arg2 : access efibind_h.UINTN;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:361

   type EFI_FILE_SET_POSITION is access function (arg1 : access u_EFI_FILE_HANDLE; arg2 : efibind_h.UINT64) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:369

   type EFI_FILE_GET_POSITION is access function (arg1 : access u_EFI_FILE_HANDLE; arg2 : access efibind_h.UINT64) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:376

   type EFI_FILE_GET_INFO is access function
        (arg1 : access u_EFI_FILE_HANDLE;
         arg2 : access efidef_h.EFI_GUID;
         arg3 : access efibind_h.UINTN;
         arg4 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:383

   type EFI_FILE_SET_INFO is access function
        (arg1 : access u_EFI_FILE_HANDLE;
         arg2 : access efidef_h.EFI_GUID;
         arg3 : efibind_h.UINTN;
         arg4 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:392

   type EFI_FILE_FLUSH is access function (arg1 : access u_EFI_FILE_HANDLE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:401

   type EFI_FILE_IO_TOKEN is record
      Event : efidef_h.EFI_EVENT;  -- ../../gnu-efi/inc/efiprot.h:406
      Status : aliased efidef_h.EFI_STATUS;  -- ../../gnu-efi/inc/efiprot.h:407
      BufferSize : aliased efibind_h.UINTN;  -- ../../gnu-efi/inc/efiprot.h:408
      Buffer : System.Address;  -- ../../gnu-efi/inc/efiprot.h:409
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:410

   type EFI_FILE_OPEN_EX is access function
        (arg1 : access u_EFI_FILE_HANDLE;
         arg2 : System.Address;
         arg3 : access efidef_h.CHAR16;
         arg4 : efibind_h.UINT64;
         arg5 : efibind_h.UINT64;
         arg6 : access EFI_FILE_IO_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:414

   type EFI_FILE_READ_EX is access function (arg1 : access u_EFI_FILE_HANDLE; arg2 : access EFI_FILE_IO_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:425

   type EFI_FILE_WRITE_EX is access function (arg1 : access u_EFI_FILE_HANDLE; arg2 : access EFI_FILE_IO_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:432

   type EFI_FILE_FLUSH_EX is access function (arg1 : access u_EFI_FILE_HANDLE; arg2 : access EFI_FILE_IO_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:439

   type u_EFI_FILE_HANDLE is record
      Revision : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efiprot.h:450
      Open : EFI_FILE_OPEN;  -- ../../gnu-efi/inc/efiprot.h:451
      Close : EFI_FILE_CLOSE;  -- ../../gnu-efi/inc/efiprot.h:452
      Delete : EFI_FILE_DELETE;  -- ../../gnu-efi/inc/efiprot.h:453
      Read : EFI_FILE_READ;  -- ../../gnu-efi/inc/efiprot.h:454
      Write : EFI_FILE_WRITE;  -- ../../gnu-efi/inc/efiprot.h:455
      GetPosition : EFI_FILE_GET_POSITION;  -- ../../gnu-efi/inc/efiprot.h:456
      SetPosition : EFI_FILE_SET_POSITION;  -- ../../gnu-efi/inc/efiprot.h:457
      GetInfo : EFI_FILE_GET_INFO;  -- ../../gnu-efi/inc/efiprot.h:458
      SetInfo : EFI_FILE_SET_INFO;  -- ../../gnu-efi/inc/efiprot.h:459
      Flush : EFI_FILE_FLUSH;  -- ../../gnu-efi/inc/efiprot.h:460
      OpenEx : EFI_FILE_OPEN_EX;  -- ../../gnu-efi/inc/efiprot.h:461
      ReadEx : EFI_FILE_READ_EX;  -- ../../gnu-efi/inc/efiprot.h:462
      WriteEx : EFI_FILE_WRITE_EX;  -- ../../gnu-efi/inc/efiprot.h:463
      FlushEx : EFI_FILE_FLUSH_EX;  -- ../../gnu-efi/inc/efiprot.h:464
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:449

   subtype EFI_FILE_PROTOCOL is u_EFI_FILE_HANDLE;  -- ../../gnu-efi/inc/efiprot.h:465

   type EFI_FILE_HANDLE is access all u_EFI_FILE_HANDLE;  -- ../../gnu-efi/inc/efiprot.h:465

   subtype EFI_FILE is EFI_FILE_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:467

  -- File information types
   type anon_array1052 is array (0 .. 0) of aliased efidef_h.CHAR16;
   type EFI_FILE_INFO is record
      Size : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efiprot.h:478
      FileSize : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efiprot.h:479
      PhysicalSize : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efiprot.h:480
      CreateTime : aliased efidef_h.EFI_TIME;  -- ../../gnu-efi/inc/efiprot.h:481
      LastAccessTime : aliased efidef_h.EFI_TIME;  -- ../../gnu-efi/inc/efiprot.h:482
      ModificationTime : aliased efidef_h.EFI_TIME;  -- ../../gnu-efi/inc/efiprot.h:483
      Attribute : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efiprot.h:484
      FileName : aliased anon_array1052;  -- ../../gnu-efi/inc/efiprot.h:485
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:486

  -- The FileName field of the EFI_FILE_INFO data structure is variable length.
  -- Whenever code needs to know the size of the EFI_FILE_INFO data structure, it needs to
  -- be the size of the data structure without the FileName field.  The following macro
  -- computes this size correctly no matter how big the FileName array is declared.
  -- This is required to make the EFI_FILE_INFO data structure ANSI compilant.
   type EFI_FILE_SYSTEM_INFO is record
      Size : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efiprot.h:502
      ReadOnly : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiprot.h:503
      VolumeSize : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efiprot.h:504
      FreeSpace : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efiprot.h:505
      BlockSize : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:506
      VolumeLabel : aliased anon_array1052;  -- ../../gnu-efi/inc/efiprot.h:507
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:508

  -- The VolumeLabel field of the EFI_FILE_SYSTEM_INFO data structure is variable length.
  -- Whenever code needs to know the size of the EFI_FILE_SYSTEM_INFO data structure, it needs
  -- to be the size of the data structure without the VolumeLable field.  The following macro
  -- computes this size correctly no matter how big the VolumeLable array is declared.
  -- This is required to make the EFI_FILE_SYSTEM_INFO data structure ANSI compilant.
   type EFI_FILE_SYSTEM_VOLUME_LABEL is record
      VolumeLabel : aliased anon_array1052;  -- ../../gnu-efi/inc/efiprot.h:524
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:525

  -- For compatibility with older versions of gnu-efi
  -- Load file protocol
   type u_EFI_LOAD_FILE_PROTOCOL;
   type EFI_LOAD_FILE is access function
        (arg1 : access u_EFI_LOAD_FILE_PROTOCOL;
         arg2 : access efidevp_h.u_EFI_DEVICE_PATH_PROTOCOL;
         arg3 : efidef_h.BOOLEAN;
         arg4 : access efibind_h.UINTN;
         arg5 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:548

   type u_EFI_LOAD_FILE_PROTOCOL is record
      LoadFile : EFI_LOAD_FILE;  -- ../../gnu-efi/inc/efiprot.h:557
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:556

   subtype EFI_LOAD_FILE_PROTOCOL is u_EFI_LOAD_FILE_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:558

   subtype u_EFI_LOAD_FILE_INTERFACE is u_EFI_LOAD_FILE_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:560

   subtype EFI_LOAD_FILE_INTERFACE is EFI_LOAD_FILE_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:561

  -- Device IO protocol
  -- Specification Change: Copy from MMIO to MMIO vs. MMIO to buffer, buffer to MMIO
   type EFI_IO_WIDTH is 
     (IO_UINT8,
      IO_UINT16,
      IO_UINT32,
      IO_UINT64,
      MMIO_COPY_UINT8,
      MMIO_COPY_UINT16,
      MMIO_COPY_UINT32,
      MMIO_COPY_UINT64)
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:585

   type u_EFI_DEVICE_IO_PROTOCOL;
   type EFI_DEVICE_IO is access function
        (arg1 : access u_EFI_DEVICE_IO_PROTOCOL;
         arg2 : EFI_IO_WIDTH;
         arg3 : efibind_h.UINT64;
         arg4 : efibind_h.UINTN;
         arg5 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:593

   type EFI_IO_ACCESS is record
      Read : EFI_DEVICE_IO;  -- ../../gnu-efi/inc/efiprot.h:602
      Write : EFI_DEVICE_IO;  -- ../../gnu-efi/inc/efiprot.h:603
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:604

   type EFI_PCI_DEVICE_PATH is access function
        (arg1 : access u_EFI_DEVICE_IO_PROTOCOL;
         arg2 : efibind_h.UINT64;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:608

   type EFI_IO_OPERATION_TYPE is 
     (EfiBusMasterRead,
      EfiBusMasterWrite,
      EfiBusMasterCommonBuffer)
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:618

   type EFI_IO_MAP is access function
        (arg1 : access u_EFI_DEVICE_IO_PROTOCOL;
         arg2 : EFI_IO_OPERATION_TYPE;
         arg3 : access efidef_h.EFI_PHYSICAL_ADDRESS;
         arg4 : access efibind_h.UINTN;
         arg5 : access efidef_h.EFI_PHYSICAL_ADDRESS;
         arg6 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:622

   type EFI_IO_UNMAP is access function (arg1 : access u_EFI_DEVICE_IO_PROTOCOL; arg2 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:633

   type EFI_IO_ALLOCATE_BUFFER is access function
        (arg1 : access u_EFI_DEVICE_IO_PROTOCOL;
         arg2 : efidef_h.EFI_ALLOCATE_TYPE;
         arg3 : efidef_h.EFI_MEMORY_TYPE;
         arg4 : efibind_h.UINTN;
         arg5 : access efidef_h.EFI_PHYSICAL_ADDRESS) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:640

   type EFI_IO_FLUSH is access function (arg1 : access u_EFI_DEVICE_IO_PROTOCOL) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:650

   type EFI_IO_FREE_BUFFER is access function
        (arg1 : access u_EFI_DEVICE_IO_PROTOCOL;
         arg2 : efibind_h.UINTN;
         arg3 : efidef_h.EFI_PHYSICAL_ADDRESS) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:656

   type u_EFI_DEVICE_IO_PROTOCOL is record
      Mem : aliased EFI_IO_ACCESS;  -- ../../gnu-efi/inc/efiprot.h:663
      Io : aliased EFI_IO_ACCESS;  -- ../../gnu-efi/inc/efiprot.h:664
      Pci : aliased EFI_IO_ACCESS;  -- ../../gnu-efi/inc/efiprot.h:665
      Map : EFI_IO_MAP;  -- ../../gnu-efi/inc/efiprot.h:666
      PciDevicePath : EFI_PCI_DEVICE_PATH;  -- ../../gnu-efi/inc/efiprot.h:667
      Unmap : EFI_IO_UNMAP;  -- ../../gnu-efi/inc/efiprot.h:668
      AllocateBuffer : EFI_IO_ALLOCATE_BUFFER;  -- ../../gnu-efi/inc/efiprot.h:669
      Flush : EFI_IO_FLUSH;  -- ../../gnu-efi/inc/efiprot.h:670
      FreeBuffer : EFI_IO_FREE_BUFFER;  -- ../../gnu-efi/inc/efiprot.h:671
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:662

   subtype EFI_DEVICE_IO_PROTOCOL is u_EFI_DEVICE_IO_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:672

   subtype u_EFI_DEVICE_IO_INTERFACE is u_EFI_DEVICE_IO_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:674

   subtype EFI_DEVICE_IO_INTERFACE is EFI_DEVICE_IO_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:675

  -- Unicode Collation protocol
   type u_EFI_UNICODE_COLLATION_PROTOCOL;
   type EFI_UNICODE_STRICOLL is access function
        (arg1 : access u_EFI_UNICODE_COLLATION_PROTOCOL;
         arg2 : access efidef_h.CHAR16;
         arg3 : access efidef_h.CHAR16) return efibind_h.INTN
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:692

   type EFI_UNICODE_METAIMATCH is access function
        (arg1 : access u_EFI_UNICODE_COLLATION_PROTOCOL;
         arg2 : access efidef_h.CHAR16;
         arg3 : access efidef_h.CHAR16) return efidef_h.BOOLEAN
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:700

   type EFI_UNICODE_STRLWR is access procedure (arg1 : access u_EFI_UNICODE_COLLATION_PROTOCOL; arg2 : access efidef_h.CHAR16)
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:708

   type EFI_UNICODE_STRUPR is access procedure (arg1 : access u_EFI_UNICODE_COLLATION_PROTOCOL; arg2 : access efidef_h.CHAR16)
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:715

   type EFI_UNICODE_FATTOSTR is access procedure
        (arg1 : access u_EFI_UNICODE_COLLATION_PROTOCOL;
         arg2 : efibind_h.UINTN;
         arg3 : access efidef_h.CHAR8;
         arg4 : access efidef_h.CHAR16)
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:722

   type EFI_UNICODE_STRTOFAT is access function
        (arg1 : access u_EFI_UNICODE_COLLATION_PROTOCOL;
         arg2 : access efidef_h.CHAR16;
         arg3 : efibind_h.UINTN;
         arg4 : access efidef_h.CHAR8) return efidef_h.BOOLEAN
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:731

  -- Hash Protocol
   type EFI_MD5_HASH is array (0 .. 15) of aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiprot.h:780

   type EFI_SHA1_HASH is array (0 .. 19) of aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiprot.h:781

   type EFI_SHA224_HASH is array (0 .. 27) of aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiprot.h:782

   type EFI_SHA256_HASH is array (0 .. 31) of aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiprot.h:783

   type EFI_SHA384_HASH is array (0 .. 47) of aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiprot.h:784

   type EFI_SHA512_HASH is array (0 .. 63) of aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiprot.h:785

   type u_EFI_HASH_OUTPUT (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            Md5Hash : access EFI_MD5_HASH;  -- ../../gnu-efi/inc/efiprot.h:787
         when 1 =>
            Sha1Hash : access EFI_SHA1_HASH;  -- ../../gnu-efi/inc/efiprot.h:788
         when 2 =>
            Sha224Hash : access EFI_SHA224_HASH;  -- ../../gnu-efi/inc/efiprot.h:789
         when 3 =>
            Sha256Hash : access EFI_SHA256_HASH;  -- ../../gnu-efi/inc/efiprot.h:790
         when 4 =>
            Sha384Hash : access EFI_SHA384_HASH;  -- ../../gnu-efi/inc/efiprot.h:791
         when others =>
            Sha512Hash : access EFI_SHA512_HASH;  -- ../../gnu-efi/inc/efiprot.h:792
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- ../../gnu-efi/inc/efiprot.h:786

   subtype EFI_HASH_OUTPUT is u_EFI_HASH_OUTPUT;  -- ../../gnu-efi/inc/efiprot.h:793

   type u_EFI_HASH_PROTOCOL;
   type EFI_HASH_GET_HASH_SIZE is access function
        (arg1 : access constant u_EFI_HASH_PROTOCOL;
         arg2 : access constant efidef_h.EFI_GUID;
         arg3 : access efibind_h.UINTN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:797

   type EFI_HASH_HASH is access function
        (arg1 : access constant u_EFI_HASH_PROTOCOL;
         arg2 : access constant efidef_h.EFI_GUID;
         arg3 : efidef_h.BOOLEAN;
         arg4 : access efibind_h.UINT8;
         arg5 : efibind_h.UINT64;
         arg6 : access EFI_HASH_OUTPUT) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:804

   type u_EFI_HASH_PROTOCOL is record
      GetHashSize : EFI_HASH_GET_HASH_SIZE;  -- ../../gnu-efi/inc/efiprot.h:813
      Hash : EFI_HASH_HASH;  -- ../../gnu-efi/inc/efiprot.h:814
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:812

   subtype EFI_HASH_PROTOCOL is u_EFI_HASH_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:815

   subtype u_EFI_HASH is u_EFI_HASH_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:817

   subtype EFI_HASH is EFI_HASH_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:818

  -- general
   type u_EFI_UNICODE_COLLATION_PROTOCOL is record
      StriColl : EFI_UNICODE_STRICOLL;  -- ../../gnu-efi/inc/efiprot.h:824
      MetaiMatch : EFI_UNICODE_METAIMATCH;  -- ../../gnu-efi/inc/efiprot.h:825
      StrLwr : EFI_UNICODE_STRLWR;  -- ../../gnu-efi/inc/efiprot.h:826
      StrUpr : EFI_UNICODE_STRUPR;  -- ../../gnu-efi/inc/efiprot.h:827
      FatToStr : EFI_UNICODE_FATTOSTR;  -- ../../gnu-efi/inc/efiprot.h:830
      StrToFat : EFI_UNICODE_STRTOFAT;  -- ../../gnu-efi/inc/efiprot.h:831
      SupportedLanguages : access efidef_h.CHAR8;  -- ../../gnu-efi/inc/efiprot.h:833
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:821

  -- for supporting fat volumes
   subtype EFI_UNICODE_COLLATION_PROTOCOL is u_EFI_UNICODE_COLLATION_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:834

   subtype EFI_UNICODE_COLLATION_INTERFACE is EFI_UNICODE_COLLATION_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:836

  -- Graphics output protocol  
   type u_EFI_GRAPHICS_OUTPUT_PROTOCOL;
   subtype EFI_GRAPHICS_OUTPUT_PROTOCOL is u_EFI_GRAPHICS_OUTPUT_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:841

   type EFI_PIXEL_BITMASK is record
      RedMask : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:844
      GreenMask : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:845
      BlueMask : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:846
      ReservedMask : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:847
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:848

   type EFI_GRAPHICS_PIXEL_FORMAT is 
     (PixelRedGreenBlueReserved8BitPerColor,
      PixelBlueGreenRedReserved8BitPerColor,
      PixelBitMask,
      PixelBltOnly,
      PixelFormatMax)
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:856

   type EFI_GRAPHICS_OUTPUT_MODE_INFORMATION is record
      Version : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:859
      HorizontalResolution : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:860
      VerticalResolution : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:861
      PixelFormat : aliased EFI_GRAPHICS_PIXEL_FORMAT;  -- ../../gnu-efi/inc/efiprot.h:862
      PixelInformation : aliased EFI_PIXEL_BITMASK;  -- ../../gnu-efi/inc/efiprot.h:863
      PixelsPerScanLine : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:864
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:865

  --*
  --  Return the current video mode information.
  --  @param  This       Protocol instance pointer.
  --  @param  ModeNumber The mode number to return information on.
  --  @param  SizeOfInfo A pointer to the size, in bytes, of the Info buffer.
  --  @param  Info       A pointer to callee allocated buffer that returns information about ModeNumber.
  --  @retval EFI_SUCCESS           Mode information returned.
  --  @retval EFI_BUFFER_TOO_SMALL  The Info buffer was too small.
  --  @retval EFI_DEVICE_ERROR      A hardware error occurred trying to retrieve the video mode.
  --  @retval EFI_NOT_STARTED       Video display is not initialized. Call SetMode ()
  --  @retval EFI_INVALID_PARAMETER One of the input args was NULL.
  --* 

   type EFI_GRAPHICS_OUTPUT_PROTOCOL_QUERY_MODE is access function
        (arg1 : access EFI_GRAPHICS_OUTPUT_PROTOCOL;
         arg2 : efibind_h.UINT32;
         arg3 : access efibind_h.UINTN;
         arg4 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:884

  --*
  --  Return the current video mode information.
  --  @param  This              Protocol instance pointer.
  --  @param  ModeNumber        The mode number to be set.
  --  @retval EFI_SUCCESS       Graphics mode was changed.
  --  @retval EFI_DEVICE_ERROR  The device had an error and could not complete the request.
  --  @retval EFI_UNSUPPORTED   ModeNumber is not supported by this device.
  --* 

   type EFI_GRAPHICS_OUTPUT_PROTOCOL_SET_MODE is access function (arg1 : access EFI_GRAPHICS_OUTPUT_PROTOCOL; arg2 : efibind_h.UINT32) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:905

   type EFI_GRAPHICS_OUTPUT_BLT_PIXEL is record
      Blue : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiprot.h:911
      Green : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiprot.h:912
      Red : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiprot.h:913
      Reserved : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiprot.h:914
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:915

   type EFI_GRAPHICS_OUTPUT_BLT_PIXEL_UNION (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            Pixel : aliased EFI_GRAPHICS_OUTPUT_BLT_PIXEL;  -- ../../gnu-efi/inc/efiprot.h:918
         when others =>
            Raw : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:919
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- ../../gnu-efi/inc/efiprot.h:920

   type EFI_GRAPHICS_OUTPUT_BLT_OPERATION is 
     (EfiBltVideoFill,
      EfiBltVideoToBltBuffer,
      EfiBltBufferToVideo,
      EfiBltVideoToVideo,
      EfiGraphicsOutputBltOperationMax)
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:928

  --*
  --  The following table defines actions for BltOperations:
  --  <B>EfiBltVideoFill</B> - Write data from the  BltBuffer pixel (SourceX, SourceY)
  --  directly to every pixel of the video display rectangle
  --  (DestinationX, DestinationY) (DestinationX + Width, DestinationY + Height).
  --  Only one pixel will be used from the BltBuffer. Delta is NOT used.
  --  <B>EfiBltVideoToBltBuffer</B> - Read data from the video display rectangle
  --  (SourceX, SourceY) (SourceX + Width, SourceY + Height) and place it in
  --  the BltBuffer rectangle (DestinationX, DestinationY )
  --  (DestinationX + Width, DestinationY + Height). If DestinationX or
  --  DestinationY is not zero then Delta must be set to the length in bytes
  --  of a row in the BltBuffer.
  --  <B>EfiBltBufferToVideo</B> - Write data from the  BltBuffer rectangle
  --  (SourceX, SourceY) (SourceX + Width, SourceY + Height) directly to the
  --  video display rectangle (DestinationX, DestinationY)
  --  (DestinationX + Width, DestinationY + Height). If SourceX or SourceY is
  --  not zero then Delta must be set to the length in bytes of a row in the
  --  BltBuffer.
  --  <B>EfiBltVideoToVideo</B> - Copy from the video display rectangle (SourceX, SourceY)
  --  (SourceX + Width, SourceY + Height) .to the video display rectangle
  --  (DestinationX, DestinationY) (DestinationX + Width, DestinationY + Height).
  --  The BltBuffer and Delta  are not used in this mode.
  --  @param  This         Protocol instance pointer.
  --  @param  BltBuffer    Buffer containing data to blit into video buffer. This
  --                       buffer has a size of Width*Height*sizeof(EFI_GRAPHICS_OUTPUT_BLT_PIXEL)
  --  @param  BltOperation Operation to perform on BlitBuffer and video memory
  --  @param  SourceX      X coordinate of source for the BltBuffer.
  --  @param  SourceY      Y coordinate of source for the BltBuffer.
  --  @param  DestinationX X coordinate of destination for the BltBuffer.
  --  @param  DestinationY Y coordinate of destination for the BltBuffer.
  --  @param  Width        Width of rectangle in BltBuffer in pixels.
  --  @param  Height       Hight of rectangle in BltBuffer in pixels.
  --  @param  Delta        OPTIONAL
  --  @retval EFI_SUCCESS           The Blt operation completed.
  --  @retval EFI_INVALID_PARAMETER BltOperation is not valid.
  --  @retval EFI_DEVICE_ERROR      A hardware error occured writting to the video buffer.
  --* 

   type EFI_GRAPHICS_OUTPUT_PROTOCOL_BLT is access function
        (arg1 : access EFI_GRAPHICS_OUTPUT_PROTOCOL;
         arg2 : access EFI_GRAPHICS_OUTPUT_BLT_PIXEL;
         arg3 : EFI_GRAPHICS_OUTPUT_BLT_OPERATION;
         arg4 : efibind_h.UINTN;
         arg5 : efibind_h.UINTN;
         arg6 : efibind_h.UINTN;
         arg7 : efibind_h.UINTN;
         arg8 : efibind_h.UINTN;
         arg9 : efibind_h.UINTN;
         arg10 : efibind_h.UINTN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:976

   type EFI_GRAPHICS_OUTPUT_PROTOCOL_MODE is record
      MaxMode : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:990
      Mode : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:991
      Info : access EFI_GRAPHICS_OUTPUT_MODE_INFORMATION;  -- ../../gnu-efi/inc/efiprot.h:992
      SizeOfInfo : aliased efibind_h.UINTN;  -- ../../gnu-efi/inc/efiprot.h:993
      FrameBufferBase : aliased efidef_h.EFI_PHYSICAL_ADDRESS;  -- ../../gnu-efi/inc/efiprot.h:994
      FrameBufferSize : aliased efibind_h.UINTN;  -- ../../gnu-efi/inc/efiprot.h:995
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:996

   type u_EFI_GRAPHICS_OUTPUT_PROTOCOL is record
      QueryMode : EFI_GRAPHICS_OUTPUT_PROTOCOL_QUERY_MODE;  -- ../../gnu-efi/inc/efiprot.h:999
      SetMode : EFI_GRAPHICS_OUTPUT_PROTOCOL_SET_MODE;  -- ../../gnu-efi/inc/efiprot.h:1000
      Blt : EFI_GRAPHICS_OUTPUT_PROTOCOL_BLT;  -- ../../gnu-efi/inc/efiprot.h:1001
      Mode : access EFI_GRAPHICS_OUTPUT_PROTOCOL_MODE;  -- ../../gnu-efi/inc/efiprot.h:1002
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:998

  -- * EFI EDID Discovered Protocol
  -- * UEFI Specification Version 2.5 Section 11.9
  --  

   type u_EFI_EDID_DISCOVERED_PROTOCOL is record
      SizeOfEdid : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:1015
      Edid : access efibind_h.UINT8;  -- ../../gnu-efi/inc/efiprot.h:1016
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:1014

   subtype EFI_EDID_DISCOVERED_PROTOCOL is u_EFI_EDID_DISCOVERED_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:1017

  -- * EFI EDID Active Protocol
  -- * UEFI Specification Version 2.5 Section 11.9
  --  

   type u_EFI_EDID_ACTIVE_PROTOCOL is record
      SizeOfEdid : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:1029
      Edid : access efibind_h.UINT8;  -- ../../gnu-efi/inc/efiprot.h:1030
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:1028

   subtype EFI_EDID_ACTIVE_PROTOCOL is u_EFI_EDID_ACTIVE_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:1031

  -- * EFI EDID Override Protocol
  -- * UEFI Specification Version 2.5 Section 11.9
  --  

   type u_EFI_EDID_OVERRIDE_PROTOCOL;
   type EFI_EDID_OVERRIDE_PROTOCOL_GET_EDID is access function
        (arg1 : access u_EFI_EDID_OVERRIDE_PROTOCOL;
         arg2 : System.Address;
         arg3 : access efibind_h.UINT32;
         arg4 : access efibind_h.UINTN;
         arg5 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1046

   type u_EFI_EDID_OVERRIDE_PROTOCOL is record
      GetEdid : EFI_EDID_OVERRIDE_PROTOCOL_GET_EDID;  -- ../../gnu-efi/inc/efiprot.h:1054
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:1053

   subtype EFI_EDID_OVERRIDE_PROTOCOL is u_EFI_EDID_OVERRIDE_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:1055

   type u_EFI_SERVICE_BINDING;
   type EFI_SERVICE_BINDING_CREATE_CHILD is access function (arg1 : access u_EFI_SERVICE_BINDING; arg2 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1063

   type EFI_SERVICE_BINDING_DESTROY_CHILD is access function (arg1 : access u_EFI_SERVICE_BINDING; arg2 : efidef_h.EFI_HANDLE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1070

   type u_EFI_SERVICE_BINDING is record
      CreateChild : EFI_SERVICE_BINDING_CREATE_CHILD;  -- ../../gnu-efi/inc/efiprot.h:1076
      DestroyChild : EFI_SERVICE_BINDING_DESTROY_CHILD;  -- ../../gnu-efi/inc/efiprot.h:1077
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:1075

   subtype EFI_SERVICE_BINDING is u_EFI_SERVICE_BINDING;  -- ../../gnu-efi/inc/efiprot.h:1078

  -- * EFI Driver Binding Protocol
  -- * UEFI Specification Version 2.5 Section 10.1
  --  

   type u_EFI_DRIVER_BINDING_PROTOCOL;
   type EFI_DRIVER_BINDING_PROTOCOL_SUPPORTED is access function
        (arg1 : access u_EFI_DRIVER_BINDING_PROTOCOL;
         arg2 : efidef_h.EFI_HANDLE;
         arg3 : access efidevp_h.u_EFI_DEVICE_PATH_PROTOCOL) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1094

   type EFI_DRIVER_BINDING_PROTOCOL_START is access function
        (arg1 : access u_EFI_DRIVER_BINDING_PROTOCOL;
         arg2 : efidef_h.EFI_HANDLE;
         arg3 : access efidevp_h.u_EFI_DEVICE_PATH_PROTOCOL) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1101

   type EFI_DRIVER_BINDING_PROTOCOL_STOP is access function
        (arg1 : access u_EFI_DRIVER_BINDING_PROTOCOL;
         arg2 : efidef_h.EFI_HANDLE;
         arg3 : efibind_h.UINTN;
         arg4 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1108

   type u_EFI_DRIVER_BINDING_PROTOCOL is record
      Supported : EFI_DRIVER_BINDING_PROTOCOL_SUPPORTED;  -- ../../gnu-efi/inc/efiprot.h:1115
      Start : EFI_DRIVER_BINDING_PROTOCOL_START;  -- ../../gnu-efi/inc/efiprot.h:1116
      Stop : EFI_DRIVER_BINDING_PROTOCOL_STOP;  -- ../../gnu-efi/inc/efiprot.h:1117
      Version : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:1118
      ImageHandle : efidef_h.EFI_HANDLE;  -- ../../gnu-efi/inc/efiprot.h:1119
      DriverBindingHandle : efidef_h.EFI_HANDLE;  -- ../../gnu-efi/inc/efiprot.h:1120
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:1114

   subtype EFI_DRIVER_BINDING_PROTOCOL is u_EFI_DRIVER_BINDING_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:1121

   subtype u_EFI_DRIVER_BINDING is u_EFI_DRIVER_BINDING_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:1123

   subtype EFI_DRIVER_BINDING is EFI_DRIVER_BINDING_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:1124

  -- * Backwards compatibility with older GNU-EFI versions. Deprecated.
  --  

  -- * EFI Component Name Protocol
  -- * Deprecated - use EFI Component Name 2 Protocol instead
  --  

   type u_EFI_COMPONENT_NAME_PROTOCOL;
   type EFI_COMPONENT_NAME_GET_DRIVER_NAME is access function
        (arg1 : access u_EFI_COMPONENT_NAME_PROTOCOL;
         arg2 : access efidef_h.CHAR8;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1148

   type EFI_COMPONENT_NAME_GET_CONTROLLER_NAME is access function
        (arg1 : access u_EFI_COMPONENT_NAME_PROTOCOL;
         arg2 : efidef_h.EFI_HANDLE;
         arg3 : efidef_h.EFI_HANDLE;
         arg4 : access efidef_h.CHAR8;
         arg5 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1155

   type u_EFI_COMPONENT_NAME_PROTOCOL is record
      GetDriverName : EFI_COMPONENT_NAME_GET_DRIVER_NAME;  -- ../../gnu-efi/inc/efiprot.h:1163
      GetControllerName : EFI_COMPONENT_NAME_GET_CONTROLLER_NAME;  -- ../../gnu-efi/inc/efiprot.h:1164
      SupportedLanguages : access efidef_h.CHAR8;  -- ../../gnu-efi/inc/efiprot.h:1165
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:1162

   subtype EFI_COMPONENT_NAME_PROTOCOL is u_EFI_COMPONENT_NAME_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:1166

   subtype u_EFI_COMPONENT_NAME is u_EFI_COMPONENT_NAME_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:1168

   subtype EFI_COMPONENT_NAME is EFI_COMPONENT_NAME_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:1169

  -- * EFI Component Name 2 Protocol
  -- * UEFI Specification Version 2.5 Section 10.5
  --  

   type u_EFI_COMPONENT_NAME2_PROTOCOL;
   type EFI_COMPONENT_NAME2_GET_DRIVER_NAME is access function
        (arg1 : access u_EFI_COMPONENT_NAME2_PROTOCOL;
         arg2 : access efidef_h.CHAR8;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1184

   type EFI_COMPONENT_NAME2_GET_CONTROLLER_NAME is access function
        (arg1 : access u_EFI_COMPONENT_NAME2_PROTOCOL;
         arg2 : efidef_h.EFI_HANDLE;
         arg3 : efidef_h.EFI_HANDLE;
         arg4 : access efidef_h.CHAR8;
         arg5 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1191

   type u_EFI_COMPONENT_NAME2_PROTOCOL is record
      GetDriverName : EFI_COMPONENT_NAME2_GET_DRIVER_NAME;  -- ../../gnu-efi/inc/efiprot.h:1199
      GetControllerName : EFI_COMPONENT_NAME2_GET_CONTROLLER_NAME;  -- ../../gnu-efi/inc/efiprot.h:1200
      SupportedLanguages : access efidef_h.CHAR8;  -- ../../gnu-efi/inc/efiprot.h:1201
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:1198

   subtype EFI_COMPONENT_NAME2_PROTOCOL is u_EFI_COMPONENT_NAME2_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:1202

   subtype u_EFI_COMPONENT_NAME2 is u_EFI_COMPONENT_NAME2_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:1204

   subtype EFI_COMPONENT_NAME2 is EFI_COMPONENT_NAME2_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:1205

  -- * EFI Loaded Image Protocol
  -- * UEFI Specification Version 2.5 Section 8.1
  --  

   type EFI_IMAGE_UNLOAD is access function (arg1 : efidef_h.EFI_HANDLE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1222

  -- Source location of image
  -- Images load options
  -- Location of where image was loaded
  -- If the driver image supports a dynamic unload request
   type EFI_LOADED_IMAGE_PROTOCOL is record
      Revision : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:1227
      ParentHandle : efidef_h.EFI_HANDLE;  -- ../../gnu-efi/inc/efiprot.h:1228
      SystemTable : access efiapi_h.u_EFI_SYSTEM_TABLE;  -- ../../gnu-efi/inc/efiprot.h:1229
      DeviceHandle : efidef_h.EFI_HANDLE;  -- ../../gnu-efi/inc/efiprot.h:1232
      FilePath : access efidevp_h.u_EFI_DEVICE_PATH_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:1233
      Reserved : System.Address;  -- ../../gnu-efi/inc/efiprot.h:1234
      LoadOptionsSize : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiprot.h:1237
      LoadOptions : System.Address;  -- ../../gnu-efi/inc/efiprot.h:1238
      ImageBase : System.Address;  -- ../../gnu-efi/inc/efiprot.h:1241
      ImageSize : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efiprot.h:1242
      ImageCodeType : aliased efidef_h.EFI_MEMORY_TYPE;  -- ../../gnu-efi/inc/efiprot.h:1243
      ImageDataType : aliased efidef_h.EFI_MEMORY_TYPE;  -- ../../gnu-efi/inc/efiprot.h:1244
      Unload : EFI_IMAGE_UNLOAD;  -- ../../gnu-efi/inc/efiprot.h:1247
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:1248

   subtype EFI_LOADED_IMAGE is EFI_LOADED_IMAGE_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:1250

  -- * Random Number Generator Protocol
  -- * UEFI Specification Version 2.5 Section 35.5
  --  

   subtype EFI_RNG_ALGORITHM is efidef_h.EFI_GUID;  -- ../../gnu-efi/inc/efiprot.h:1262

   type u_EFI_RNG_PROTOCOL;
   type EFI_RNG_GET_INFO is access function
        (arg1 : access u_EFI_RNG_PROTOCOL;
         arg2 : access efibind_h.UINTN;
         arg3 : access EFI_RNG_ALGORITHM) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1286

   type EFI_RNG_GET_RNG is access function
        (arg1 : access u_EFI_RNG_PROTOCOL;
         arg2 : access EFI_RNG_ALGORITHM;
         arg3 : efibind_h.UINTN;
         arg4 : access efibind_h.UINT8) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1294

   type u_EFI_RNG_PROTOCOL is record
      GetInfo : EFI_RNG_GET_INFO;  -- ../../gnu-efi/inc/efiprot.h:1302
      GetRNG : EFI_RNG_GET_RNG;  -- ../../gnu-efi/inc/efiprot.h:1303
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:1301

   subtype EFI_RNG_PROTOCOL is u_EFI_RNG_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:1304

  -- EFI_PLATFORM_DRIVER_OVERRIDE_PROTOCOL
   type u_EFI_PLATFORM_DRIVER_OVERRIDE_PROTOCOL;
   type EFI_PLATFORM_DRIVER_OVERRIDE_GET_DRIVER is access function
        (arg1 : access u_EFI_PLATFORM_DRIVER_OVERRIDE_PROTOCOL;
         arg2 : efidef_h.EFI_HANDLE;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1318

   type EFI_PLATFORM_DRIVER_OVERRIDE_GET_DRIVER_PATH is access function
        (arg1 : access u_EFI_PLATFORM_DRIVER_OVERRIDE_PROTOCOL;
         arg2 : efidef_h.EFI_HANDLE;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1325

   type EFI_PLATFORM_DRIVER_OVERRIDE_DRIVER_LOADED is access function
        (arg1 : access u_EFI_PLATFORM_DRIVER_OVERRIDE_PROTOCOL;
         arg2 : efidef_h.EFI_HANDLE;
         arg3 : access efidevp_h.u_EFI_DEVICE_PATH_PROTOCOL;
         arg4 : efidef_h.EFI_HANDLE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1332

   type u_EFI_PLATFORM_DRIVER_OVERRIDE_PROTOCOL is record
      GetDriver : EFI_PLATFORM_DRIVER_OVERRIDE_GET_DRIVER;  -- ../../gnu-efi/inc/efiprot.h:1339
      GetDriverPath : EFI_PLATFORM_DRIVER_OVERRIDE_GET_DRIVER_PATH;  -- ../../gnu-efi/inc/efiprot.h:1340
      DriverLoaded : EFI_PLATFORM_DRIVER_OVERRIDE_DRIVER_LOADED;  -- ../../gnu-efi/inc/efiprot.h:1341
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:1338

   subtype EFI_PLATFORM_DRIVER_OVERRIDE_PROTOCOL is u_EFI_PLATFORM_DRIVER_OVERRIDE_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:1342

  -- EFI_BUS_SPECIFIC_DRIVER_OVERRIDE_PROTOCOL
   type u_EFI_BUS_SPECIFIC_DRIVER_OVERRIDE_PROTOCOL;
   type EFI_BUS_SPECIFIC_DRIVER_OVERRIDE_GET_DRIVER is access function (arg1 : access u_EFI_BUS_SPECIFIC_DRIVER_OVERRIDE_PROTOCOL; arg2 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1355

   type u_EFI_BUS_SPECIFIC_DRIVER_OVERRIDE_PROTOCOL is record
      GetDriver : EFI_BUS_SPECIFIC_DRIVER_OVERRIDE_GET_DRIVER;  -- ../../gnu-efi/inc/efiprot.h:1360
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:1359

   subtype EFI_BUS_SPECIFIC_DRIVER_OVERRIDE_PROTOCOL is u_EFI_BUS_SPECIFIC_DRIVER_OVERRIDE_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:1361

  -- EFI_DRIVER_FAMILY_OVERRIDE_PROTOCOL
   type u_EFI_DRIVER_FAMILY_OVERRIDE_PROTOCOL;
   type EFI_DRIVER_FAMILY_OVERRIDE_GET_VERSION is access function (arg1 : access u_EFI_DRIVER_FAMILY_OVERRIDE_PROTOCOL) return efibind_h.UINT32
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1374

   type u_EFI_DRIVER_FAMILY_OVERRIDE_PROTOCOL is record
      GetVersion : EFI_DRIVER_FAMILY_OVERRIDE_GET_VERSION;  -- ../../gnu-efi/inc/efiprot.h:1378
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:1377

   subtype EFI_DRIVER_FAMILY_OVERRIDE_PROTOCOL is u_EFI_DRIVER_FAMILY_OVERRIDE_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:1379

  -- EFI_EBC_PROTOCOL
   type u_EFI_EBC_PROTOCOL;
   type EFI_EBC_CREATE_THUNK is access function
        (arg1 : access u_EFI_EBC_PROTOCOL;
         arg2 : efidef_h.EFI_HANDLE;
         arg3 : System.Address;
         arg4 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1394

   type EFI_EBC_UNLOAD_IMAGE is access function (arg1 : access u_EFI_EBC_PROTOCOL; arg2 : efidef_h.EFI_HANDLE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1402

   type EBC_ICACHE_FLUSH is access function (arg1 : efidef_h.EFI_PHYSICAL_ADDRESS; arg2 : efibind_h.UINT64) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1408

   type EFI_EBC_REGISTER_ICACHE_FLUSH is access function (arg1 : access u_EFI_EBC_PROTOCOL; arg2 : EBC_ICACHE_FLUSH) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1414

   type EFI_EBC_GET_VERSION is access function (arg1 : access u_EFI_EBC_PROTOCOL; arg2 : access efibind_h.UINT64) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiprot.h:1420

   type u_EFI_EBC_PROTOCOL is record
      CreateThunk : EFI_EBC_CREATE_THUNK;  -- ../../gnu-efi/inc/efiprot.h:1425
      UnloadImage : EFI_EBC_UNLOAD_IMAGE;  -- ../../gnu-efi/inc/efiprot.h:1426
      RegisterICacheFlush : EFI_EBC_REGISTER_ICACHE_FLUSH;  -- ../../gnu-efi/inc/efiprot.h:1427
      GetVersion : EFI_EBC_GET_VERSION;  -- ../../gnu-efi/inc/efiprot.h:1428
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiprot.h:1424

   subtype EFI_EBC_PROTOCOL is u_EFI_EBC_PROTOCOL;  -- ../../gnu-efi/inc/efiprot.h:1429

end efiprot_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
