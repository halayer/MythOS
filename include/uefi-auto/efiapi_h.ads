pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with efidef_h;
with efibind_h;
with System;
limited with efidevp_h;
with efiprot_h;
limited with eficon_h;

package efiapi_h is

   EFI_SPECIFICATION_MAJOR_REVISION : constant := 1;  --  ../../gnu-efi/inc/efiapi.h:27
   EFI_SPECIFICATION_MINOR_REVISION : constant := 8#2#;  --  ../../gnu-efi/inc/efiapi.h:28
   --  arg-macro: function NextMemoryDescriptor (Ptr, Size)
   --    return (EFI_MEMORY_DESCRIPTOR *) (((UINT8 *) Ptr) + Size);

   EFI_OPTIONAL_PTR : constant := 16#00000001#;  --  ../../gnu-efi/inc/efiapi.h:93
   EFI_INTERNAL_FNC : constant := 16#00000002#;  --  ../../gnu-efi/inc/efiapi.h:94
   EFI_INTERNAL_PTR : constant := 16#00000004#;  --  ../../gnu-efi/inc/efiapi.h:95

   EVT_TIMER : constant := 16#80000000#;  --  ../../gnu-efi/inc/efiapi.h:110
   EVT_RUNTIME : constant := 16#40000000#;  --  ../../gnu-efi/inc/efiapi.h:111
   EVT_RUNTIME_CONTEXT : constant := 16#20000000#;  --  ../../gnu-efi/inc/efiapi.h:112

   EVT_NOTIFY_WAIT : constant := 16#00000100#;  --  ../../gnu-efi/inc/efiapi.h:114
   EVT_NOTIFY_SIGNAL : constant := 16#00000200#;  --  ../../gnu-efi/inc/efiapi.h:115

   EVT_SIGNAL_EXIT_BOOT_SERVICES : constant := 16#00000201#;  --  ../../gnu-efi/inc/efiapi.h:117
   EVT_SIGNAL_VIRTUAL_ADDRESS_CHANGE : constant := 16#60000202#;  --  ../../gnu-efi/inc/efiapi.h:118

   EVT_EFI_SIGNAL_MASK : constant := 16#000000FF#;  --  ../../gnu-efi/inc/efiapi.h:120
   EVT_EFI_SIGNAL_MAX : constant := 4;  --  ../../gnu-efi/inc/efiapi.h:121
   --  unsupported macro: EFI_EVENT_TIMER EVT_TIMER
   --  unsupported macro: EFI_EVENT_RUNTIME EVT_RUNTIME
   --  unsupported macro: EFI_EVENT_RUNTIME_CONTEXT EVT_RUNTIME_CONTEXT
   --  unsupported macro: EFI_EVENT_NOTIFY_WAIT EVT_NOTIFY_WAIT
   --  unsupported macro: EFI_EVENT_NOTIFY_SIGNAL EVT_NOTIFY_SIGNAL
   --  unsupported macro: EFI_EVENT_SIGNAL_EXIT_BOOT_SERVICES EVT_SIGNAL_EXIT_BOOT_SERVICES
   --  unsupported macro: EFI_EVENT_SIGNAL_VIRTUAL_ADDRESS_CHANGE EVT_SIGNAL_VIRTUAL_ADDRESS_CHANGE
   --  unsupported macro: EFI_EVENT_EFI_SIGNAL_MASK EVT_EFI_SIGNAL_MASK
   --  unsupported macro: EFI_EVENT_EFI_SIGNAL_MAX EVT_EFI_SIGNAL_MAX

   TPL_APPLICATION : constant := 4;  --  ../../gnu-efi/inc/efiapi.h:196
   TPL_CALLBACK : constant := 8;  --  ../../gnu-efi/inc/efiapi.h:197
   TPL_NOTIFY : constant := 16;  --  ../../gnu-efi/inc/efiapi.h:198
   TPL_HIGH_LEVEL : constant := 31;  --  ../../gnu-efi/inc/efiapi.h:199
   --  unsupported macro: EFI_TPL_APPLICATION TPL_APPLICATION
   --  unsupported macro: EFI_TPL_CALLBACK TPL_CALLBACK
   --  unsupported macro: EFI_TPL_NOTIFY TPL_NOTIFY
   --  unsupported macro: EFI_TPL_HIGH_LEVEL TPL_HIGH_LEVEL
   --  unsupported macro: EFI_GLOBAL_VARIABLE { 0x8BE4DF61, 0x93CA, 0x11d2, {0xAA, 0x0D, 0x00, 0xE0, 0x98, 0x03, 0x2B, 0x8C} }

   EFI_VARIABLE_NON_VOLATILE : constant := 16#00000001#;  --  ../../gnu-efi/inc/efiapi.h:225
   EFI_VARIABLE_BOOTSERVICE_ACCESS : constant := 16#00000002#;  --  ../../gnu-efi/inc/efiapi.h:226
   EFI_VARIABLE_RUNTIME_ACCESS : constant := 16#00000004#;  --  ../../gnu-efi/inc/efiapi.h:227
   EFI_VARIABLE_HARDWARE_ERROR_RECORD : constant := 16#00000008#;  --  ../../gnu-efi/inc/efiapi.h:228
   EFI_VARIABLE_AUTHENTICATED_WRITE_ACCESS : constant := 16#00000010#;  --  ../../gnu-efi/inc/efiapi.h:229
   EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS : constant := 16#00000020#;  --  ../../gnu-efi/inc/efiapi.h:230
   EFI_VARIABLE_APPEND_WRITE : constant := 16#00000040#;  --  ../../gnu-efi/inc/efiapi.h:231

   EFI_MAXIMUM_VARIABLE_SIZE : constant := 1024;  --  ../../gnu-efi/inc/efiapi.h:234

   IMAGE_SUBSYSTEM_EFI_APPLICATION : constant := 10;  --  ../../gnu-efi/inc/efiapi.h:314
   IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER : constant := 11;  --  ../../gnu-efi/inc/efiapi.h:315
   IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER : constant := 12;  --  ../../gnu-efi/inc/efiapi.h:316

   EFI_IMAGE_MACHINE_IA32 : constant := 16#014c#;  --  ../../gnu-efi/inc/efiapi.h:322

   EFI_IMAGE_MACHINE_IA64 : constant := 16#0200#;  --  ../../gnu-efi/inc/efiapi.h:326

   EFI_IMAGE_MACHINE_EBC : constant := 16#0EBC#;  --  ../../gnu-efi/inc/efiapi.h:330

   EFI_IMAGE_MACHINE_X64 : constant := 16#8664#;  --  ../../gnu-efi/inc/efiapi.h:334

   EFI_IMAGE_MACHINE_ARMTHUMB_MIXED : constant := 16#01C2#;  --  ../../gnu-efi/inc/efiapi.h:338

   EFI_IMAGE_MACHINE_AARCH64 : constant := 16#AA64#;  --  ../../gnu-efi/inc/efiapi.h:342

   EFI_IMAGE_MACHINE_RISCV32 : constant := 16#5032#;  --  ../../gnu-efi/inc/efiapi.h:346

   EFI_IMAGE_MACHINE_RISCV64 : constant := 16#5064#;  --  ../../gnu-efi/inc/efiapi.h:350

   EFI_IMAGE_MACHINE_RISCV128 : constant := 16#5128#;  --  ../../gnu-efi/inc/efiapi.h:354

   EFI_OPEN_PROTOCOL_BY_HANDLE_PROTOCOL : constant := 16#00000001#;  --  ../../gnu-efi/inc/efiapi.h:470
   EFI_OPEN_PROTOCOL_GET_PROTOCOL : constant := 16#00000002#;  --  ../../gnu-efi/inc/efiapi.h:471
   EFI_OPEN_PROTOCOL_TEST_PROTOCOL : constant := 16#00000004#;  --  ../../gnu-efi/inc/efiapi.h:472
   EFI_OPEN_PROTOCOL_BY_CHILD_CONTROLLER : constant := 16#00000008#;  --  ../../gnu-efi/inc/efiapi.h:473
   EFI_OPEN_PROTOCOL_BY_DRIVER : constant := 16#00000010#;  --  ../../gnu-efi/inc/efiapi.h:474
   EFI_OPEN_PROTOCOL_EXCLUSIVE : constant := 16#00000020#;  --  ../../gnu-efi/inc/efiapi.h:475

   CAPSULE_FLAGS_PERSIST_ACROSS_RESET : constant := 16#00010000#;  --  ../../gnu-efi/inc/efiapi.h:637
   CAPSULE_FLAGS_POPULATE_SYSTEM_TABLE : constant := 16#00020000#;  --  ../../gnu-efi/inc/efiapi.h:638
   CAPSULE_FLAGS_INITIATE_RESET : constant := 16#00040000#;  --  ../../gnu-efi/inc/efiapi.h:639

   EFI_RUNTIME_SERVICES_SIGNATURE : constant := 16#56524553544e5552#;  --  ../../gnu-efi/inc/efiapi.h:765
   --  unsupported macro: EFI_RUNTIME_SERVICES_REVISION (EFI_SPECIFICATION_MAJOR_REVISION<<16) | (EFI_SPECIFICATION_MINOR_REVISION)

   EFI_BOOT_SERVICES_SIGNATURE : constant := 16#56524553544f4f42#;  --  ../../gnu-efi/inc/efiapi.h:812
   --  unsupported macro: EFI_BOOT_SERVICES_REVISION (EFI_SPECIFICATION_MAJOR_REVISION<<16) | (EFI_SPECIFICATION_MINOR_REVISION)
   --  unsupported macro: MPS_TABLE_GUID { 0xeb9d2d2f, 0x2d88, 0x11d3, {0x9a, 0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
   --  unsupported macro: ACPI_TABLE_GUID { 0xeb9d2d30, 0x2d88, 0x11d3, {0x9a, 0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
   --  unsupported macro: ACPI_20_TABLE_GUID { 0x8868e871, 0xe4f1, 0x11d3, {0xbc, 0x22, 0x0, 0x80, 0xc7, 0x3c, 0x88, 0x81} }
   --  unsupported macro: SMBIOS_TABLE_GUID { 0xeb9d2d31, 0x2d88, 0x11d3, {0x9a, 0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
   --  unsupported macro: SMBIOS3_TABLE_GUID { 0xf2fd1544, 0x9794, 0x4a2c, {0x99, 0x2e, 0xe5, 0xbb, 0xcf, 0x20, 0xe3, 0x94} }
   --  unsupported macro: SAL_SYSTEM_TABLE_GUID { 0xeb9d2d32, 0x2d88, 0x11d3, {0x9a, 0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
   --  unsupported macro: EFI_DTB_TABLE_GUID { 0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, 0xe0} }

   EFI_SYSTEM_TABLE_SIGNATURE : constant := 16#5453595320494249#;  --  ../../gnu-efi/inc/efiapi.h:954
   --  unsupported macro: EFI_SYSTEM_TABLE_REVISION (EFI_SPECIFICATION_MAJOR_REVISION<<16) | (EFI_SPECIFICATION_MINOR_REVISION)

  --++
  --Copyright (c) 1998  Intel Corporation
  --Module Name:
  --    efiapi.h
  --Abstract:
  --    Global EFI runtime & boot service interfaces
  --Revision History
  ---- 

  -- EFI Specification Revision
  -- Declare forward referenced data structures
  -- EFI Memory
   type EFI_ALLOCATE_PAGES is access function
        (arg1 : efidef_h.EFI_ALLOCATE_TYPE;
         arg2 : efidef_h.EFI_MEMORY_TYPE;
         arg3 : efibind_h.UINTN;
         arg4 : access efidef_h.EFI_PHYSICAL_ADDRESS) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:42

   type EFI_FREE_PAGES is access function (arg1 : efidef_h.EFI_PHYSICAL_ADDRESS; arg2 : efibind_h.UINTN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:51

   type EFI_GET_MEMORY_MAP is access function
        (arg1 : access efibind_h.UINTN;
         arg2 : access efidef_h.EFI_MEMORY_DESCRIPTOR;
         arg3 : access efibind_h.UINTN;
         arg4 : access efibind_h.UINTN;
         arg5 : access efibind_h.UINT32) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:58

   type EFI_ALLOCATE_POOL is access function
        (arg1 : efidef_h.EFI_MEMORY_TYPE;
         arg2 : efibind_h.UINTN;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:71

   type EFI_FREE_POOL is access function (arg1 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:79

   type EFI_SET_VIRTUAL_ADDRESS_MAP is access function
        (arg1 : efibind_h.UINTN;
         arg2 : efibind_h.UINTN;
         arg3 : efibind_h.UINT32;
         arg4 : access efidef_h.EFI_MEMORY_DESCRIPTOR) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:85

   type EFI_CONVERT_POINTER is access function (arg1 : efibind_h.UINTN; arg2 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:100

  -- EFI Events
   type EFI_EVENT_NOTIFY is access procedure (arg1 : efidef_h.EFI_EVENT; arg2 : System.Address)
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:136

   type EFI_CREATE_EVENT is access function
        (arg1 : efibind_h.UINT32;
         arg2 : efidef_h.EFI_TPL;
         arg3 : EFI_EVENT_NOTIFY;
         arg4 : System.Address;
         arg5 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:143

   type EFI_TIMER_DELAY is 
     (TimerCancel,
      TimerPeriodic,
      TimerRelative,
      TimerTypeMax)
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:156

   type EFI_SET_TIMER is access function
        (arg1 : efidef_h.EFI_EVENT;
         arg2 : EFI_TIMER_DELAY;
         arg3 : efibind_h.UINT64) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:160

   type EFI_SIGNAL_EVENT is access function (arg1 : efidef_h.EFI_EVENT) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:168

   type EFI_WAIT_FOR_EVENT is access function
        (arg1 : efibind_h.UINTN;
         arg2 : System.Address;
         arg3 : access efibind_h.UINTN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:174

   type EFI_CLOSE_EVENT is access function (arg1 : efidef_h.EFI_EVENT) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:182

   type EFI_CHECK_EVENT is access function (arg1 : efidef_h.EFI_EVENT) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:188

  -- Task priority level
   type EFI_RAISE_TPL is access function (arg1 : efidef_h.EFI_TPL) return efidef_h.EFI_TPL
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:206

   type EFI_RESTORE_TPL is access procedure (arg1 : efidef_h.EFI_TPL)
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:212

  -- EFI platform varibles
  -- Variable attributes
  -- Variable size limitation
   type EFI_GET_VARIABLE is access function
        (arg1 : access efidef_h.CHAR16;
         arg2 : access efidef_h.EFI_GUID;
         arg3 : access efibind_h.UINT32;
         arg4 : access efibind_h.UINTN;
         arg5 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:238

   type EFI_GET_NEXT_VARIABLE_NAME is access function
        (arg1 : access efibind_h.UINTN;
         arg2 : access efidef_h.CHAR16;
         arg3 : access efidef_h.EFI_GUID) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:248

   type EFI_SET_VARIABLE is access function
        (arg1 : access efidef_h.CHAR16;
         arg2 : access efidef_h.EFI_GUID;
         arg3 : efibind_h.UINT32;
         arg4 : efibind_h.UINTN;
         arg5 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:257

  -- EFI Time
  -- 1e-6 parts per million
  -- hertz
  -- Set clears sub-second time
   type EFI_TIME_CAPABILITIES is record
      Resolution : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiapi.h:271
      Accuracy : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiapi.h:272
      SetsToZero : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiapi.h:273
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiapi.h:274

   type EFI_GET_TIME is access function (arg1 : access efidef_h.EFI_TIME; arg2 : access EFI_TIME_CAPABILITIES) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:279

   type EFI_SET_TIME is access function (arg1 : access efidef_h.EFI_TIME) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:286

   type EFI_GET_WAKEUP_TIME is access function
        (arg1 : access efidef_h.BOOLEAN;
         arg2 : access efidef_h.BOOLEAN;
         arg3 : access efidef_h.EFI_TIME) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:292

   type EFI_SET_WAKEUP_TIME is access function (arg1 : efidef_h.BOOLEAN; arg2 : access efidef_h.EFI_TIME) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:300

  -- Image functions
  -- PE32+ Subsystem type for EFI images
  -- PE32+ Machine type for EFI images
  -- Image Entry prototype
   type u_EFI_SYSTEM_TABLE;
   type EFI_IMAGE_ENTRY_POINT is access function (arg1 : efidef_h.EFI_HANDLE; arg2 : access u_EFI_SYSTEM_TABLE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:361

   type EFI_IMAGE_LOAD is access function
        (arg1 : efidef_h.BOOLEAN;
         arg2 : efidef_h.EFI_HANDLE;
         arg3 : access efidevp_h.u_EFI_DEVICE_PATH_PROTOCOL;
         arg4 : System.Address;
         arg5 : efibind_h.UINTN;
         arg6 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:368

   type EFI_IMAGE_START is access function
        (arg1 : efidef_h.EFI_HANDLE;
         arg2 : access efibind_h.UINTN;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:379

   type EFI_EXIT is access function
        (arg1 : efidef_h.EFI_HANDLE;
         arg2 : efidef_h.EFI_STATUS;
         arg3 : efibind_h.UINTN;
         arg4 : access efidef_h.CHAR16) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:387

  -- Image handle
  --#define LOADED_IMAGE_PROTOCOL          { 0x5B1B31A1, 0x9562, 0x11d2, {0x8E, 0x3F, 0x00, 0xA0, 0xC9, 0x69, 0x72, 0x3B} }
  --}
  --#define EFI_IMAGE_INFORMATION_REVISION      0x1000
  --typedef struct {
  --    UINT32                          Revision;
  --    EFI_HANDLE                      ParentHandle;
  --    struct _EFI_SYSTEM_TABLE        *SystemTable;
  --    // Source location of image
  --    EFI_HANDLE                      DeviceHandle;
  --    EFI_DEVICE_PATH                 *FilePath;
  --    VOID                            *Reserved;
  --    // Images load options
  --    UINT32                          LoadOptionsSize;
  --    VOID                            *LoadOptions;
  --    // Location of where image was loaded
  --    VOID                            *ImageBase;
  --    UINT64                          ImageSize;
  --    EFI_MEMORY_TYPE                 ImageCodeType;
  --    EFI_MEMORY_TYPE                 ImageDataType;
  --    // If the driver image supports a dynamic unload request
  --    EFI_IMAGE_UNLOAD                Unload;
  --} EFI_LOADED_IMAGE; 

   type EFI_EXIT_BOOT_SERVICES is access function (arg1 : efidef_h.EFI_HANDLE; arg2 : efibind_h.UINTN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:428

  -- Misc
   type EFI_STALL is access function (arg1 : efibind_h.UINTN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:440

   type EFI_SET_WATCHDOG_TIMER is access function
        (arg1 : efibind_h.UINTN;
         arg2 : efibind_h.UINT64;
         arg3 : efibind_h.UINTN;
         arg4 : access efidef_h.CHAR16) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:446

   type EFI_CONNECT_CONTROLLER is access function
        (arg1 : efidef_h.EFI_HANDLE;
         arg2 : System.Address;
         arg3 : access efidevp_h.u_EFI_DEVICE_PATH_PROTOCOL;
         arg4 : efidef_h.BOOLEAN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:455

   type EFI_DISCONNECT_CONTROLLER is access function
        (arg1 : efidef_h.EFI_HANDLE;
         arg2 : efidef_h.EFI_HANDLE;
         arg3 : efidef_h.EFI_HANDLE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:464

   type EFI_OPEN_PROTOCOL is access function
        (arg1 : efidef_h.EFI_HANDLE;
         arg2 : access efidef_h.EFI_GUID;
         arg3 : System.Address;
         arg4 : efidef_h.EFI_HANDLE;
         arg5 : efidef_h.EFI_HANDLE;
         arg6 : efibind_h.UINT32) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:479

   type EFI_CLOSE_PROTOCOL is access function
        (arg1 : efidef_h.EFI_HANDLE;
         arg2 : access efidef_h.EFI_GUID;
         arg3 : efidef_h.EFI_HANDLE;
         arg4 : efidef_h.EFI_HANDLE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:490

   type EFI_OPEN_PROTOCOL_INFORMATION_ENTRY is record
      AgentHandle : efidef_h.EFI_HANDLE;  -- ../../gnu-efi/inc/efiapi.h:498
      ControllerHandle : efidef_h.EFI_HANDLE;  -- ../../gnu-efi/inc/efiapi.h:499
      Attributes : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiapi.h:500
      OpenCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiapi.h:501
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiapi.h:502

   type EFI_OPEN_PROTOCOL_INFORMATION is access function
        (arg1 : efidef_h.EFI_HANDLE;
         arg2 : access efidef_h.EFI_GUID;
         arg3 : System.Address;
         arg4 : access efibind_h.UINTN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:506

   type EFI_PROTOCOLS_PER_HANDLE is access function
        (arg1 : efidef_h.EFI_HANDLE;
         arg2 : System.Address;
         arg3 : access efibind_h.UINTN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:515

   type EFI_LOCATE_SEARCH_TYPE is 
     (AllHandles,
      ByRegisterNotify,
      ByProtocol)
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:525

   type EFI_LOCATE_HANDLE_BUFFER is access function
        (arg1 : EFI_LOCATE_SEARCH_TYPE;
         arg2 : access efidef_h.EFI_GUID;
         arg3 : System.Address;
         arg4 : access efibind_h.UINTN;
         arg5 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:529

   type EFI_LOCATE_PROTOCOL is access function
        (arg1 : access efidef_h.EFI_GUID;
         arg2 : System.Address;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:539

   type EFI_INSTALL_MULTIPLE_PROTOCOL_INTERFACES is access function (arg1 : System.Address  -- , ...
         ) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:547

   type EFI_UNINSTALL_MULTIPLE_PROTOCOL_INTERFACES is access function (arg1 : efidef_h.EFI_HANDLE  -- , ...
         ) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:554

   type EFI_CALCULATE_CRC32 is access function
        (arg1 : System.Address;
         arg2 : efibind_h.UINTN;
         arg3 : access efibind_h.UINT32) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:561

   type EFI_COPY_MEM is access procedure
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : efibind_h.UINTN)
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:569

   type EFI_SET_MEM is access procedure
        (arg1 : System.Address;
         arg2 : efibind_h.UINTN;
         arg3 : efibind_h.UINT8)
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:577

   type EFI_CREATE_EVENT_EX is access function
        (arg1 : efibind_h.UINT32;
         arg2 : efidef_h.EFI_TPL;
         arg3 : EFI_EVENT_NOTIFY;
         arg4 : System.Address;
         arg5 : access constant efidef_h.EFI_GUID;
         arg6 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:586

   type EFI_RESET_TYPE is 
     (EfiResetCold,
      EfiResetWarm,
      EfiResetShutdown)
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:599

   type EFI_RESET_SYSTEM is access function
        (arg1 : EFI_RESET_TYPE;
         arg2 : efidef_h.EFI_STATUS;
         arg3 : efibind_h.UINTN;
         arg4 : access efidef_h.CHAR16) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:603

   type EFI_GET_NEXT_MONOTONIC_COUNT is access function (arg1 : access efibind_h.UINT64) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:612

   type EFI_GET_NEXT_HIGH_MONO_COUNT is access function (arg1 : access efibind_h.UINT32) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:618

   type anon_union2484 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            DataBlock : aliased efidef_h.EFI_PHYSICAL_ADDRESS;  -- ../../gnu-efi/inc/efiapi.h:625
         when others =>
            ContinuationPointer : aliased efidef_h.EFI_PHYSICAL_ADDRESS;  -- ../../gnu-efi/inc/efiapi.h:626
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type EFI_CAPSULE_BLOCK_DESCRIPTOR is record
      Length : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efiapi.h:623
      Union : aliased anon_union2484;  -- ../../gnu-efi/inc/efiapi.h:627
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiapi.h:628

   type EFI_CAPSULE_HEADER is record
      CapsuleGuid : aliased efidef_h.EFI_GUID;  -- ../../gnu-efi/inc/efiapi.h:631
      HeaderSize : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiapi.h:632
      Flags : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiapi.h:633
      CapsuleImageSize : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiapi.h:634
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiapi.h:635

   type EFI_UPDATE_CAPSULE is access function
        (arg1 : System.Address;
         arg2 : efibind_h.UINTN;
         arg3 : efidef_h.EFI_PHYSICAL_ADDRESS) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:643

   type EFI_QUERY_CAPSULE_CAPABILITIES is access function
        (arg1 : System.Address;
         arg2 : efibind_h.UINTN;
         arg3 : access efibind_h.UINT64;
         arg4 : access EFI_RESET_TYPE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:651

   type EFI_QUERY_VARIABLE_INFO is access function
        (arg1 : efibind_h.UINT32;
         arg2 : access efibind_h.UINT64;
         arg3 : access efibind_h.UINT64;
         arg4 : access efibind_h.UINT64) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:660

  -- Protocol handler functions
   type EFI_INTERFACE_TYPE is 
     (EFI_NATIVE_INTERFACE,
      EFI_PCODE_INTERFACE)
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:674

   type EFI_INSTALL_PROTOCOL_INTERFACE is access function
        (arg1 : System.Address;
         arg2 : access efidef_h.EFI_GUID;
         arg3 : EFI_INTERFACE_TYPE;
         arg4 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:678

   type EFI_REINSTALL_PROTOCOL_INTERFACE is access function
        (arg1 : efidef_h.EFI_HANDLE;
         arg2 : access efidef_h.EFI_GUID;
         arg3 : System.Address;
         arg4 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:687

   type EFI_UNINSTALL_PROTOCOL_INTERFACE is access function
        (arg1 : efidef_h.EFI_HANDLE;
         arg2 : access efidef_h.EFI_GUID;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:696

   type EFI_HANDLE_PROTOCOL is access function
        (arg1 : efidef_h.EFI_HANDLE;
         arg2 : access efidef_h.EFI_GUID;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:704

   type EFI_REGISTER_PROTOCOL_NOTIFY is access function
        (arg1 : access efidef_h.EFI_GUID;
         arg2 : efidef_h.EFI_EVENT;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:712

   type EFI_LOCATE_HANDLE is access function
        (arg1 : EFI_LOCATE_SEARCH_TYPE;
         arg2 : access efidef_h.EFI_GUID;
         arg3 : System.Address;
         arg4 : access efibind_h.UINTN;
         arg5 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:720

   type EFI_LOCATE_DEVICE_PATH is access function
        (arg1 : access efidef_h.EFI_GUID;
         arg2 : System.Address;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:730

   type EFI_INSTALL_CONFIGURATION_TABLE is access function (arg1 : access efidef_h.EFI_GUID; arg2 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:738

   type EFI_RESERVED_SERVICE is access function return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiapi.h:745

  -- Standard EFI table header
   type u_EFI_TABLE_HEADER is record
      Signature : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efiapi.h:753
      Revision : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiapi.h:754
      HeaderSize : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiapi.h:755
      CRC32 : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiapi.h:756
      Reserved : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiapi.h:757
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiapi.h:752

   subtype EFI_TABLE_HEADER is u_EFI_TABLE_HEADER;  -- ../../gnu-efi/inc/efiapi.h:758

  -- EFI Runtime Serivces Table
  -- Time services
  -- Virtual memory services
  -- Variable serviers
  -- Misc
   type EFI_RUNTIME_SERVICES is record
      Hdr : aliased EFI_TABLE_HEADER;  -- ../../gnu-efi/inc/efiapi.h:769
      GetTime : EFI_GET_TIME;  -- ../../gnu-efi/inc/efiapi.h:775
      SetTime : EFI_SET_TIME;  -- ../../gnu-efi/inc/efiapi.h:776
      GetWakeupTime : EFI_GET_WAKEUP_TIME;  -- ../../gnu-efi/inc/efiapi.h:777
      SetWakeupTime : EFI_SET_WAKEUP_TIME;  -- ../../gnu-efi/inc/efiapi.h:778
      SetVirtualAddressMap : EFI_SET_VIRTUAL_ADDRESS_MAP;  -- ../../gnu-efi/inc/efiapi.h:784
      ConvertPointer : EFI_CONVERT_POINTER;  -- ../../gnu-efi/inc/efiapi.h:785
      GetVariable : EFI_GET_VARIABLE;  -- ../../gnu-efi/inc/efiapi.h:791
      GetNextVariableName : EFI_GET_NEXT_VARIABLE_NAME;  -- ../../gnu-efi/inc/efiapi.h:792
      SetVariable : EFI_SET_VARIABLE;  -- ../../gnu-efi/inc/efiapi.h:793
      GetNextHighMonotonicCount : EFI_GET_NEXT_HIGH_MONO_COUNT;  -- ../../gnu-efi/inc/efiapi.h:799
      ResetSystem : EFI_RESET_SYSTEM;  -- ../../gnu-efi/inc/efiapi.h:800
      UpdateCapsule : EFI_UPDATE_CAPSULE;  -- ../../gnu-efi/inc/efiapi.h:802
      QueryCapsuleCapabilities : EFI_QUERY_CAPSULE_CAPABILITIES;  -- ../../gnu-efi/inc/efiapi.h:803
      QueryVariableInfo : EFI_QUERY_VARIABLE_INFO;  -- ../../gnu-efi/inc/efiapi.h:804
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiapi.h:805

  -- EFI Boot Services Table
   type u_EFI_BOOT_SERVICES is record
      Hdr : aliased EFI_TABLE_HEADER;  -- ../../gnu-efi/inc/efiapi.h:817
      RaiseTPL : EFI_RAISE_TPL;  -- ../../gnu-efi/inc/efiapi.h:823
      RestoreTPL : EFI_RESTORE_TPL;  -- ../../gnu-efi/inc/efiapi.h:824
      AllocatePages : EFI_ALLOCATE_PAGES;  -- ../../gnu-efi/inc/efiapi.h:830
      FreePages : EFI_FREE_PAGES;  -- ../../gnu-efi/inc/efiapi.h:831
      GetMemoryMap : EFI_GET_MEMORY_MAP;  -- ../../gnu-efi/inc/efiapi.h:832
      AllocatePool : EFI_ALLOCATE_POOL;  -- ../../gnu-efi/inc/efiapi.h:833
      FreePool : EFI_FREE_POOL;  -- ../../gnu-efi/inc/efiapi.h:834
      CreateEvent : EFI_CREATE_EVENT;  -- ../../gnu-efi/inc/efiapi.h:840
      SetTimer : EFI_SET_TIMER;  -- ../../gnu-efi/inc/efiapi.h:841
      WaitForEvent : EFI_WAIT_FOR_EVENT;  -- ../../gnu-efi/inc/efiapi.h:842
      SignalEvent : EFI_SIGNAL_EVENT;  -- ../../gnu-efi/inc/efiapi.h:843
      CloseEvent : EFI_CLOSE_EVENT;  -- ../../gnu-efi/inc/efiapi.h:844
      CheckEvent : EFI_CHECK_EVENT;  -- ../../gnu-efi/inc/efiapi.h:845
      InstallProtocolInterface : EFI_INSTALL_PROTOCOL_INTERFACE;  -- ../../gnu-efi/inc/efiapi.h:851
      ReinstallProtocolInterface : EFI_REINSTALL_PROTOCOL_INTERFACE;  -- ../../gnu-efi/inc/efiapi.h:852
      UninstallProtocolInterface : EFI_UNINSTALL_PROTOCOL_INTERFACE;  -- ../../gnu-efi/inc/efiapi.h:853
      HandleProtocol : EFI_HANDLE_PROTOCOL;  -- ../../gnu-efi/inc/efiapi.h:854
      PCHandleProtocol : EFI_HANDLE_PROTOCOL;  -- ../../gnu-efi/inc/efiapi.h:855
      RegisterProtocolNotify : EFI_REGISTER_PROTOCOL_NOTIFY;  -- ../../gnu-efi/inc/efiapi.h:856
      LocateHandle : EFI_LOCATE_HANDLE;  -- ../../gnu-efi/inc/efiapi.h:857
      LocateDevicePath : EFI_LOCATE_DEVICE_PATH;  -- ../../gnu-efi/inc/efiapi.h:858
      InstallConfigurationTable : EFI_INSTALL_CONFIGURATION_TABLE;  -- ../../gnu-efi/inc/efiapi.h:859
      LoadImage : EFI_IMAGE_LOAD;  -- ../../gnu-efi/inc/efiapi.h:865
      StartImage : EFI_IMAGE_START;  -- ../../gnu-efi/inc/efiapi.h:866
      c_Exit : EFI_EXIT;  -- ../../gnu-efi/inc/efiapi.h:867
      UnloadImage : efiprot_h.EFI_IMAGE_UNLOAD;  -- ../../gnu-efi/inc/efiapi.h:868
      ExitBootServices : EFI_EXIT_BOOT_SERVICES;  -- ../../gnu-efi/inc/efiapi.h:869
      GetNextMonotonicCount : EFI_GET_NEXT_MONOTONIC_COUNT;  -- ../../gnu-efi/inc/efiapi.h:875
      Stall : EFI_STALL;  -- ../../gnu-efi/inc/efiapi.h:876
      SetWatchdogTimer : EFI_SET_WATCHDOG_TIMER;  -- ../../gnu-efi/inc/efiapi.h:877
      ConnectController : EFI_CONNECT_CONTROLLER;  -- ../../gnu-efi/inc/efiapi.h:883
      DisconnectController : EFI_DISCONNECT_CONTROLLER;  -- ../../gnu-efi/inc/efiapi.h:884
      OpenProtocol : EFI_OPEN_PROTOCOL;  -- ../../gnu-efi/inc/efiapi.h:889
      CloseProtocol : EFI_CLOSE_PROTOCOL;  -- ../../gnu-efi/inc/efiapi.h:890
      OpenProtocolInformation : EFI_OPEN_PROTOCOL_INFORMATION;  -- ../../gnu-efi/inc/efiapi.h:891
      ProtocolsPerHandle : EFI_PROTOCOLS_PER_HANDLE;  -- ../../gnu-efi/inc/efiapi.h:896
      LocateHandleBuffer : EFI_LOCATE_HANDLE_BUFFER;  -- ../../gnu-efi/inc/efiapi.h:897
      LocateProtocol : EFI_LOCATE_PROTOCOL;  -- ../../gnu-efi/inc/efiapi.h:898
      InstallMultipleProtocolInterfaces : EFI_INSTALL_MULTIPLE_PROTOCOL_INTERFACES;  -- ../../gnu-efi/inc/efiapi.h:899
      UninstallMultipleProtocolInterfaces : EFI_UNINSTALL_MULTIPLE_PROTOCOL_INTERFACES;  -- ../../gnu-efi/inc/efiapi.h:900
      CalculateCrc32 : EFI_CALCULATE_CRC32;  -- ../../gnu-efi/inc/efiapi.h:905
      CopyMem : EFI_COPY_MEM;  -- ../../gnu-efi/inc/efiapi.h:910
      SetMem : EFI_SET_MEM;  -- ../../gnu-efi/inc/efiapi.h:911
      CreateEventEx : EFI_CREATE_EVENT_EX;  -- ../../gnu-efi/inc/efiapi.h:912
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiapi.h:815

  -- Task priority functions
  -- Memory functions
  -- Event & timer functions
  -- Protocol handler functions
  -- Image functions
  -- Misc functions
  -- DriverSupport Services
  -- Open and Close Protocol Services
  -- Library Services
  -- 32-bit CRC Services
  -- Misc Services
   subtype EFI_BOOT_SERVICES is u_EFI_BOOT_SERVICES;  -- ../../gnu-efi/inc/efiapi.h:913

  -- EFI Configuration Table and GUID definitions
   type u_EFI_CONFIGURATION_TABLE is record
      VendorGuid : aliased efidef_h.EFI_GUID;  -- ../../gnu-efi/inc/efiapi.h:942
      VendorTable : System.Address;  -- ../../gnu-efi/inc/efiapi.h:943
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiapi.h:941

   subtype EFI_CONFIGURATION_TABLE is u_EFI_CONFIGURATION_TABLE;  -- ../../gnu-efi/inc/efiapi.h:944

  -- EFI System Table
   type u_EFI_SYSTEM_TABLE is record
      Hdr : aliased EFI_TABLE_HEADER;  -- ../../gnu-efi/inc/efiapi.h:958
      FirmwareVendor : access efidef_h.CHAR16;  -- ../../gnu-efi/inc/efiapi.h:960
      FirmwareRevision : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiapi.h:961
      ConsoleInHandle : efidef_h.EFI_HANDLE;  -- ../../gnu-efi/inc/efiapi.h:963
      ConIn : access eficon_h.u_SIMPLE_INPUT_INTERFACE;  -- ../../gnu-efi/inc/efiapi.h:964
      ConsoleOutHandle : efidef_h.EFI_HANDLE;  -- ../../gnu-efi/inc/efiapi.h:966
      ConOut : access eficon_h.u_SIMPLE_TEXT_OUTPUT_INTERFACE;  -- ../../gnu-efi/inc/efiapi.h:967
      StandardErrorHandle : efidef_h.EFI_HANDLE;  -- ../../gnu-efi/inc/efiapi.h:969
      StdErr : access eficon_h.u_SIMPLE_TEXT_OUTPUT_INTERFACE;  -- ../../gnu-efi/inc/efiapi.h:970
      RuntimeServices : access EFI_RUNTIME_SERVICES;  -- ../../gnu-efi/inc/efiapi.h:972
      BootServices : access EFI_BOOT_SERVICES;  -- ../../gnu-efi/inc/efiapi.h:973
      NumberOfTableEntries : aliased efibind_h.UINTN;  -- ../../gnu-efi/inc/efiapi.h:975
      ConfigurationTable : access EFI_CONFIGURATION_TABLE;  -- ../../gnu-efi/inc/efiapi.h:976
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiapi.h:957

   subtype EFI_SYSTEM_TABLE is u_EFI_SYSTEM_TABLE;  -- ../../gnu-efi/inc/efiapi.h:978

end efiapi_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
