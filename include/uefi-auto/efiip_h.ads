pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with efidef_h;
with efibind_h;
limited with efinet_h;
with Interfaces.C.Extensions;
with System;

package efiip_h is

   --  unsupported macro: EFI_IP4_SERVICE_BINDING_PROTOCOL {0xc51711e7,0xb4bf,0x404a,{0xbf,0xb8,0x0a,0x04, 0x8e,0xf1,0xff,0xe4}}
   --  unsupported macro: EFI_IP4_PROTOCOL {0x41d94cd2,0x35b6,0x455a,{0x82,0x58,0xd4,0xe5,0x13,0x34,0xaa,0xdd}}
   --  unsupported macro: EFI_IP6_SERVICE_BINDING_PROTOCOL {0xec835dd3,0xfe0f,0x617b,{0xa6,0x21,0xb3,0x50,0xc3,0xe1,0x33,0x88}}
   --  unsupported macro: EFI_IP6_PROTOCOL {0x2c8759d5,0x5c2d,0x66ef,{0x92,0x5f,0xb6,0x6c,0x10,0x19,0x57,0xe2}}
   ICMP_V6_DEST_UNREACHABLE : constant := 16#1#;  --  ../../gnu-efi/inc/efiip.h:257
   ICMP_V6_PACKET_TOO_BIG : constant := 16#2#;  --  ../../gnu-efi/inc/efiip.h:258
   ICMP_V6_TIME_EXCEEDED : constant := 16#3#;  --  ../../gnu-efi/inc/efiip.h:259
   ICMP_V6_PARAMETER_PROBLEM : constant := 16#4#;  --  ../../gnu-efi/inc/efiip.h:260

   ICMP_V6_ECHO_REQUEST : constant := 16#80#;  --  ../../gnu-efi/inc/efiip.h:265
   ICMP_V6_ECHO_REPLY : constant := 16#81#;  --  ../../gnu-efi/inc/efiip.h:266
   ICMP_V6_LISTENER_QUERY : constant := 16#82#;  --  ../../gnu-efi/inc/efiip.h:267
   ICMP_V6_LISTENER_REPORT : constant := 16#83#;  --  ../../gnu-efi/inc/efiip.h:268
   ICMP_V6_LISTENER_DONE : constant := 16#84#;  --  ../../gnu-efi/inc/efiip.h:269
   ICMP_V6_ROUTER_SOLICIT : constant := 16#85#;  --  ../../gnu-efi/inc/efiip.h:270
   ICMP_V6_ROUTER_ADVERTISE : constant := 16#86#;  --  ../../gnu-efi/inc/efiip.h:271
   ICMP_V6_NEIGHBOR_SOLICIT : constant := 16#87#;  --  ../../gnu-efi/inc/efiip.h:272
   ICMP_V6_NEIGHBOR_ADVERTISE : constant := 16#88#;  --  ../../gnu-efi/inc/efiip.h:273
   ICMP_V6_REDIRECT : constant := 16#89#;  --  ../../gnu-efi/inc/efiip.h:274
   ICMP_V6_LISTENER_REPORT_2 : constant := 16#8F#;  --  ../../gnu-efi/inc/efiip.h:275

   ICMP_V6_NO_ROUTE_TO_DEST : constant := 16#0#;  --  ../../gnu-efi/inc/efiip.h:280
   ICMP_V6_COMM_PROHIBITED : constant := 16#1#;  --  ../../gnu-efi/inc/efiip.h:281
   ICMP_V6_BEYOND_SCOPE : constant := 16#2#;  --  ../../gnu-efi/inc/efiip.h:282
   ICMP_V6_ADDR_UNREACHABLE : constant := 16#3#;  --  ../../gnu-efi/inc/efiip.h:283
   ICMP_V6_PORT_UNREACHABLE : constant := 16#4#;  --  ../../gnu-efi/inc/efiip.h:284
   ICMP_V6_SOURCE_ADDR_FAILED : constant := 16#5#;  --  ../../gnu-efi/inc/efiip.h:285
   ICMP_V6_ROUTE_REJECTED : constant := 16#6#;  --  ../../gnu-efi/inc/efiip.h:286

   ICMP_V6_TIMEOUT_HOP_LIMIT : constant := 16#0#;  --  ../../gnu-efi/inc/efiip.h:291
   ICMP_V6_TIMEOUT_REASSEMBLE : constant := 16#1#;  --  ../../gnu-efi/inc/efiip.h:292

   ICMP_V6_ERRONEOUS_HEADER : constant := 16#0#;  --  ../../gnu-efi/inc/efiip.h:297
   ICMP_V6_UNRECOGNIZE_NEXT_HDR : constant := 16#1#;  --  ../../gnu-efi/inc/efiip.h:298
   ICMP_V6_UNRECOGNIZE_OPTION : constant := 16#2#;  --  ../../gnu-efi/inc/efiip.h:299

  --++
  --Copyright (c) 2013  Intel Corporation
  ---- 

   type EFI_IP4_ADDRESS_PAIR is record
      InstanceHandle : efidef_h.EFI_HANDLE;  -- ../../gnu-efi/inc/efiip.h:25
      Ip4Address : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:26
      SubnetMask : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:27
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:28

   type anon_array2596 is array (0 .. 0) of aliased EFI_IP4_ADDRESS_PAIR;
   type EFI_IP4_VARIABLE_DATA is record
      DriverHandle : efidef_h.EFI_HANDLE;  -- ../../gnu-efi/inc/efiip.h:31
      AddressCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:32
      AddressPairs : aliased anon_array2596;  -- ../../gnu-efi/inc/efiip.h:33
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:34

   type EFI_IP4_CONFIG_DATA is record
      DefaultProtocol : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:37
      AcceptAnyProtocol : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiip.h:38
      AcceptIcmpErrors : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiip.h:39
      AcceptBroadcast : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiip.h:40
      AcceptPromiscuous : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiip.h:41
      UseDefaultAddress : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiip.h:42
      StationAddress : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:43
      SubnetMask : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:44
      TypeOfService : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:45
      TimeToLive : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:46
      DoNotFragment : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiip.h:47
      RawData : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiip.h:48
      ReceiveTimeout : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:49
      TransmitTimeout : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:50
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:51

   type EFI_IP4_ROUTE_TABLE is record
      SubnetAddress : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:54
      SubnetMask : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:55
      GatewayAddress : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:56
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:57

   type EFI_IP4_ICMP_TYPE is record
      c_Type : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:60
      Code : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:61
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:62

   type EFI_IP4_MODE_DATA is record
      IsStarted : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiip.h:65
      MaxPacketSize : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:66
      ConfigData : aliased EFI_IP4_CONFIG_DATA;  -- ../../gnu-efi/inc/efiip.h:67
      IsConfigured : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiip.h:68
      GroupCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:69
      GroupTable : access efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:70
      RouteCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:71
      RouteTable : access EFI_IP4_ROUTE_TABLE;  -- ../../gnu-efi/inc/efiip.h:72
      IcmpTypeCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:73
      IcmpTypeList : access EFI_IP4_ICMP_TYPE;  -- ../../gnu-efi/inc/efiip.h:74
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:75

   type u_EFI_IP4;
   type EFI_IP4_GET_MODE_DATA is access function
        (arg1 : access u_EFI_IP4;
         arg2 : access EFI_IP4_MODE_DATA;
         arg3 : access efidef_h.EFI_MANAGED_NETWORK_CONFIG_DATA;
         arg4 : access efinet_h.EFI_SIMPLE_NETWORK_MODE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiip.h:79

   type EFI_IP4_CONFIGURE is access function (arg1 : access u_EFI_IP4; arg2 : access EFI_IP4_CONFIG_DATA) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiip.h:88

   type EFI_IP4_GROUPS is access function
        (arg1 : access u_EFI_IP4;
         arg2 : efidef_h.BOOLEAN;
         arg3 : access efidef_h.EFI_IPv4_ADDRESS) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiip.h:95

   type EFI_IP4_ROUTES is access function
        (arg1 : access u_EFI_IP4;
         arg2 : efidef_h.BOOLEAN;
         arg3 : access efidef_h.EFI_IPv4_ADDRESS;
         arg4 : access efidef_h.EFI_IPv4_ADDRESS;
         arg5 : access efidef_h.EFI_IPv4_ADDRESS) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiip.h:103

   type EFI_IP4_HEADER is record
      HeaderLength : Extensions.Unsigned_4;  -- ../../gnu-efi/inc/efiip.h:113
      Version : Extensions.Unsigned_4;  -- ../../gnu-efi/inc/efiip.h:114
      TypeOfService : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:115
      TotalLength : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efiip.h:116
      Identification : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efiip.h:117
      Fragmentation : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efiip.h:118
      TimeToLive : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:119
      Protocol : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:120
      Checksum : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efiip.h:121
      SourceAddress : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:122
      DestinationAddress : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:123
   end record
   with Convention => C_Pass_By_Copy,
        Pack => True,
        Alignment => 1;  -- ../../gnu-efi/inc/efiip.h:124

   type EFI_IP4_FRAGMENT_DATA is record
      FragmentLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:128
      FragmentBuffer : System.Address;  -- ../../gnu-efi/inc/efiip.h:129
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:130

   type anon_array2648 is array (0 .. 0) of aliased EFI_IP4_FRAGMENT_DATA;
   type EFI_IP4_RECEIVE_DATA is record
      TimeStamp : aliased efidef_h.EFI_TIME;  -- ../../gnu-efi/inc/efiip.h:133
      RecycleSignal : efidef_h.EFI_EVENT;  -- ../../gnu-efi/inc/efiip.h:134
      HeaderLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:135
      Header : access EFI_IP4_HEADER;  -- ../../gnu-efi/inc/efiip.h:136
      OptionsLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:137
      Options : System.Address;  -- ../../gnu-efi/inc/efiip.h:138
      DataLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:139
      FragmentCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:140
      FragmentTable : aliased anon_array2648;  -- ../../gnu-efi/inc/efiip.h:141
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:142

   type EFI_IP4_OVERRIDE_DATA is record
      SourceAddress : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:145
      GatewayAddress : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:146
      Protocol : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:147
      TypeOfService : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:148
      TimeToLive : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:149
      DoNotFragment : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiip.h:150
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:151

   type EFI_IP4_TRANSMIT_DATA is record
      DestinationAddress : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:154
      OverrideData : access EFI_IP4_OVERRIDE_DATA;  -- ../../gnu-efi/inc/efiip.h:155
      OptionsLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:156
      OptionsBuffer : System.Address;  -- ../../gnu-efi/inc/efiip.h:157
      TotalDataLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:158
      FragmentCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:159
      FragmentTable : aliased anon_array2648;  -- ../../gnu-efi/inc/efiip.h:160
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:161

   type anon_union2658 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            RxData : access EFI_IP4_RECEIVE_DATA;  -- ../../gnu-efi/inc/efiip.h:167
         when others =>
            TxData : access EFI_IP4_TRANSMIT_DATA;  -- ../../gnu-efi/inc/efiip.h:168
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type EFI_IP4_COMPLETION_TOKEN is record
      Event : efidef_h.EFI_EVENT;  -- ../../gnu-efi/inc/efiip.h:164
      Status : aliased efidef_h.EFI_STATUS;  -- ../../gnu-efi/inc/efiip.h:165
      Packet : aliased anon_union2658;  -- ../../gnu-efi/inc/efiip.h:169
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:170

   type EFI_IP4_TRANSMIT is access function (arg1 : access u_EFI_IP4; arg2 : access EFI_IP4_COMPLETION_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiip.h:174

   type EFI_IP4_RECEIVE is access function (arg1 : access u_EFI_IP4; arg2 : access EFI_IP4_COMPLETION_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiip.h:181

   type EFI_IP4_CANCEL is access function (arg1 : access u_EFI_IP4; arg2 : access EFI_IP4_COMPLETION_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiip.h:188

   type EFI_IP4_POLL is access function (arg1 : access u_EFI_IP4) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiip.h:195

   type u_EFI_IP4 is record
      GetModeData : EFI_IP4_GET_MODE_DATA;  -- ../../gnu-efi/inc/efiip.h:200
      Configure : EFI_IP4_CONFIGURE;  -- ../../gnu-efi/inc/efiip.h:201
      Groups : EFI_IP4_GROUPS;  -- ../../gnu-efi/inc/efiip.h:202
      Routes : EFI_IP4_ROUTES;  -- ../../gnu-efi/inc/efiip.h:203
      Transmit : EFI_IP4_TRANSMIT;  -- ../../gnu-efi/inc/efiip.h:204
      Receive : EFI_IP4_RECEIVE;  -- ../../gnu-efi/inc/efiip.h:205
      Cancel : EFI_IP4_CANCEL;  -- ../../gnu-efi/inc/efiip.h:206
      Poll : EFI_IP4_POLL;  -- ../../gnu-efi/inc/efiip.h:207
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:199

   subtype EFI_IP4 is u_EFI_IP4;  -- ../../gnu-efi/inc/efiip.h:208

   type EFI_IP6_CONFIG_DATA is record
      DefaultProtocol : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:211
      AcceptAnyProtocol : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiip.h:212
      AcceptIcmpErrors : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiip.h:213
      AcceptPromiscuous : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiip.h:214
      DestinationAddress : aliased efidef_h.EFI_IPv6_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:215
      StationAddress : aliased efidef_h.EFI_IPv6_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:216
      TrafficClass : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:217
      HopLimit : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:218
      FlowLabel : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:219
      ReceiveTimeout : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:220
      TransmitTimeout : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:221
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:222

   type EFI_IP6_ADDRESS_INFO is record
      Address : aliased efidef_h.EFI_IPv6_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:225
      PrefixLength : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:226
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:227

   type EFI_IP6_ROUTE_TABLE is record
      Gateway : aliased efidef_h.EFI_IPv6_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:230
      Destination : aliased efidef_h.EFI_IPv6_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:231
      PrefixLength : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:232
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:233

   type EFI_IP6_NEIGHBOR_STATE is 
     (EfiNeighborInComplete,
      EfiNeighborReachable,
      EfiNeighborStale,
      EfiNeighborDelay,
      EfiNeighborProbe)
   with Convention => C;  -- ../../gnu-efi/inc/efiip.h:241

   type EFI_IP6_NEIGHBOR_CACHE is record
      Neighbor : aliased efidef_h.EFI_IPv6_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:244
      LinkAddress : aliased efidef_h.EFI_MAC_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:245
      State : aliased EFI_IP6_NEIGHBOR_STATE;  -- ../../gnu-efi/inc/efiip.h:246
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:247

   type EFI_IP6_ICMP_TYPE is record
      c_Type : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:250
      Code : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:251
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:252

  --***********************************************************
  -- ICMPv6 type definitions for error messages
  --***********************************************************
  --***********************************************************
  -- ICMPv6 type definition for informational messages
  --***********************************************************
  --***********************************************************
  -- ICMPv6 code definitions for ICMP_V6_DEST_UNREACHABLE
  --***********************************************************
  --***********************************************************
  -- ICMPv6 code definitions for ICMP_V6_TIME_EXCEEDED
  --***********************************************************
  --***********************************************************
  -- ICMPv6 code definitions for ICMP_V6_PARAMETER_PROBLEM
  --***********************************************************
   type EFI_IP6_MODE_DATA is record
      IsStarted : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiip.h:302
      MaxPacketSize : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:303
      ConfigData : aliased EFI_IP6_CONFIG_DATA;  -- ../../gnu-efi/inc/efiip.h:304
      IsConfigured : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efiip.h:305
      AddressCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:306
      AddressList : access EFI_IP6_ADDRESS_INFO;  -- ../../gnu-efi/inc/efiip.h:307
      GroupCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:308
      GroupTable : access efidef_h.EFI_IPv6_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:309
      RouteCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:310
      RouteTable : access EFI_IP6_ROUTE_TABLE;  -- ../../gnu-efi/inc/efiip.h:311
      NeighborCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:312
      NeighborCache : access EFI_IP6_NEIGHBOR_CACHE;  -- ../../gnu-efi/inc/efiip.h:313
      PrefixCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:314
      PrefixTable : access EFI_IP6_ADDRESS_INFO;  -- ../../gnu-efi/inc/efiip.h:315
      IcmpTypeCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:316
      IcmpTypeList : access EFI_IP6_ICMP_TYPE;  -- ../../gnu-efi/inc/efiip.h:317
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:318

   type u_EFI_IP6;
   type EFI_IP6_GET_MODE_DATA is access function
        (arg1 : access u_EFI_IP6;
         arg2 : access EFI_IP6_MODE_DATA;
         arg3 : access efidef_h.EFI_MANAGED_NETWORK_CONFIG_DATA;
         arg4 : access efinet_h.EFI_SIMPLE_NETWORK_MODE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiip.h:322

   type EFI_IP6_CONFIGURE is access function (arg1 : access u_EFI_IP6; arg2 : access EFI_IP6_CONFIG_DATA) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiip.h:331

   type EFI_IP6_GROUPS is access function
        (arg1 : access u_EFI_IP6;
         arg2 : efidef_h.BOOLEAN;
         arg3 : access efidef_h.EFI_IPv6_ADDRESS) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiip.h:337

   type EFI_IP6_ROUTES is access function
        (arg1 : access u_EFI_IP6;
         arg2 : efidef_h.BOOLEAN;
         arg3 : access efidef_h.EFI_IPv6_ADDRESS;
         arg4 : efibind_h.UINT8;
         arg5 : access efidef_h.EFI_IPv6_ADDRESS) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiip.h:345

   type EFI_IP6_NEIGHBORS is access function
        (arg1 : access u_EFI_IP6;
         arg2 : efidef_h.BOOLEAN;
         arg3 : access efidef_h.EFI_IPv6_ADDRESS;
         arg4 : access efidef_h.EFI_MAC_ADDRESS;
         arg5 : efibind_h.UINT32;
         arg6 : efidef_h.BOOLEAN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiip.h:355

   type u_EFI_IP6_FRAGMENT_DATA is record
      FragmentLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:365
      FragmentBuffer : System.Address;  -- ../../gnu-efi/inc/efiip.h:366
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:364

   subtype EFI_IP6_FRAGMENT_DATA is u_EFI_IP6_FRAGMENT_DATA;  -- ../../gnu-efi/inc/efiip.h:367

   type u_EFI_IP6_OVERRIDE_DATA is record
      Protocol : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:370
      HopLimit : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:371
      FlowLabel : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:372
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:369

   subtype EFI_IP6_OVERRIDE_DATA is u_EFI_IP6_OVERRIDE_DATA;  -- ../../gnu-efi/inc/efiip.h:373

   type anon_array2740 is array (0 .. 0) of aliased EFI_IP6_FRAGMENT_DATA;
   type u_EFI_IP6_TRANSMIT_DATA is record
      DestinationAddress : aliased efidef_h.EFI_IPv6_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:376
      OverrideData : access EFI_IP6_OVERRIDE_DATA;  -- ../../gnu-efi/inc/efiip.h:377
      ExtHdrsLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:378
      ExtHdrs : System.Address;  -- ../../gnu-efi/inc/efiip.h:379
      NextHeader : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:380
      DataLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:381
      FragmentCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:382
      FragmentTable : aliased anon_array2740;  -- ../../gnu-efi/inc/efiip.h:383
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:375

   subtype EFI_IP6_TRANSMIT_DATA is u_EFI_IP6_TRANSMIT_DATA;  -- ../../gnu-efi/inc/efiip.h:384

   type u_EFI_IP6_HEADER is record
      TrafficClassH : Extensions.Unsigned_4;  -- ../../gnu-efi/inc/efiip.h:388
      Version : Extensions.Unsigned_4;  -- ../../gnu-efi/inc/efiip.h:389
      FlowLabelH : Extensions.Unsigned_4;  -- ../../gnu-efi/inc/efiip.h:390
      TrafficClassL : Extensions.Unsigned_4;  -- ../../gnu-efi/inc/efiip.h:391
      FlowLabelL : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efiip.h:392
      PayloadLength : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efiip.h:393
      NextHeader : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:394
      HopLimit : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efiip.h:395
      SourceAddress : aliased efidef_h.EFI_IPv6_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:396
      DestinationAddress : aliased efidef_h.EFI_IPv6_ADDRESS;  -- ../../gnu-efi/inc/efiip.h:397
   end record
   with Convention => C_Pass_By_Copy,
        Pack => True,
        Alignment => 1;  -- ../../gnu-efi/inc/efiip.h:387

   subtype EFI_IP6_HEADER is u_EFI_IP6_HEADER;  -- ../../gnu-efi/inc/efiip.h:398

   type u_EFI_IP6_RECEIVE_DATA is record
      TimeStamp : aliased efidef_h.EFI_TIME;  -- ../../gnu-efi/inc/efiip.h:402
      RecycleSignal : efidef_h.EFI_EVENT;  -- ../../gnu-efi/inc/efiip.h:403
      HeaderLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:404
      Header : access EFI_IP6_HEADER;  -- ../../gnu-efi/inc/efiip.h:405
      DataLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:406
      FragmentCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efiip.h:407
      FragmentTable : aliased anon_array2740;  -- ../../gnu-efi/inc/efiip.h:408
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:401

   subtype EFI_IP6_RECEIVE_DATA is u_EFI_IP6_RECEIVE_DATA;  -- ../../gnu-efi/inc/efiip.h:409

   type anon_union2750 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            RxData : access EFI_IP6_RECEIVE_DATA;  -- ../../gnu-efi/inc/efiip.h:415
         when others =>
            TxData : access EFI_IP6_TRANSMIT_DATA;  -- ../../gnu-efi/inc/efiip.h:416
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type EFI_IP6_COMPLETION_TOKEN is record
      Event : efidef_h.EFI_EVENT;  -- ../../gnu-efi/inc/efiip.h:412
      Status : aliased efidef_h.EFI_STATUS;  -- ../../gnu-efi/inc/efiip.h:413
      Packet : aliased anon_union2750;  -- ../../gnu-efi/inc/efiip.h:417
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:418

   type EFI_IP6_TRANSMIT is access function (arg1 : access u_EFI_IP6; arg2 : access EFI_IP6_COMPLETION_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiip.h:422

   type EFI_IP6_RECEIVE is access function (arg1 : access u_EFI_IP6; arg2 : access EFI_IP6_COMPLETION_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiip.h:429

   type EFI_IP6_CANCEL is access function (arg1 : access u_EFI_IP6; arg2 : access EFI_IP6_COMPLETION_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiip.h:436

   type EFI_IP6_POLL is access function (arg1 : access u_EFI_IP6) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efiip.h:443

   type u_EFI_IP6 is record
      GetModeData : EFI_IP6_GET_MODE_DATA;  -- ../../gnu-efi/inc/efiip.h:448
      Configure : EFI_IP6_CONFIGURE;  -- ../../gnu-efi/inc/efiip.h:449
      Groups : EFI_IP6_GROUPS;  -- ../../gnu-efi/inc/efiip.h:450
      Routes : EFI_IP6_ROUTES;  -- ../../gnu-efi/inc/efiip.h:451
      Neighbors : EFI_IP6_NEIGHBORS;  -- ../../gnu-efi/inc/efiip.h:452
      Transmit : EFI_IP6_TRANSMIT;  -- ../../gnu-efi/inc/efiip.h:453
      Receive : EFI_IP6_RECEIVE;  -- ../../gnu-efi/inc/efiip.h:454
      Cancel : EFI_IP6_CANCEL;  -- ../../gnu-efi/inc/efiip.h:455
      Poll : EFI_IP6_POLL;  -- ../../gnu-efi/inc/efiip.h:456
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efiip.h:447

   subtype EFI_IP6 is u_EFI_IP6;  -- ../../gnu-efi/inc/efiip.h:457

end efiip_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
