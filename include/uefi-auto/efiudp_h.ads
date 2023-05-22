pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with efidef_h;
with efibind_h;
limited with efiip_h;
limited with efinet_h;
with System;

package efiudp_h is

   --  unsupported macro: EFI_UDP4_SERVICE_BINDING_PROTOCOL { 0x83f01464, 0x99bd, 0x45e5, {0xb3, 0x83, 0xaf, 0x63, 0x05, 0xd8, 0xe9, 0xe6} }
   --  unsupported macro: EFI_UDP4_PROTOCOL { 0x3ad9df29, 0x4501, 0x478d, {0xb1, 0xf8, 0x7f, 0x7f, 0xe7, 0x0e, 0x50, 0xf3} }
   --  unsupported macro: EFI_UDP6_SERVICE_BINDING_PROTOCOL { 0x66ed4721, 0x3c98, 0x4d3e, {0x81, 0xe3, 0xd0, 0x3d, 0xd3, 0x9a, 0x72, 0x54} }
   --  unsupported macro: EFI_UDP6_PROTOCOL { 0x4f948815, 0xb4b9, 0x43cb, {0x8a, 0x33, 0x90, 0xe0, 0x60, 0xb3,0x49, 0x55} }
   --  unsupported macro: EFI_NETWORK_UNREACHABLE EFIERR(100)
   --  unsupported macro: EFI_HOST_UNREACHABLE EFIERR(101)
   --  unsupported macro: EFI_PROTOCOL_UNREACHABLE EFIERR(102)
   --  unsupported macro: EFI_PORT_UNREACHABLE EFIERR(103)
  --++
  --Copyright (c) 2013  Intel Corporation
  ---- 

   type EFI_UDP4_CONFIG_DATA is record
      AcceptBroadcast : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiudp.h:26
      AcceptPromiscuous : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiudp.h:27
      AcceptAnyPort : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiudp.h:28
      AllowDuplicatePort : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiudp.h:29
      TypeOfService : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiudp.h:30
      TimeToLive : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiudp.h:31
      DoNotFragment : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiudp.h:32
      ReceiveTimeout : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiudp.h:33
      TransmitTimeout : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiudp.h:34
      UseDefaultAddress : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiudp.h:35
      StationAddress : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efiudp.h:36
      SubnetMask : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efiudp.h:37
      StationPort : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efiudp.h:38
      RemoteAddress : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efiudp.h:39
      RemotePort : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efiudp.h:40
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiudp.h:41

   type u_EFI_UDP4;
   type EFI_UDP4_GET_MODE_DATA is access function
        (arg1 : access u_EFI_UDP4;
         arg2 : access EFI_UDP4_CONFIG_DATA;
         arg3 : access efiip_h.EFI_IP4_MODE_DATA;
         arg4 : access efidef_h.EFI_MANAGED_NETWORK_CONFIG_DATA;
         arg5 : access efinet_h.EFI_SIMPLE_NETWORK_MODE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiudp.h:45

   type EFI_UDP4_CONFIGURE is access function (arg1 : access u_EFI_UDP4; arg2 : access EFI_UDP4_CONFIG_DATA) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiudp.h:55

   type EFI_UDP4_GROUPS is access function
        (arg1 : access u_EFI_UDP4;
         arg2 : efidef_h.BOOLEAN;
         arg3 : access efidef_h.EFI_IPv4_ADDRESS) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiudp.h:62

   type EFI_UDP4_ROUTES is access function
        (arg1 : access u_EFI_UDP4;
         arg2 : efidef_h.BOOLEAN;
         arg3 : access efidef_h.EFI_IPv4_ADDRESS;
         arg4 : access efidef_h.EFI_IPv4_ADDRESS;
         arg5 : access efidef_h.EFI_IPv4_ADDRESS) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiudp.h:70

   type EFI_UDP4_SESSION_DATA is record
      SourceAddress : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efiudp.h:84
      SourcePort : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efiudp.h:85
      DestinationAddress : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efiudp.h:86
      DestinationPort : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efiudp.h:87
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiudp.h:88

   type EFI_UDP4_FRAGMENT_DATA is record
      FragmentLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiudp.h:91
      FragmentBuffer : System.Address;  -- ../../gnu-efi/inc/efiudp.h:92
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiudp.h:93

   type anon_array2803 is array (0 .. 0) of aliased EFI_UDP4_FRAGMENT_DATA;
   type EFI_UDP4_RECEIVE_DATA is record
      TimeStamp : aliased efidef_h.EFI_TIME;  -- ../../gnu-efi/inc/efiudp.h:96
      RecycleSignal : efidef_h.EFI_EVENT;  -- ../../gnu-efi/inc/efiudp.h:97
      UdpSession : aliased EFI_UDP4_SESSION_DATA;  -- ../../gnu-efi/inc/efiudp.h:98
      DataLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiudp.h:99
      FragmentCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiudp.h:100
      FragmentTable : aliased anon_array2803;  -- ../../gnu-efi/inc/efiudp.h:101
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiudp.h:102

   type EFI_UDP4_TRANSMIT_DATA is record
      UdpSessionData : access EFI_UDP4_SESSION_DATA;  -- ../../gnu-efi/inc/efiudp.h:105
      GatewayAddress : access efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efiudp.h:106
      DataLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiudp.h:107
      FragmentCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiudp.h:108
      FragmentTable : aliased anon_array2803;  -- ../../gnu-efi/inc/efiudp.h:109
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiudp.h:110

   type anon_union2811 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            RxData : access EFI_UDP4_RECEIVE_DATA;  -- ../../gnu-efi/inc/efiudp.h:116
         when others =>
            TxData : access EFI_UDP4_TRANSMIT_DATA;  -- ../../gnu-efi/inc/efiudp.h:117
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type EFI_UDP4_COMPLETION_TOKEN is record
      Event : efidef_h.EFI_EVENT;  -- ../../gnu-efi/inc/efiudp.h:113
      Status : aliased efidef_h.EFI_STATUS;  -- ../../gnu-efi/inc/efiudp.h:114
      Packet : aliased anon_union2811;  -- ../../gnu-efi/inc/efiudp.h:118
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiudp.h:119

   type EFI_UDP4_TRANSMIT is access function (arg1 : access u_EFI_UDP4; arg2 : access EFI_UDP4_COMPLETION_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiudp.h:123

   type EFI_UDP4_RECEIVE is access function (arg1 : access u_EFI_UDP4; arg2 : access EFI_UDP4_COMPLETION_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiudp.h:130

   type EFI_UDP4_CANCEL is access function (arg1 : access u_EFI_UDP4; arg2 : access EFI_UDP4_COMPLETION_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiudp.h:137

   type EFI_UDP4_POLL is access function (arg1 : access u_EFI_UDP4) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiudp.h:144

   type u_EFI_UDP4 is record
      GetModeData : EFI_UDP4_GET_MODE_DATA;  -- ../../gnu-efi/inc/efiudp.h:149
      Configure : EFI_UDP4_CONFIGURE;  -- ../../gnu-efi/inc/efiudp.h:150
      Groups : EFI_UDP4_GROUPS;  -- ../../gnu-efi/inc/efiudp.h:151
      Routes : EFI_UDP4_ROUTES;  -- ../../gnu-efi/inc/efiudp.h:152
      Transmit : EFI_UDP4_TRANSMIT;  -- ../../gnu-efi/inc/efiudp.h:153
      Receive : EFI_UDP4_RECEIVE;  -- ../../gnu-efi/inc/efiudp.h:154
      Cancel : EFI_UDP4_CANCEL;  -- ../../gnu-efi/inc/efiudp.h:155
      Poll : EFI_UDP4_POLL;  -- ../../gnu-efi/inc/efiudp.h:156
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiudp.h:148

   subtype EFI_UDP4 is u_EFI_UDP4;  -- ../../gnu-efi/inc/efiudp.h:157

   type EFI_UDP6_CONFIG_DATA is record
      AcceptPromiscuous : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiudp.h:160
      AcceptAnyPort : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiudp.h:161
      AllowDuplicatePort : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiudp.h:162
      TrafficClass : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiudp.h:163
      HopLimit : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiudp.h:164
      ReceiveTimeout : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiudp.h:165
      TransmitTimeout : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiudp.h:166
      StationAddress : aliased efidef_h.EFI_IPv6_ADDRESS;  -- ../../gnu-efi/inc/efiudp.h:167
      StationPort : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efiudp.h:168
      RemoteAddress : aliased efidef_h.EFI_IPv6_ADDRESS;  -- ../../gnu-efi/inc/efiudp.h:169
      RemotePort : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efiudp.h:170
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiudp.h:171

   type u_EFI_UDP6;
   type EFI_UDP6_GET_MODE_DATA is access function
        (arg1 : access u_EFI_UDP6;
         arg2 : access EFI_UDP6_CONFIG_DATA;
         arg3 : access efiip_h.EFI_IP6_MODE_DATA;
         arg4 : access efidef_h.EFI_MANAGED_NETWORK_CONFIG_DATA;
         arg5 : access efinet_h.EFI_SIMPLE_NETWORK_MODE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiudp.h:175

   type EFI_UDP6_CONFIGURE is access function (arg1 : access u_EFI_UDP6; arg2 : access EFI_UDP6_CONFIG_DATA) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiudp.h:185

   type EFI_UDP6_GROUPS is access function
        (arg1 : access u_EFI_UDP6;
         arg2 : efidef_h.BOOLEAN;
         arg3 : access efidef_h.EFI_IPv6_ADDRESS) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiudp.h:192

   type EFI_UDP6_SESSION_DATA is record
      SourceAddress : aliased efidef_h.EFI_IPv6_ADDRESS;  -- ../../gnu-efi/inc/efiudp.h:199
      SourcePort : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efiudp.h:200
      DestinationAddress : aliased efidef_h.EFI_IPv6_ADDRESS;  -- ../../gnu-efi/inc/efiudp.h:201
      DestinationPort : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efiudp.h:202
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiudp.h:203

   type EFI_UDP6_FRAGMENT_DATA is record
      FragmentLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiudp.h:206
      FragmentBuffer : System.Address;  -- ../../gnu-efi/inc/efiudp.h:207
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiudp.h:208

   type anon_array2857 is array (0 .. 0) of aliased EFI_UDP6_FRAGMENT_DATA;
   type EFI_UDP6_RECEIVE_DATA is record
      TimeStamp : aliased efidef_h.EFI_TIME;  -- ../../gnu-efi/inc/efiudp.h:211
      RecycleSignal : efidef_h.EFI_EVENT;  -- ../../gnu-efi/inc/efiudp.h:212
      UdpSession : aliased EFI_UDP6_SESSION_DATA;  -- ../../gnu-efi/inc/efiudp.h:213
      DataLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiudp.h:214
      FragmentCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiudp.h:215
      FragmentTable : aliased anon_array2857;  -- ../../gnu-efi/inc/efiudp.h:216
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiudp.h:217

   type EFI_UDP6_TRANSMIT_DATA is record
      UdpSessionData : access EFI_UDP6_SESSION_DATA;  -- ../../gnu-efi/inc/efiudp.h:220
      DataLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiudp.h:221
      FragmentCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiudp.h:222
      FragmentTable : aliased anon_array2857;  -- ../../gnu-efi/inc/efiudp.h:223
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiudp.h:224

   type anon_union2865 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            RxData : access EFI_UDP6_RECEIVE_DATA;  -- ../../gnu-efi/inc/efiudp.h:230
         when others =>
            TxData : access EFI_UDP6_TRANSMIT_DATA;  -- ../../gnu-efi/inc/efiudp.h:231
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type EFI_UDP6_COMPLETION_TOKEN is record
      Event : efidef_h.EFI_EVENT;  -- ../../gnu-efi/inc/efiudp.h:227
      Status : aliased efidef_h.EFI_STATUS;  -- ../../gnu-efi/inc/efiudp.h:228
      Packet : aliased anon_union2865;  -- ../../gnu-efi/inc/efiudp.h:232
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiudp.h:233

   type EFI_UDP6_TRANSMIT is access function (arg1 : access u_EFI_UDP6; arg2 : access EFI_UDP6_COMPLETION_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiudp.h:237

   type EFI_UDP6_RECEIVE is access function (arg1 : access u_EFI_UDP6; arg2 : access EFI_UDP6_COMPLETION_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiudp.h:244

   type EFI_UDP6_CANCEL is access function (arg1 : access u_EFI_UDP6; arg2 : access EFI_UDP6_COMPLETION_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiudp.h:251

   type EFI_UDP6_POLL is access function (arg1 : access u_EFI_UDP6) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiudp.h:258

   type u_EFI_UDP6 is record
      GetModeData : EFI_UDP6_GET_MODE_DATA;  -- ../../gnu-efi/inc/efiudp.h:263
      Configure : EFI_UDP6_CONFIGURE;  -- ../../gnu-efi/inc/efiudp.h:264
      Groups : EFI_UDP6_GROUPS;  -- ../../gnu-efi/inc/efiudp.h:265
      Transmit : EFI_UDP6_TRANSMIT;  -- ../../gnu-efi/inc/efiudp.h:266
      Receive : EFI_UDP6_RECEIVE;  -- ../../gnu-efi/inc/efiudp.h:267
      Cancel : EFI_UDP6_CANCEL;  -- ../../gnu-efi/inc/efiudp.h:268
      Poll : EFI_UDP6_POLL;  -- ../../gnu-efi/inc/efiudp.h:269
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiudp.h:262

   subtype EFI_UDP6 is u_EFI_UDP6;  -- ../../gnu-efi/inc/efiudp.h:270

end efiudp_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
