pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with efibind_h;
with efidef_h;
limited with efipxebc_h;
with System;

package efinet_h is

   --  unsupported macro: EFI_SIMPLE_NETWORK_PROTOCOL_GUID { 0xA19832B9, 0xAC25, 0x11D3, {0x9A, 0x2D, 0x00, 0x90, 0x27, 0x3F, 0xC1, 0x4D} }
   EFI_SIMPLE_NETWORK_RECEIVE_UNICAST : constant := 16#01#;  --  ../../gnu-efi/inc/efinet.h:125
   EFI_SIMPLE_NETWORK_RECEIVE_MULTICAST : constant := 16#02#;  --  ../../gnu-efi/inc/efinet.h:126
   EFI_SIMPLE_NETWORK_RECEIVE_BROADCAST : constant := 16#04#;  --  ../../gnu-efi/inc/efinet.h:127
   EFI_SIMPLE_NETWORK_RECEIVE_PROMISCUOUS : constant := 16#08#;  --  ../../gnu-efi/inc/efinet.h:128
   EFI_SIMPLE_NETWORK_RECEIVE_PROMISCUOUS_MULTICAST : constant := 16#10#;  --  ../../gnu-efi/inc/efinet.h:129

   EFI_SIMPLE_NETWORK_RECEIVE_INTERRUPT : constant := 16#01#;  --  ../../gnu-efi/inc/efinet.h:134
   EFI_SIMPLE_NETWORK_TRANSMIT_INTERRUPT : constant := 16#02#;  --  ../../gnu-efi/inc/efinet.h:135
   EFI_SIMPLE_NETWORK_COMMAND_INTERRUPT : constant := 16#04#;  --  ../../gnu-efi/inc/efinet.h:136
   EFI_SIMPLE_NETWORK_SOFTWARE_INTERRUPT : constant := 16#08#;  --  ../../gnu-efi/inc/efinet.h:137

   MAX_MCAST_FILTER_CNT : constant := 16;  --  ../../gnu-efi/inc/efinet.h:141

   EFI_SIMPLE_NETWORK_PROTOCOL_REVISION : constant := 16#00010000#;  --  ../../gnu-efi/inc/efinet.h:318
   --  unsupported macro: EFI_SIMPLE_NETWORK_INTERFACE_REVISION EFI_SIMPLE_NETWORK_PROTOCOL_REVISION

  --++
  --Copyright (c) 1999  Intel Corporation
  --Module Name:
  --    efinet.h
  --Abstract:
  --    EFI Simple Network protocol
  --Revision History
  ---- 

  --/////////////////////////////////////////////////////////////////////////////
  --      Simple Network Protocol
  --/////////////////////////////////////////////////////////////////////////////
  -- Total number of frames received.  Includes frames with errors and
  -- dropped frames.
  -- Number of valid frames received and copied into receive buffers.
  -- Number of frames below the minimum length for the media.
  -- This would be <64 for ethernet.
  -- Number of frames longer than the maxminum length for the
  -- media.  This would be >1500 for ethernet.
  -- Valid frames that were dropped because receive buffers were full.
  -- Number of valid unicast frames received and not dropped.
  -- Number of valid broadcast frames received and not dropped.
  -- Number of valid mutlicast frames received and not dropped.
  -- Number of frames w/ CRC or alignment errors.
  -- Total number of bytes received.  Includes frames with errors
  -- and dropped frames.
  -- Transmit statistics.
  -- Number of collisions detection on this subnet.
  -- Number of frames destined for unsupported protocol.
   type EFI_NETWORK_STATISTICS is record
      RxTotalFrames : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:36
      RxGoodFrames : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:41
      RxUndersizeFrames : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:47
      RxOversizeFrames : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:53
      RxDroppedFrames : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:58
      RxUnicastFrames : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:63
      RxBroadcastFrames : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:68
      RxMulticastFrames : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:73
      RxCrcErrorFrames : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:78
      RxTotalBytes : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:84
      TxTotalFrames : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:89
      TxGoodFrames : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:90
      TxUndersizeFrames : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:91
      TxOversizeFrames : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:92
      TxDroppedFrames : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:93
      TxUnicastFrames : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:94
      TxBroadcastFrames : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:95
      TxMulticastFrames : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:96
      TxCrcErrorFrames : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:97
      TxTotalBytes : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:98
      Collisions : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:103
      UnsupportedProtocol : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:108
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efinet.h:110

  --/////////////////////////////////////////////////////////////////////////////
   type EFI_SIMPLE_NETWORK_STATE is 
     (EfiSimpleNetworkStopped,
      EfiSimpleNetworkStarted,
      EfiSimpleNetworkInitialized,
      EfiSimpleNetworkMaxState)
   with Convention => C;  -- ../../gnu-efi/inc/efinet.h:120

  --/////////////////////////////////////////////////////////////////////////////
  --/////////////////////////////////////////////////////////////////////////////
  --/////////////////////////////////////////////////////////////////////////////
   type anon_array2173 is array (0 .. 15) of aliased efidef_h.EFI_MAC_ADDRESS;
   type EFI_SIMPLE_NETWORK_MODE is record
      State : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efinet.h:143
      HwAddressSize : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efinet.h:144
      MediaHeaderSize : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efinet.h:145
      MaxPacketSize : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efinet.h:146
      NvRamSize : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efinet.h:147
      NvRamAccessSize : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efinet.h:148
      ReceiveFilterMask : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efinet.h:149
      ReceiveFilterSetting : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efinet.h:150
      MaxMCastFilterCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efinet.h:151
      MCastFilterCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efinet.h:152
      MCastFilter : aliased anon_array2173;  -- ../../gnu-efi/inc/efinet.h:153
      CurrentAddress : aliased efidef_h.EFI_MAC_ADDRESS;  -- ../../gnu-efi/inc/efinet.h:154
      BroadcastAddress : aliased efidef_h.EFI_MAC_ADDRESS;  -- ../../gnu-efi/inc/efinet.h:155
      PermanentAddress : aliased efidef_h.EFI_MAC_ADDRESS;  -- ../../gnu-efi/inc/efinet.h:156
      IfType : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efinet.h:157
      MacAddressChangeable : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efinet.h:158
      MultipleTxSupported : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efinet.h:159
      MediaPresentSupported : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efinet.h:160
      MediaPresent : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efinet.h:161
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efinet.h:162

  --/////////////////////////////////////////////////////////////////////////////
   type u_EFI_SIMPLE_NETWORK_PROTOCOL;
   type EFI_SIMPLE_NETWORK_START is access function (arg1 : access u_EFI_SIMPLE_NETWORK_PROTOCOL) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efinet.h:169

  --/////////////////////////////////////////////////////////////////////////////
   type EFI_SIMPLE_NETWORK_STOP is access function (arg1 : access u_EFI_SIMPLE_NETWORK_PROTOCOL) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efinet.h:178

  --/////////////////////////////////////////////////////////////////////////////
   type EFI_SIMPLE_NETWORK_INITIALIZE is access function
        (arg1 : access u_EFI_SIMPLE_NETWORK_PROTOCOL;
         arg2 : efibind_h.UINTN;
         arg3 : efibind_h.UINTN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efinet.h:187

  --/////////////////////////////////////////////////////////////////////////////
   type EFI_SIMPLE_NETWORK_RESET is access function (arg1 : access u_EFI_SIMPLE_NETWORK_PROTOCOL; arg2 : efidef_h.BOOLEAN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efinet.h:198

  --/////////////////////////////////////////////////////////////////////////////
   type EFI_SIMPLE_NETWORK_SHUTDOWN is access function (arg1 : access u_EFI_SIMPLE_NETWORK_PROTOCOL) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efinet.h:208

  --/////////////////////////////////////////////////////////////////////////////
   type EFI_SIMPLE_NETWORK_RECEIVE_FILTERS is access function
        (arg1 : access u_EFI_SIMPLE_NETWORK_PROTOCOL;
         arg2 : efibind_h.UINT32;
         arg3 : efibind_h.UINT32;
         arg4 : efidef_h.BOOLEAN;
         arg5 : efibind_h.UINTN;
         arg6 : access efidef_h.EFI_MAC_ADDRESS) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efinet.h:217

  --/////////////////////////////////////////////////////////////////////////////
   type EFI_SIMPLE_NETWORK_STATION_ADDRESS is access function
        (arg1 : access u_EFI_SIMPLE_NETWORK_PROTOCOL;
         arg2 : efidef_h.BOOLEAN;
         arg3 : access efidef_h.EFI_MAC_ADDRESS) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efinet.h:231

  --/////////////////////////////////////////////////////////////////////////////
   type EFI_SIMPLE_NETWORK_STATISTICS is access function
        (arg1 : access u_EFI_SIMPLE_NETWORK_PROTOCOL;
         arg2 : efidef_h.BOOLEAN;
         arg3 : access efibind_h.UINTN;
         arg4 : access EFI_NETWORK_STATISTICS) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efinet.h:242

  --/////////////////////////////////////////////////////////////////////////////
   type EFI_SIMPLE_NETWORK_MCAST_IP_TO_MAC is access function
        (arg1 : access u_EFI_SIMPLE_NETWORK_PROTOCOL;
         arg2 : efidef_h.BOOLEAN;
         arg3 : access efipxebc_h.EFI_IP_ADDRESS;
         arg4 : access efidef_h.EFI_MAC_ADDRESS) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efinet.h:254

  --/////////////////////////////////////////////////////////////////////////////
   type EFI_SIMPLE_NETWORK_NVDATA is access function
        (arg1 : access u_EFI_SIMPLE_NETWORK_PROTOCOL;
         arg2 : efidef_h.BOOLEAN;
         arg3 : efibind_h.UINTN;
         arg4 : efibind_h.UINTN;
         arg5 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efinet.h:266

  --/////////////////////////////////////////////////////////////////////////////
   type EFI_SIMPLE_NETWORK_GET_STATUS is access function
        (arg1 : access u_EFI_SIMPLE_NETWORK_PROTOCOL;
         arg2 : access efibind_h.UINT32;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efinet.h:279

  --/////////////////////////////////////////////////////////////////////////////
   type EFI_SIMPLE_NETWORK_TRANSMIT is access function
        (arg1 : access u_EFI_SIMPLE_NETWORK_PROTOCOL;
         arg2 : efibind_h.UINTN;
         arg3 : efibind_h.UINTN;
         arg4 : System.Address;
         arg5 : access efidef_h.EFI_MAC_ADDRESS;
         arg6 : access efidef_h.EFI_MAC_ADDRESS;
         arg7 : access efibind_h.UINT16) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efinet.h:290

  --/////////////////////////////////////////////////////////////////////////////
   type EFI_SIMPLE_NETWORK_RECEIVE is access function
        (arg1 : access u_EFI_SIMPLE_NETWORK_PROTOCOL;
         arg2 : access efibind_h.UINTN;
         arg3 : access efibind_h.UINTN;
         arg4 : System.Address;
         arg5 : access efidef_h.EFI_MAC_ADDRESS;
         arg6 : access efidef_h.EFI_MAC_ADDRESS;
         arg7 : access efibind_h.UINT16) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efinet.h:305

  --/////////////////////////////////////////////////////////////////////////////
   type u_EFI_SIMPLE_NETWORK_PROTOCOL is record
      Revision : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efinet.h:322
      Start : EFI_SIMPLE_NETWORK_START;  -- ../../gnu-efi/inc/efinet.h:323
      Stop : EFI_SIMPLE_NETWORK_STOP;  -- ../../gnu-efi/inc/efinet.h:324
      Initialize : EFI_SIMPLE_NETWORK_INITIALIZE;  -- ../../gnu-efi/inc/efinet.h:325
      Reset : EFI_SIMPLE_NETWORK_RESET;  -- ../../gnu-efi/inc/efinet.h:326
      Shutdown : EFI_SIMPLE_NETWORK_SHUTDOWN;  -- ../../gnu-efi/inc/efinet.h:327
      ReceiveFilters : EFI_SIMPLE_NETWORK_RECEIVE_FILTERS;  -- ../../gnu-efi/inc/efinet.h:328
      StationAddress : EFI_SIMPLE_NETWORK_STATION_ADDRESS;  -- ../../gnu-efi/inc/efinet.h:329
      Statistics : EFI_SIMPLE_NETWORK_STATISTICS;  -- ../../gnu-efi/inc/efinet.h:330
      MCastIpToMac : EFI_SIMPLE_NETWORK_MCAST_IP_TO_MAC;  -- ../../gnu-efi/inc/efinet.h:331
      NvData : EFI_SIMPLE_NETWORK_NVDATA;  -- ../../gnu-efi/inc/efinet.h:332
      GetStatus : EFI_SIMPLE_NETWORK_GET_STATUS;  -- ../../gnu-efi/inc/efinet.h:333
      Transmit : EFI_SIMPLE_NETWORK_TRANSMIT;  -- ../../gnu-efi/inc/efinet.h:334
      Receive : EFI_SIMPLE_NETWORK_RECEIVE;  -- ../../gnu-efi/inc/efinet.h:335
      WaitForPacket : efidef_h.EFI_EVENT;  -- ../../gnu-efi/inc/efinet.h:336
      Mode : access EFI_SIMPLE_NETWORK_MODE;  -- ../../gnu-efi/inc/efinet.h:337
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efinet.h:321

   subtype EFI_SIMPLE_NETWORK_PROTOCOL is u_EFI_SIMPLE_NETWORK_PROTOCOL;  -- ../../gnu-efi/inc/efinet.h:338

  -- Note: Because it conflicted with the EDK2 struct name, the
  -- 'EFI_SIMPLE_NETWORK_PROTOCOL' GUID definition, from older
  -- versions of gnu-efi, is now obsoleted.
  -- Use 'EFI_SIMPLE_NETWORK_PROTOCOL_GUID' instead.
   subtype u_EFI_SIMPLE_NETWORK is u_EFI_SIMPLE_NETWORK_PROTOCOL;  -- ../../gnu-efi/inc/efinet.h:345

   subtype EFI_SIMPLE_NETWORK is EFI_SIMPLE_NETWORK_PROTOCOL;  -- ../../gnu-efi/inc/efinet.h:346

end efinet_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
