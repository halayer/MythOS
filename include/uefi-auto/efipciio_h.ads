pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with efibind_h;
with efidef_h;
with System;

package efipciio_h is

   --  unsupported macro: EFI_PCI_IO_PROTOCOL_GUID { 0x4cf5b200, 0x68b8, 0x4ca5, {0x9e, 0xec, 0xb2, 0x3e, 0x3f, 0x50, 0x02, 0x9a} }
   --  unsupported macro: EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_GUID { 0x2f707ebb, 0x4a1a, 0x11d4, {0x9a, 0x38, 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
   EFI_PCI_IO_PASS_THROUGH_BAR : constant := 16#ff#;  --  ../../gnu-efi/inc/efipciio.h:29

   EFI_PCI_ATTRIBUTE_ISA_MOTHERBOARD_IO : constant := 16#0001#;  --  ../../gnu-efi/inc/efipciio.h:244
   EFI_PCI_ATTRIBUTE_ISA_IO : constant := 16#0002#;  --  ../../gnu-efi/inc/efipciio.h:245
   EFI_PCI_ATTRIBUTE_VGA_PALETTE_IO : constant := 16#0004#;  --  ../../gnu-efi/inc/efipciio.h:246
   EFI_PCI_ATTRIBUTE_VGA_MEMORY : constant := 16#0008#;  --  ../../gnu-efi/inc/efipciio.h:247
   EFI_PCI_ATTRIBUTE_VGA_IO : constant := 16#0010#;  --  ../../gnu-efi/inc/efipciio.h:248
   EFI_PCI_ATTRIBUTE_IDE_PRIMARY_IO : constant := 16#0020#;  --  ../../gnu-efi/inc/efipciio.h:249
   EFI_PCI_ATTRIBUTE_IDE_SECONDARY_IO : constant := 16#0040#;  --  ../../gnu-efi/inc/efipciio.h:250
   EFI_PCI_ATTRIBUTE_MEMORY_WRITE_COMBINE : constant := 16#0080#;  --  ../../gnu-efi/inc/efipciio.h:251
   EFI_PCI_ATTRIBUTE_IO : constant := 16#0100#;  --  ../../gnu-efi/inc/efipciio.h:252
   EFI_PCI_ATTRIBUTE_MEMORY : constant := 16#0200#;  --  ../../gnu-efi/inc/efipciio.h:253
   EFI_PCI_ATTRIBUTE_BUS_MASTER : constant := 16#0400#;  --  ../../gnu-efi/inc/efipciio.h:254
   EFI_PCI_ATTRIBUTE_MEMORY_CACHED : constant := 16#0800#;  --  ../../gnu-efi/inc/efipciio.h:255
   EFI_PCI_ATTRIBUTE_MEMORY_DISABLE : constant := 16#1000#;  --  ../../gnu-efi/inc/efipciio.h:256
   EFI_PCI_ATTRIBUTE_EMBEDDED_DEVICE : constant := 16#2000#;  --  ../../gnu-efi/inc/efipciio.h:257
   EFI_PCI_ATTRIBUTE_EMBEDDED_ROM : constant := 16#4000#;  --  ../../gnu-efi/inc/efipciio.h:258
   EFI_PCI_ATTRIBUTE_DUAL_ADDRESS_CYCLE : constant := 16#8000#;  --  ../../gnu-efi/inc/efipciio.h:259
   EFI_PCI_ATTRIBUTE_ISA_IO_16 : constant := 16#10000#;  --  ../../gnu-efi/inc/efipciio.h:260
   EFI_PCI_ATTRIBUTE_VGA_PALETTE_IO_16 : constant := 16#20000#;  --  ../../gnu-efi/inc/efipciio.h:261
   EFI_PCI_ATTRIBUTE_VGA_IO_16 : constant := 16#40000#;  --  ../../gnu-efi/inc/efipciio.h:262
   --  unsupported macro: EFI_PCI_IO_ATTRIBUTE_ISA_MOTHERBOARD_IO EFI_PCI_ATTRIBUTE_ISA_MOTHERBOARD_IO
   --  unsupported macro: EFI_PCI_IO_ATTRIBUTE_ISA_IO EFI_PCI_ATTRIBUTE_ISA_IO
   --  unsupported macro: EFI_PCI_IO_ATTRIBUTE_VGA_PALETTE_IO EFI_PCI_ATTRIBUTE_VGA_PALETTE_IO
   --  unsupported macro: EFI_PCI_IO_ATTRIBUTE_VGA_MEMORY EFI_PCI_ATTRIBUTE_VGA_MEMORY
   --  unsupported macro: EFI_PCI_IO_ATTRIBUTE_VGA_IO EFI_PCI_ATTRIBUTE_VGA_IO
   --  unsupported macro: EFI_PCI_IO_ATTRIBUTE_IDE_PRIMARY_IO EFI_PCI_ATTRIBUTE_IDE_PRIMARY_IO
   --  unsupported macro: EFI_PCI_IO_ATTRIBUTE_IDE_SECONDARY_IO EFI_PCI_ATTRIBUTE_IDE_SECONDARY_IO
   --  unsupported macro: EFI_PCI_IO_ATTRIBUTE_MEMORY_WRITE_COMBINE EFI_PCI_ATTRIBUTE_MEMORY_WRITE_COMBINE
   --  unsupported macro: EFI_PCI_IO_ATTRIBUTE_IO EFI_PCI_ATTRIBUTE_IO
   --  unsupported macro: EFI_PCI_IO_ATTRIBUTE_MEMORY EFI_PCI_ATTRIBUTE_MEMORY
   --  unsupported macro: EFI_PCI_IO_ATTRIBUTE_BUS_MASTER EFI_PCI_ATTRIBUTE_BUS_MASTER
   --  unsupported macro: EFI_PCI_IO_ATTRIBUTE_MEMORY_CACHED EFI_PCI_ATTRIBUTE_MEMORY_CACHED
   --  unsupported macro: EFI_PCI_IO_ATTRIBUTE_MEMORY_DISABLE EFI_PCI_ATTRIBUTE_MEMORY_DISABLE
   --  unsupported macro: EFI_PCI_IO_ATTRIBUTE_EMBEDDED_DEVICE EFI_PCI_ATTRIBUTE_EMBEDDED_DEVICE
   --  unsupported macro: EFI_PCI_IO_ATTRIBUTE_EMBEDDED_ROM EFI_PCI_ATTRIBUTE_EMBEDDED_ROM
   --  unsupported macro: EFI_PCI_IO_ATTRIBUTE_DUAL_ADDRESS_CYCLE EFI_PCI_ATTRIBUTE_DUAL_ADDRESS_CYCLE
   --  unsupported macro: EFI_PCI_IO_ATTRIBUTE_ISA_IO_16 EFI_PCI_ATTRIBUTE_ISA_IO_16
   --  unsupported macro: EFI_PCI_IO_ATTRIBUTE_VGA_PALETTE_IO_16 EFI_PCI_ATTRIBUTE_VGA_PALETTE_IO_16
   --  unsupported macro: EFI_PCI_IO_ATTRIBUTE_VGA_IO_16 EFI_PCI_ATTRIBUTE_VGA_IO_16
   --  unsupported macro: EFI_PCI_ATTRIBUTE_VALID_FOR_ALLOCATE_BUFFER (EFI_PCI_ATTRIBUTE_MEMORY_WRITE_COMBINE | EFI_PCI_ATTRIBUTE_MEMORY_CACHED | EFI_PCI_ATTRIBUTE_DUAL_ADDRESS_CYCLE)
   --  unsupported macro: EFI_PCI_ATTRIBUTE_INVALID_FOR_ALLOCATE_BUFFER (~EFI_PCI_ATTRIBUTE_VALID_FOR_ALLOCATE_BUFFER)

   type EFI_PCI_IO_PROTOCOL_WIDTH is 
     (EfiPciIoWidthUint8,
      EfiPciIoWidthUint16,
      EfiPciIoWidthUint32,
      EfiPciIoWidthUint64,
      EfiPciIoWidthFifoUint8,
      EfiPciIoWidthFifoUint16,
      EfiPciIoWidthFifoUint32,
      EfiPciIoWidthFifoUint64,
      EfiPciIoWidthFillUint8,
      EfiPciIoWidthFillUint16,
      EfiPciIoWidthFillUint32,
      EfiPciIoWidthFillUint64,
      EfiPciIoWidthMaximum)
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:27

   type EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_WIDTH is 
     (EfiPciIoWidthUint8,
      EfiPciIoWidthUint16,
      EfiPciIoWidthUint32,
      EfiPciIoWidthUint64,
      EfiPciIoWidthFifoUint8,
      EfiPciIoWidthFifoUint16,
      EfiPciIoWidthFifoUint32,
      EfiPciIoWidthFifoUint64,
      EfiPciIoWidthFillUint8,
      EfiPciIoWidthFillUint16,
      EfiPciIoWidthFillUint32,
      EfiPciIoWidthFillUint64,
      EfiPciIoWidthMaximum)
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:27

   type u_EFI_PCI_IO_PROTOCOL;
   type EFI_PCI_IO_PROTOCOL_POLL_IO_MEM is access function
        (arg1 : access u_EFI_PCI_IO_PROTOCOL;
         arg2 : EFI_PCI_IO_PROTOCOL_WIDTH;
         arg3 : efibind_h.UINT8;
         arg4 : efibind_h.UINT64;
         arg5 : efibind_h.UINT64;
         arg6 : efibind_h.UINT64;
         arg7 : efibind_h.UINT64;
         arg8 : access efibind_h.UINT64) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:33

   type u_EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL;
   type EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_POLL_IO_MEM is access function
        (arg1 : access u_EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL;
         arg2 : EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_WIDTH;
         arg3 : efibind_h.UINT64;
         arg4 : efibind_h.UINT64;
         arg5 : efibind_h.UINT64;
         arg6 : efibind_h.UINT64;
         arg7 : access efibind_h.UINT64) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:46

   type EFI_PCI_IO_PROTOCOL_IO_MEM is access function
        (arg1 : access u_EFI_PCI_IO_PROTOCOL;
         arg2 : EFI_PCI_IO_PROTOCOL_WIDTH;
         arg3 : efibind_h.UINT8;
         arg4 : efibind_h.UINT64;
         arg5 : efibind_h.UINTN;
         arg6 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:58

   type EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_IO_MEM is access function
        (arg1 : access u_EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL;
         arg2 : EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_WIDTH;
         arg3 : efibind_h.UINT64;
         arg4 : efibind_h.UINTN;
         arg5 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:69

   type EFI_PCI_IO_PROTOCOL_ACCESS is record
      Read : EFI_PCI_IO_PROTOCOL_IO_MEM;  -- ../../gnu-efi/inc/efipciio.h:78
      Write : EFI_PCI_IO_PROTOCOL_IO_MEM;  -- ../../gnu-efi/inc/efipciio.h:79
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipciio.h:80

   type EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_ACCESS is record
      Read : EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_IO_MEM;  -- ../../gnu-efi/inc/efipciio.h:83
      Write : EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_IO_MEM;  -- ../../gnu-efi/inc/efipciio.h:84
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipciio.h:85

   type EFI_PCI_IO_PROTOCOL_CONFIG is access function
        (arg1 : access u_EFI_PCI_IO_PROTOCOL;
         arg2 : EFI_PCI_IO_PROTOCOL_WIDTH;
         arg3 : efibind_h.UINT32;
         arg4 : efibind_h.UINTN;
         arg5 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:89

   type EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_CONFIGURATION is access function (arg1 : access u_EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL; arg2 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:99

   type EFI_PCI_IO_PROTOCOL_CONFIG_ACCESS is record
      Read : EFI_PCI_IO_PROTOCOL_CONFIG;  -- ../../gnu-efi/inc/efipciio.h:105
      Write : EFI_PCI_IO_PROTOCOL_CONFIG;  -- ../../gnu-efi/inc/efipciio.h:106
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipciio.h:107

   type EFI_PCI_IO_PROTOCOL_COPY_MEM is access function
        (arg1 : access u_EFI_PCI_IO_PROTOCOL;
         arg2 : EFI_PCI_IO_PROTOCOL_WIDTH;
         arg3 : efibind_h.UINT8;
         arg4 : efibind_h.UINT64;
         arg5 : efibind_h.UINT8;
         arg6 : efibind_h.UINT64;
         arg7 : efibind_h.UINTN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:111

   type EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_COPY_MEM is access function
        (arg1 : access u_EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL;
         arg2 : EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_WIDTH;
         arg3 : efibind_h.UINT64;
         arg4 : efibind_h.UINT64;
         arg5 : efibind_h.UINTN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:123

   type EFI_PCI_IO_PROTOCOL_OPERATION is 
     (EfiPciIoOperationBusMasterRead,
      EfiPciIoOperationBusMasterWrite,
      EfiPciIoOperationBusMasterCommonBuffer,
      EfiPciIoOperationMaximum)
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:136

   type EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_OPERATION is 
     (EfiPciOperationBusMasterRead,
      EfiPciOperationBusMasterWrite,
      EfiPciOperationBusMasterCommonBuffer,
      EfiPciOperationBusMasterRead64,
      EfiPciOperationBusMasterWrite64,
      EfiPciOperationBusMasterCommonBuffer64,
      EfiPciOperationMaximum)
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:146

   type EFI_PCI_IO_PROTOCOL_MAP is access function
        (arg1 : access u_EFI_PCI_IO_PROTOCOL;
         arg2 : EFI_PCI_IO_PROTOCOL_OPERATION;
         arg3 : System.Address;
         arg4 : access efibind_h.UINTN;
         arg5 : access efidef_h.EFI_PHYSICAL_ADDRESS;
         arg6 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:150

   type EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_MAP is access function
        (arg1 : access u_EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL;
         arg2 : EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_OPERATION;
         arg3 : System.Address;
         arg4 : access efibind_h.UINTN;
         arg5 : access efidef_h.EFI_PHYSICAL_ADDRESS;
         arg6 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:161

   type EFI_PCI_IO_PROTOCOL_UNMAP is access function (arg1 : access u_EFI_PCI_IO_PROTOCOL; arg2 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:172

   type EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_UNMAP is access function (arg1 : access u_EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL; arg2 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:179

   type EFI_PCI_IO_PROTOCOL_ALLOCATE_BUFFER is access function
        (arg1 : access u_EFI_PCI_IO_PROTOCOL;
         arg2 : efidef_h.EFI_ALLOCATE_TYPE;
         arg3 : efidef_h.EFI_MEMORY_TYPE;
         arg4 : efibind_h.UINTN;
         arg5 : System.Address;
         arg6 : efibind_h.UINT64) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:186

   type EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_ALLOCATE_BUFFER is access function
        (arg1 : access u_EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL;
         arg2 : efidef_h.EFI_ALLOCATE_TYPE;
         arg3 : efidef_h.EFI_MEMORY_TYPE;
         arg4 : efibind_h.UINTN;
         arg5 : System.Address;
         arg6 : efibind_h.UINT64) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:197

   type EFI_PCI_IO_PROTOCOL_FREE_BUFFER is access function
        (arg1 : access u_EFI_PCI_IO_PROTOCOL;
         arg2 : efibind_h.UINTN;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:208

   type EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_FREE_BUFFER is access function
        (arg1 : access u_EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL;
         arg2 : efibind_h.UINTN;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:216

   type EFI_PCI_IO_PROTOCOL_FLUSH is access function (arg1 : access u_EFI_PCI_IO_PROTOCOL) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:224

   type EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_FLUSH is access function (arg1 : access u_EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:230

   type EFI_PCI_IO_PROTOCOL_GET_LOCATION is access function
        (arg1 : access u_EFI_PCI_IO_PROTOCOL;
         arg2 : access efibind_h.UINTN;
         arg3 : access efibind_h.UINTN;
         arg4 : access efibind_h.UINTN;
         arg5 : access efibind_h.UINTN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:236

   type EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_PCI_ADDRESS is record
      Register : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efipciio.h:291
      c_Function : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efipciio.h:292
      Device : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efipciio.h:293
      Bus : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efipciio.h:294
      ExtendedRegister : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efipciio.h:295
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipciio.h:296

   type EFI_PCI_IO_PROTOCOL_ATTRIBUTE_OPERATION is 
     (EfiPciIoAttributeOperationGet,
      EfiPciIoAttributeOperationSet,
      EfiPciIoAttributeOperationEnable,
      EfiPciIoAttributeOperationDisable,
      EfiPciIoAttributeOperationSupported,
      EfiPciIoAttributeOperationMaximum)
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:305

   type EFI_PCI_IO_PROTOCOL_ATTRIBUTES is access function
        (arg1 : access u_EFI_PCI_IO_PROTOCOL;
         arg2 : EFI_PCI_IO_PROTOCOL_ATTRIBUTE_OPERATION;
         arg3 : efibind_h.UINT64;
         arg4 : access efibind_h.UINT64) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:309

   type EFI_PCI_IO_PROTOCOL_GET_BAR_ATTRIBUTES is access function
        (arg1 : access u_EFI_PCI_IO_PROTOCOL;
         arg2 : efibind_h.UINT8;
         arg3 : access efibind_h.UINT64;
         arg4 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:318

   type EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_GET_ATTRIBUTES is access function
        (arg1 : access u_EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL;
         arg2 : access efibind_h.UINT64;
         arg3 : access efibind_h.UINT64) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:327

   type EFI_PCI_IO_PROTOCOL_SET_BAR_ATTRIBUTES is access function
        (arg1 : access u_EFI_PCI_IO_PROTOCOL;
         arg2 : efibind_h.UINT64;
         arg3 : efibind_h.UINT8;
         arg4 : access efibind_h.UINT64;
         arg5 : access efibind_h.UINT64) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:335

   type EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_SET_ATTRIBUTES is access function
        (arg1 : access u_EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL;
         arg2 : efibind_h.UINT64;
         arg3 : access efibind_h.UINT64;
         arg4 : access efibind_h.UINT64) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipciio.h:345

   type u_EFI_PCI_IO_PROTOCOL is record
      PollMem : EFI_PCI_IO_PROTOCOL_POLL_IO_MEM;  -- ../../gnu-efi/inc/efipciio.h:353
      PollIo : EFI_PCI_IO_PROTOCOL_POLL_IO_MEM;  -- ../../gnu-efi/inc/efipciio.h:354
      Mem : aliased EFI_PCI_IO_PROTOCOL_ACCESS;  -- ../../gnu-efi/inc/efipciio.h:355
      Io : aliased EFI_PCI_IO_PROTOCOL_ACCESS;  -- ../../gnu-efi/inc/efipciio.h:356
      Pci : aliased EFI_PCI_IO_PROTOCOL_CONFIG_ACCESS;  -- ../../gnu-efi/inc/efipciio.h:357
      CopyMem : EFI_PCI_IO_PROTOCOL_COPY_MEM;  -- ../../gnu-efi/inc/efipciio.h:358
      Map : EFI_PCI_IO_PROTOCOL_MAP;  -- ../../gnu-efi/inc/efipciio.h:359
      Unmap : EFI_PCI_IO_PROTOCOL_UNMAP;  -- ../../gnu-efi/inc/efipciio.h:360
      AllocateBuffer : EFI_PCI_IO_PROTOCOL_ALLOCATE_BUFFER;  -- ../../gnu-efi/inc/efipciio.h:361
      FreeBuffer : EFI_PCI_IO_PROTOCOL_FREE_BUFFER;  -- ../../gnu-efi/inc/efipciio.h:362
      Flush : EFI_PCI_IO_PROTOCOL_FLUSH;  -- ../../gnu-efi/inc/efipciio.h:363
      GetLocation : EFI_PCI_IO_PROTOCOL_GET_LOCATION;  -- ../../gnu-efi/inc/efipciio.h:364
      Attributes : EFI_PCI_IO_PROTOCOL_ATTRIBUTES;  -- ../../gnu-efi/inc/efipciio.h:365
      GetBarAttributes : EFI_PCI_IO_PROTOCOL_GET_BAR_ATTRIBUTES;  -- ../../gnu-efi/inc/efipciio.h:366
      SetBarAttributes : EFI_PCI_IO_PROTOCOL_SET_BAR_ATTRIBUTES;  -- ../../gnu-efi/inc/efipciio.h:367
      RomSize : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efipciio.h:368
      RomImage : System.Address;  -- ../../gnu-efi/inc/efipciio.h:369
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipciio.h:352

   subtype EFI_PCI_IO_PROTOCOL is u_EFI_PCI_IO_PROTOCOL;  -- ../../gnu-efi/inc/efipciio.h:370

  -- Note: Because it conflicted with the EDK2 struct name, the
  -- 'EFI_PCI_IO_PROTOCOL' GUID definition, from older versions
  -- of gnu-efi, is now obsoleted.
  -- Use 'EFI_PCI_IO_PROTOCOL_GUID' instead.
   subtype u_EFI_PCI_IO is u_EFI_PCI_IO_PROTOCOL;  -- ../../gnu-efi/inc/efipciio.h:377

   subtype EFI_PCI_IO is EFI_PCI_IO_PROTOCOL;  -- ../../gnu-efi/inc/efipciio.h:378

   type u_EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL is record
      ParentHandle : efidef_h.EFI_HANDLE;  -- ../../gnu-efi/inc/efipciio.h:381
      PollMem : EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_POLL_IO_MEM;  -- ../../gnu-efi/inc/efipciio.h:382
      PollIo : EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_POLL_IO_MEM;  -- ../../gnu-efi/inc/efipciio.h:383
      Mem : aliased EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_ACCESS;  -- ../../gnu-efi/inc/efipciio.h:384
      Io : aliased EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_ACCESS;  -- ../../gnu-efi/inc/efipciio.h:385
      Pci : aliased EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_ACCESS;  -- ../../gnu-efi/inc/efipciio.h:386
      CopyMem : EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_COPY_MEM;  -- ../../gnu-efi/inc/efipciio.h:387
      Map : EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_MAP;  -- ../../gnu-efi/inc/efipciio.h:388
      Unmap : EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_UNMAP;  -- ../../gnu-efi/inc/efipciio.h:389
      AllocateBuffer : EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_ALLOCATE_BUFFER;  -- ../../gnu-efi/inc/efipciio.h:390
      FreeBuffer : EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_FREE_BUFFER;  -- ../../gnu-efi/inc/efipciio.h:391
      Flush : EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_FLUSH;  -- ../../gnu-efi/inc/efipciio.h:392
      GetAttributes : EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_GET_ATTRIBUTES;  -- ../../gnu-efi/inc/efipciio.h:393
      SetAttributes : EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_SET_ATTRIBUTES;  -- ../../gnu-efi/inc/efipciio.h:394
      Configuration : EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL_CONFIGURATION;  -- ../../gnu-efi/inc/efipciio.h:395
      SegmentNumber : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efipciio.h:396
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipciio.h:380

   subtype EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL is u_EFI_PCI_ROOT_BRIDGE_IO_PROTOCOL;  -- ../../gnu-efi/inc/efipciio.h:397

end efipciio_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
