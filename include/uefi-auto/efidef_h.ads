pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with efibind_h;
with System;

package efidef_h is

   --  unsupported macro: CONST const
   --  unsupported macro: TRUE ((BOOLEAN) 1)
   --  unsupported macro: FALSE ((BOOLEAN) 0)
   --  unsupported macro: NULL ((VOID *) 0)
   EFI_TIME_ADJUST_DAYLIGHT : constant := 16#01#;  --  ../../gnu-efi/inc/efidef.h:92
   EFI_TIME_IN_DAYLIGHT : constant := 16#02#;  --  ../../gnu-efi/inc/efidef.h:93

   EFI_UNSPECIFIED_TIMEZONE : constant := 16#07FF#;  --  ../../gnu-efi/inc/efidef.h:96

   EFI_MEMORY_UC : constant := 16#0000000000000001#;  --  ../../gnu-efi/inc/efidef.h:169
   EFI_MEMORY_WC : constant := 16#0000000000000002#;  --  ../../gnu-efi/inc/efidef.h:170
   EFI_MEMORY_WT : constant := 16#0000000000000004#;  --  ../../gnu-efi/inc/efidef.h:171
   EFI_MEMORY_WB : constant := 16#0000000000000008#;  --  ../../gnu-efi/inc/efidef.h:172
   EFI_MEMORY_UCE : constant := 16#0000000000000010#;  --  ../../gnu-efi/inc/efidef.h:173

   EFI_MEMORY_WP : constant := 16#0000000000001000#;  --  ../../gnu-efi/inc/efidef.h:176
   EFI_MEMORY_RP : constant := 16#0000000000002000#;  --  ../../gnu-efi/inc/efidef.h:177
   EFI_MEMORY_XP : constant := 16#0000000000004000#;  --  ../../gnu-efi/inc/efidef.h:178

   EFI_MEMORY_RUNTIME : constant := 16#8000000000000000#;  --  ../../gnu-efi/inc/efidef.h:181

   EFI_MEMORY_DESCRIPTOR_VERSION : constant := 1;  --  ../../gnu-efi/inc/efidef.h:183

   ISO_639_2_ENTRY_SIZE : constant := 3;  --  ../../gnu-efi/inc/efidef.h:198

   EFI_PAGE_SIZE : constant := 4096;  --  ../../gnu-efi/inc/efidef.h:204
   EFI_PAGE_MASK : constant := 16#FFF#;  --  ../../gnu-efi/inc/efidef.h:205
   EFI_PAGE_SHIFT : constant := 12;  --  ../../gnu-efi/inc/efidef.h:206
   --  arg-macro: function EFI_SIZE_TO_PAGES (a)
   --    return  ((a) >> EFI_PAGE_SHIFT) + ((a) and EFI_PAGE_MASK ? 1 : 0) ;

   EFI_OS_INDICATIONS_BOOT_TO_FW_UI : constant := 16#0000000000000001#;  --  ../../gnu-efi/inc/efidef.h:211
   EFI_OS_INDICATIONS_TIMESTAMP_REVOCATION : constant := 16#0000000000000002#;  --  ../../gnu-efi/inc/efidef.h:212
   EFI_OS_INDICATIONS_FILE_CAPSULE_DELIVERY_SUPPORTED : constant := 16#0000000000000004#;  --  ../../gnu-efi/inc/efidef.h:213

   EFI_OS_INDICATIONS_FMP_CAPSULE_SUPPORTED : constant := 16#0000000000000008#;  --  ../../gnu-efi/inc/efidef.h:215

   EFI_OS_INDICATIONS_CAPSULE_RESULT_VAR_SUPPORTED : constant := 16#0000000000000010#;  --  ../../gnu-efi/inc/efidef.h:217

  --++
  --Copyright (c) 1998  Intel Corporation
  --Module Name:
  --    efidef.h
  --Abstract:
  --    EFI definitions
  --Revision History
  ---- 

   subtype CHAR16 is efibind_h.UINT16;  -- ../../gnu-efi/inc/efidef.h:23

   subtype CHAR8 is efibind_h.UINT8;  -- ../../gnu-efi/inc/efidef.h:24

   subtype BOOLEAN is efibind_h.UINT8;  -- ../../gnu-efi/inc/efidef.h:25

   subtype EFI_STATUS is efibind_h.UINTN;  -- ../../gnu-efi/inc/efidef.h:38

   subtype EFI_LBA is efibind_h.UINT64;  -- ../../gnu-efi/inc/efidef.h:39

   subtype EFI_TPL is efibind_h.UINTN;  -- ../../gnu-efi/inc/efidef.h:40

   type EFI_HANDLE is new System.Address;  -- ../../gnu-efi/inc/efidef.h:41

   type EFI_EVENT is new System.Address;  -- ../../gnu-efi/inc/efidef.h:42

  -- Prototype argument decoration for EFI parameters to indicate
  -- their direction
  -- IN - argument is passed into the function
  -- OUT - argument (pointer) is returned from the function
  -- OPTIONAL - argument is optional
  -- A GUID
   type anon_array980 is array (0 .. 7) of aliased efibind_h.UINT8;
   type EFI_GUID is record
      Data1 : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidef.h:66
      Data2 : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidef.h:67
      Data3 : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidef.h:68
      Data4 : aliased anon_array980;  -- ../../gnu-efi/inc/efidef.h:69
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidef.h:70

  -- Time
  -- 1998 - 20XX
  -- 1 - 12
  -- 1 - 31
  -- 0 - 23
  -- 0 - 59
  -- 0 - 59
  -- 0 - 999,999,999
  -- -1440 to 1440 or 2047
   type EFI_TIME is record
      Year : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidef.h:78
      Month : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidef.h:79
      Day : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidef.h:80
      Hour : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidef.h:81
      Minute : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidef.h:82
      Second : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidef.h:83
      Pad1 : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidef.h:84
      Nanosecond : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidef.h:85
      TimeZone : aliased efibind_h.INT16;  -- ../../gnu-efi/inc/efidef.h:86
      Daylight : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidef.h:87
      Pad2 : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efidef.h:88
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidef.h:89

  -- Bit definitions for EFI_TIME.Daylight
  -- Value definition for EFI_TIME.TimeZone
  -- Networking
   type anon_array987 is array (0 .. 3) of aliased efibind_h.UINT8;
   type EFI_IPv4_ADDRESS is record
      Addr : aliased anon_array987;  -- ../../gnu-efi/inc/efidef.h:105
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidef.h:106

   type anon_array992 is array (0 .. 15) of aliased efibind_h.UINT8;
   type EFI_IPv6_ADDRESS is record
      Addr : aliased anon_array992;  -- ../../gnu-efi/inc/efidef.h:109
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidef.h:110

   type anon_array997 is array (0 .. 31) of aliased efibind_h.UINT8;
   type EFI_MAC_ADDRESS is record
      Addr : aliased anon_array997;  -- ../../gnu-efi/inc/efidef.h:113
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidef.h:114

   type EFI_MANAGED_NETWORK_CONFIG_DATA is record
      ReceivedQueueTimeoutValue : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidef.h:117
      TransmitQueueTimeoutValue : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidef.h:118
      ProtocolTypeFilter : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efidef.h:119
      EnableUnicastReceive : aliased BOOLEAN;  -- ../../gnu-efi/inc/efidef.h:120
      EnableMulticastReceive : aliased BOOLEAN;  -- ../../gnu-efi/inc/efidef.h:121
      EnableBroadcastReceive : aliased BOOLEAN;  -- ../../gnu-efi/inc/efidef.h:122
      EnablePromiscuousReceive : aliased BOOLEAN;  -- ../../gnu-efi/inc/efidef.h:123
      FlushQueuesOnReset : aliased BOOLEAN;  -- ../../gnu-efi/inc/efidef.h:124
      EnableReceiveTimestamps : aliased BOOLEAN;  -- ../../gnu-efi/inc/efidef.h:125
      DisableBackgroundPolling : aliased BOOLEAN;  -- ../../gnu-efi/inc/efidef.h:126
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidef.h:127

  -- Memory
   subtype EFI_PHYSICAL_ADDRESS is efibind_h.UINT64;  -- ../../gnu-efi/inc/efidef.h:133

   subtype EFI_VIRTUAL_ADDRESS is efibind_h.UINT64;  -- ../../gnu-efi/inc/efidef.h:134

   type EFI_ALLOCATE_TYPE is 
     (AllocateAnyPages,
      AllocateMaxAddress,
      AllocateAddress,
      MaxAllocateType)
   with Convention => C;  -- ../../gnu-efi/inc/efidef.h:141

  --Preseve the attr on any range supplied.
  --ConventialMemory must have WB,SR,SW when supplied.
  --When allocating from ConventialMemory always make it WB,SR,SW
  --When returning to ConventialMemory always make it WB,SR,SW
  --When getting the memory map, or on RT for runtime types
   type EFI_MEMORY_TYPE is 
     (EfiReservedMemoryType,
      EfiLoaderCode,
      EfiLoaderData,
      EfiBootServicesCode,
      EfiBootServicesData,
      EfiRuntimeServicesCode,
      EfiRuntimeServicesData,
      EfiConventionalMemory,
      EfiUnusableMemory,
      EfiACPIReclaimMemory,
      EfiACPIMemoryNVS,
      EfiMemoryMappedIO,
      EfiMemoryMappedIOPortSpace,
      EfiPalCode,
      EfiMaxMemoryType)
   with Convention => C;  -- ../../gnu-efi/inc/efidef.h:166

  -- possible caching types for the memory range
  -- physical memory protection on range 
  -- range requires a runtime mapping
  -- Field size is 32 bits followed by 32 bit pad
  -- Field size is 64 bits
  -- Field size is 64 bits
  -- Field size is 64 bits
  -- Field size is 64 bits
   type EFI_MEMORY_DESCRIPTOR is record
      c_Type : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidef.h:185
      Pad : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efidef.h:186
      PhysicalStart : aliased EFI_PHYSICAL_ADDRESS;  -- ../../gnu-efi/inc/efidef.h:187
      VirtualStart : aliased EFI_VIRTUAL_ADDRESS;  -- ../../gnu-efi/inc/efidef.h:188
      NumberOfPages : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efidef.h:189
      Attribute : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efidef.h:190
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efidef.h:191

  -- International Language
   subtype ISO_639_2 is efibind_h.UINT8;  -- ../../gnu-efi/inc/efidef.h:197

end efidef_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
