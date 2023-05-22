pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with efidef_h;
with efibind_h;
with System;

package efiser_h is

   --  unsupported macro: EFI_SERIAL_IO_PROTOCOL_GUID { 0xBB25CF6F, 0xF1D4, 0x11D2, {0x9A, 0x0C, 0x00, 0x90, 0x27, 0x3F, 0xC1, 0xFD} }
   --  unsupported macro: SERIAL_IO_PROTOCOL EFI_SERIAL_IO_PROTOCOL_GUID
   EFI_SERIAL_CLEAR_TO_SEND : constant := 16#0010#;  --  ../../gnu-efi/inc/efiser.h:46
   EFI_SERIAL_DATA_SET_READY : constant := 16#0020#;  --  ../../gnu-efi/inc/efiser.h:47
   EFI_SERIAL_RING_INDICATE : constant := 16#0040#;  --  ../../gnu-efi/inc/efiser.h:48
   EFI_SERIAL_CARRIER_DETECT : constant := 16#0080#;  --  ../../gnu-efi/inc/efiser.h:49
   EFI_SERIAL_REQUEST_TO_SEND : constant := 16#0002#;  --  ../../gnu-efi/inc/efiser.h:50
   EFI_SERIAL_DATA_TERMINAL_READY : constant := 16#0001#;  --  ../../gnu-efi/inc/efiser.h:51
   EFI_SERIAL_INPUT_BUFFER_EMPTY : constant := 16#0100#;  --  ../../gnu-efi/inc/efiser.h:52
   EFI_SERIAL_OUTPUT_BUFFER_EMPTY : constant := 16#0200#;  --  ../../gnu-efi/inc/efiser.h:53
   EFI_SERIAL_HARDWARE_LOOPBACK_ENABLE : constant := 16#1000#;  --  ../../gnu-efi/inc/efiser.h:54
   EFI_SERIAL_SOFTWARE_LOOPBACK_ENABLE : constant := 16#2000#;  --  ../../gnu-efi/inc/efiser.h:55
   EFI_SERIAL_HARDWARE_FLOW_CONTROL_ENABLE : constant := 16#4000#;  --  ../../gnu-efi/inc/efiser.h:56

   SERIAL_IO_INTERFACE_REVISION : constant := 16#00010000#;  --  ../../gnu-efi/inc/efiser.h:118

  --++
  --Copyright (c) 1998  Intel Corporation
  --Module Name:
  --    efiser.h
  --Abstract:
  --    EFI serial protocol
  --Revision History
  ---- 

  -- Serial protocol
   type EFI_PARITY_TYPE is 
     (DefaultParity,
      NoParity,
      EvenParity,
      OddParity,
      MarkParity,
      SpaceParity)
   with Convention => C;  -- ../../gnu-efi/inc/efiser.h:37

  -- 1 stop bit
  -- 1.5 stop bits
  -- 2 stop bits
   type EFI_STOP_BITS_TYPE is 
     (DefaultStopBits,
      OneStopBit,
      OneFiveStopBits,
      TwoStopBits)
   with Convention => C;  -- ../../gnu-efi/inc/efiser.h:44

   type u_EFI_SERIAL_IO_PROTOCOL;
   type EFI_SERIAL_RESET is access function (arg1 : access u_EFI_SERIAL_IO_PROTOCOL) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiser.h:60

   type EFI_SERIAL_SET_ATTRIBUTES is access function
        (arg1 : access u_EFI_SERIAL_IO_PROTOCOL;
         arg2 : efibind_h.UINT64;
         arg3 : efibind_h.UINT32;
         arg4 : efibind_h.UINT32;
         arg5 : EFI_PARITY_TYPE;
         arg6 : efibind_h.UINT8;
         arg7 : EFI_STOP_BITS_TYPE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiser.h:66

   type EFI_SERIAL_SET_CONTROL_BITS is access function (arg1 : access u_EFI_SERIAL_IO_PROTOCOL; arg2 : efibind_h.UINT32) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiser.h:78

   type EFI_SERIAL_GET_CONTROL_BITS is access function (arg1 : access u_EFI_SERIAL_IO_PROTOCOL; arg2 : access efibind_h.UINT32) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiser.h:85

   type EFI_SERIAL_WRITE is access function
        (arg1 : access u_EFI_SERIAL_IO_PROTOCOL;
         arg2 : access efibind_h.UINTN;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiser.h:92

   type EFI_SERIAL_READ is access function
        (arg1 : access u_EFI_SERIAL_IO_PROTOCOL;
         arg2 : access efibind_h.UINTN;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiser.h:100

  -- current Attributes
   type SERIAL_IO_MODE is record
      ControlMask : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiser.h:107
      Timeout : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiser.h:110
      BaudRate : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efiser.h:111
      ReceiveFifoDepth : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiser.h:112
      DataBits : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiser.h:113
      Parity : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiser.h:114
      StopBits : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiser.h:115
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiser.h:116

   type u_EFI_SERIAL_IO_PROTOCOL is record
      Revision : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiser.h:121
      Reset : EFI_SERIAL_RESET;  -- ../../gnu-efi/inc/efiser.h:122
      SetAttributes : EFI_SERIAL_SET_ATTRIBUTES;  -- ../../gnu-efi/inc/efiser.h:123
      SetControl : EFI_SERIAL_SET_CONTROL_BITS;  -- ../../gnu-efi/inc/efiser.h:124
      GetControl : EFI_SERIAL_GET_CONTROL_BITS;  -- ../../gnu-efi/inc/efiser.h:125
      Write : EFI_SERIAL_WRITE;  -- ../../gnu-efi/inc/efiser.h:126
      Read : EFI_SERIAL_READ;  -- ../../gnu-efi/inc/efiser.h:127
      Mode : access SERIAL_IO_MODE;  -- ../../gnu-efi/inc/efiser.h:129
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiser.h:120

   subtype EFI_SERIAL_IO_PROTOCOL is u_EFI_SERIAL_IO_PROTOCOL;  -- ../../gnu-efi/inc/efiser.h:130

   subtype u_SERIAL_IO_INTERFACE is u_EFI_SERIAL_IO_PROTOCOL;  -- ../../gnu-efi/inc/efiser.h:132

   subtype SERIAL_IO_INTERFACE is EFI_SERIAL_IO_PROTOCOL;  -- ../../gnu-efi/inc/efiser.h:133

end efiser_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
