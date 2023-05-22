pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with efibind_h;
with efidef_h;
with Interfaces.C.Extensions;
with System;

package efipxebc_h is

   --  unsupported macro: EFI_PXE_BASE_CODE_PROTOCOL_GUID { 0x03c4e603, 0xac28, 0x11d3, {0x9a, 0x2d, 0x00, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
   DEFAULT_TTL : constant := 4;  --  ../../gnu-efi/inc/efipxebc.h:31
   DEFAULT_ToS : constant := 0;  --  ../../gnu-efi/inc/efipxebc.h:32

   EFI_PXE_BASE_CODE_MAX_IPCNT : constant := 8;  --  ../../gnu-efi/inc/efipxebc.h:104

   EFI_PXE_BASE_CODE_IP_FILTER_STATION_IP : constant := 16#0001#;  --  ../../gnu-efi/inc/efipxebc.h:112
   EFI_PXE_BASE_CODE_IP_FILTER_BROADCAST : constant := 16#0002#;  --  ../../gnu-efi/inc/efipxebc.h:113
   EFI_PXE_BASE_CODE_IP_FILTER_PROMISCUOUS : constant := 16#0004#;  --  ../../gnu-efi/inc/efipxebc.h:114
   EFI_PXE_BASE_CODE_IP_FILTER_PROMISCUOUS_MULTICAST : constant := 16#0008#;  --  ../../gnu-efi/inc/efipxebc.h:115

   EFI_PXE_BASE_CODE_UDP_OPFLAGS_ANY_SRC_IP : constant := 16#0001#;  --  ../../gnu-efi/inc/efipxebc.h:136
   EFI_PXE_BASE_CODE_UDP_OPFLAGS_ANY_SRC_PORT : constant := 16#0002#;  --  ../../gnu-efi/inc/efipxebc.h:137
   EFI_PXE_BASE_CODE_UDP_OPFLAGS_ANY_DEST_IP : constant := 16#0004#;  --  ../../gnu-efi/inc/efipxebc.h:138
   EFI_PXE_BASE_CODE_UDP_OPFLAGS_ANY_DEST_PORT : constant := 16#0008#;  --  ../../gnu-efi/inc/efipxebc.h:139
   EFI_PXE_BASE_CODE_UDP_OPFLAGS_USE_FILTER : constant := 16#0010#;  --  ../../gnu-efi/inc/efipxebc.h:140
   EFI_PXE_BASE_CODE_UDP_OPFLAGS_MAY_FRAGMENT : constant := 16#0020#;  --  ../../gnu-efi/inc/efipxebc.h:141

   EFI_PXE_BASE_CODE_BOOT_TYPE_BOOTSTRAP : constant := 0;  --  ../../gnu-efi/inc/efipxebc.h:147
   EFI_PXE_BASE_CODE_BOOT_TYPE_MS_WINNT_RIS : constant := 1;  --  ../../gnu-efi/inc/efipxebc.h:148
   EFI_PXE_BASE_CODE_BOOT_TYPE_INTEL_LCM : constant := 2;  --  ../../gnu-efi/inc/efipxebc.h:149
   EFI_PXE_BASE_CODE_BOOT_TYPE_DOSUNDI : constant := 3;  --  ../../gnu-efi/inc/efipxebc.h:150
   EFI_PXE_BASE_CODE_BOOT_TYPE_NEC_ESMPRO : constant := 4;  --  ../../gnu-efi/inc/efipxebc.h:151
   EFI_PXE_BASE_CODE_BOOT_TYPE_IBM_WSoD : constant := 5;  --  ../../gnu-efi/inc/efipxebc.h:152
   EFI_PXE_BASE_CODE_BOOT_TYPE_IBM_LCCM : constant := 6;  --  ../../gnu-efi/inc/efipxebc.h:153
   EFI_PXE_BASE_CODE_BOOT_TYPE_CA_UNICENTER_TNG : constant := 7;  --  ../../gnu-efi/inc/efipxebc.h:154
   EFI_PXE_BASE_CODE_BOOT_TYPE_HP_OPENVIEW : constant := 8;  --  ../../gnu-efi/inc/efipxebc.h:155
   EFI_PXE_BASE_CODE_BOOT_TYPE_ALTIRIS_9 : constant := 9;  --  ../../gnu-efi/inc/efipxebc.h:156
   EFI_PXE_BASE_CODE_BOOT_TYPE_ALTIRIS_10 : constant := 10;  --  ../../gnu-efi/inc/efipxebc.h:157
   EFI_PXE_BASE_CODE_BOOT_TYPE_ALTIRIS_11 : constant := 11;  --  ../../gnu-efi/inc/efipxebc.h:158
   EFI_PXE_BASE_CODE_BOOT_TYPE_NOT_USED_12 : constant := 12;  --  ../../gnu-efi/inc/efipxebc.h:159
   EFI_PXE_BASE_CODE_BOOT_TYPE_REDHAT_INSTALL : constant := 13;  --  ../../gnu-efi/inc/efipxebc.h:160
   EFI_PXE_BASE_CODE_BOOT_TYPE_REDHAT_BOOT : constant := 14;  --  ../../gnu-efi/inc/efipxebc.h:161
   EFI_PXE_BASE_CODE_BOOT_TYPE_REMBO : constant := 15;  --  ../../gnu-efi/inc/efipxebc.h:162
   EFI_PXE_BASE_CODE_BOOT_TYPE_BEOBOOT : constant := 16;  --  ../../gnu-efi/inc/efipxebc.h:163

   EFI_PXE_BASE_CODE_BOOT_TYPE_PXETEST : constant := 65535;  --  ../../gnu-efi/inc/efipxebc.h:169

   EFI_PXE_BASE_CODE_BOOT_LAYER_MASK : constant := 16#7FFF#;  --  ../../gnu-efi/inc/efipxebc.h:171
   EFI_PXE_BASE_CODE_BOOT_LAYER_INITIAL : constant := 16#0000#;  --  ../../gnu-efi/inc/efipxebc.h:172

   EFI_PXE_BASE_CODE_MAX_ARP_ENTRIES : constant := 8;  --  ../../gnu-efi/inc/efipxebc.h:220
   EFI_PXE_BASE_CODE_MAX_ROUTE_ENTRIES : constant := 8;  --  ../../gnu-efi/inc/efipxebc.h:221

   EFI_PXE_BASE_CODE_PROTOCOL_REVISION : constant := 16#00010000#;  --  ../../gnu-efi/inc/efipxebc.h:396
   --  unsupported macro: EFI_PXE_BASE_CODE_INTERFACE_REVISION EFI_PXE_BASE_CODE_PROTOCOL_REVISION
   --  unsupported macro: EFI_PXE_BASE_CODE_CALLBACK_PROTOCOL_GUID { 0x245dca21, 0xfb7b, 0x11d3, {0x8f, 0x01, 0x00, 0xa0, 0xc9, 0x69, 0x72, 0x3b} }

   EFI_PXE_BASE_CODE_CALLBACK_PROTOCOL_REVISION : constant := 16#00010000#;  --  ../../gnu-efi/inc/efipxebc.h:435
   --  unsupported macro: EFI_PXE_BASE_CODE_CALLBACK_INTERFACE_REVISION EFI_PXE_BASE_CODE_CALLBACK_PROTOCOL_REVISION

  --++
  --Copyright (c) 1998  Intel Corporation
  --Module Name:
  --    efipxebc.h
  --Abstract:
  --    EFI PXE Base Code Protocol
  --Revision History
  ---- 

  -- PXE Base Code protocol
  -- Address definitions
   type anon_array2017 is array (0 .. 3) of aliased efibind_h.UINT32;
   type EFI_IP_ADDRESS (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            Addr : aliased anon_array2017;  -- ../../gnu-efi/inc/efipxebc.h:38
         when 1 =>
            v4 : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efipxebc.h:39
         when others =>
            v6 : aliased efidef_h.EFI_IPv6_ADDRESS;  -- ../../gnu-efi/inc/efipxebc.h:40
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- ../../gnu-efi/inc/efipxebc.h:41

   subtype EFI_PXE_BASE_CODE_UDP_PORT is efibind_h.UINT16;  -- ../../gnu-efi/inc/efipxebc.h:43

  -- Packet definitions
   type anon_array987 is array (0 .. 3) of aliased efibind_h.UINT8;
   type anon_array992 is array (0 .. 15) of aliased efibind_h.UINT8;
   type anon_array1622 is array (0 .. 63) of aliased efibind_h.UINT8;
   type anon_array2023 is array (0 .. 127) of aliased efibind_h.UINT8;
   type anon_array2026 is array (0 .. 55) of aliased efibind_h.UINT8;
   type EFI_PXE_BASE_CODE_DHCPV4_PACKET is record
      BootpOpcode : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efipxebc.h:50
      BootpHwType : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efipxebc.h:51
      BootpHwAddrLen : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efipxebc.h:52
      BootpGateHops : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efipxebc.h:53
      BootpIdent : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efipxebc.h:54
      BootpSeconds : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efipxebc.h:55
      BootpFlags : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efipxebc.h:56
      BootpCiAddr : aliased anon_array987;  -- ../../gnu-efi/inc/efipxebc.h:57
      BootpYiAddr : aliased anon_array987;  -- ../../gnu-efi/inc/efipxebc.h:58
      BootpSiAddr : aliased anon_array987;  -- ../../gnu-efi/inc/efipxebc.h:59
      BootpGiAddr : aliased anon_array987;  -- ../../gnu-efi/inc/efipxebc.h:60
      BootpHwAddr : aliased anon_array992;  -- ../../gnu-efi/inc/efipxebc.h:61
      BootpSrvName : aliased anon_array1622;  -- ../../gnu-efi/inc/efipxebc.h:62
      BootpBootFile : aliased anon_array2023;  -- ../../gnu-efi/inc/efipxebc.h:63
      DhcpMagik : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efipxebc.h:64
      DhcpOptions : aliased anon_array2026;  -- ../../gnu-efi/inc/efipxebc.h:65
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipxebc.h:66

   type anon_array2031 is array (0 .. 1023) of aliased efibind_h.UINT8;
   type EFI_PXE_BASE_CODE_DHCPV6_PACKET is record
      MessageType : aliased unsigned_char;  -- ../../gnu-efi/inc/efipxebc.h:69
      TransactionId : Extensions.Unsigned_24;  -- ../../gnu-efi/inc/efipxebc.h:70
      DhcpOptions : aliased anon_array2031;  -- ../../gnu-efi/inc/efipxebc.h:71
   end record
   with Convention => C_Pass_By_Copy,
        Pack => True,
        Alignment => 4;  -- ../../gnu-efi/inc/efipxebc.h:72

   type anon_array2037 is array (0 .. 1471) of aliased efibind_h.UINT8;
   type EFI_PXE_BASE_CODE_PACKET (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            Raw : aliased anon_array2037;  -- ../../gnu-efi/inc/efipxebc.h:75
         when 1 =>
            Dhcpv4 : aliased EFI_PXE_BASE_CODE_DHCPV4_PACKET;  -- ../../gnu-efi/inc/efipxebc.h:76
         when others =>
            Dhcpv6 : aliased EFI_PXE_BASE_CODE_DHCPV6_PACKET;  -- ../../gnu-efi/inc/efipxebc.h:77
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- ../../gnu-efi/inc/efipxebc.h:78

   type anon_struct2042 is record
      Identifier : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efipxebc.h:89
      Sequence : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efipxebc.h:90
   end record
   with Convention => C_Pass_By_Copy;
   type anon_union2041 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            reserved : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efipxebc.h:85
         when 1 =>
            Mtu : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efipxebc.h:86
         when 2 =>
            Pointer : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efipxebc.h:87
         when others =>
            Echo : aliased anon_struct2042;  -- ../../gnu-efi/inc/efipxebc.h:91
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type anon_array2044 is array (0 .. 493) of aliased efibind_h.UINT8;
   type EFI_PXE_BASE_CODE_ICMP_ERROR is record
      c_Type : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efipxebc.h:81
      Code : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efipxebc.h:82
      Checksum : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efipxebc.h:83
      u : aliased anon_union2041;  -- ../../gnu-efi/inc/efipxebc.h:92
      Data : aliased anon_array2044;  -- ../../gnu-efi/inc/efipxebc.h:93
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipxebc.h:94

   type anon_array2049 is array (0 .. 126) of aliased efidef_h.CHAR8;
   type EFI_PXE_BASE_CODE_TFTP_ERROR is record
      ErrorCode : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efipxebc.h:97
      ErrorString : aliased anon_array2049;  -- ../../gnu-efi/inc/efipxebc.h:98
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipxebc.h:99

  -- IP Receive Filter definitions
   type anon_array2053 is array (0 .. 7) of aliased EFI_IP_ADDRESS;
   type EFI_PXE_BASE_CODE_IP_FILTER is record
      Filters : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efipxebc.h:106
      IpCnt : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efipxebc.h:107
      reserved : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efipxebc.h:108
      IpList : aliased anon_array2053;  -- ../../gnu-efi/inc/efipxebc.h:109
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipxebc.h:110

  -- ARP Cache definitions
   type EFI_PXE_BASE_CODE_ARP_ENTRY is record
      IpAddr : aliased EFI_IP_ADDRESS;  -- ../../gnu-efi/inc/efipxebc.h:122
      MacAddr : aliased efidef_h.EFI_MAC_ADDRESS;  -- ../../gnu-efi/inc/efipxebc.h:123
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipxebc.h:124

   type EFI_PXE_BASE_CODE_ROUTE_ENTRY is record
      IpAddr : aliased EFI_IP_ADDRESS;  -- ../../gnu-efi/inc/efipxebc.h:127
      SubnetMask : aliased EFI_IP_ADDRESS;  -- ../../gnu-efi/inc/efipxebc.h:128
      GwAddr : aliased EFI_IP_ADDRESS;  -- ../../gnu-efi/inc/efipxebc.h:129
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipxebc.h:130

  -- UDP definitions
  -- Discover() definitions
  -- 17 through 32767 are reserved
  -- 32768 through 65279 are for vendor use
  -- 65280 through 65534 are reserved
   type EFI_PXE_BASE_CODE_SRVLIST is record
      c_Type : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efipxebc.h:176
      AcceptAnyResponse : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:177
      Reserved : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efipxebc.h:178
      IpAddr : aliased EFI_IP_ADDRESS;  -- ../../gnu-efi/inc/efipxebc.h:179
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipxebc.h:180

   type anon_array2063 is array (0 .. 0) of aliased EFI_PXE_BASE_CODE_SRVLIST;
   type EFI_PXE_BASE_CODE_DISCOVER_INFO is record
      UseMCast : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:183
      UseBCast : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:184
      UseUCast : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:185
      MustUseList : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:186
      ServerMCastIp : aliased EFI_IP_ADDRESS;  -- ../../gnu-efi/inc/efipxebc.h:187
      IpCnt : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efipxebc.h:188
      SrvList : aliased anon_array2063;  -- ../../gnu-efi/inc/efipxebc.h:189
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipxebc.h:190

  -- Mtftp() definitions
   type EFI_PXE_BASE_CODE_TFTP_OPCODE is 
     (EFI_PXE_BASE_CODE_TFTP_FIRST,
      EFI_PXE_BASE_CODE_TFTP_GET_FILE_SIZE,
      EFI_PXE_BASE_CODE_TFTP_READ_FILE,
      EFI_PXE_BASE_CODE_TFTP_WRITE_FILE,
      EFI_PXE_BASE_CODE_TFTP_READ_DIRECTORY,
      EFI_PXE_BASE_CODE_MTFTP_GET_FILE_SIZE,
      EFI_PXE_BASE_CODE_MTFTP_READ_FILE,
      EFI_PXE_BASE_CODE_MTFTP_READ_DIRECTORY,
      EFI_PXE_BASE_CODE_MTFTP_LAST)
   with Convention => C;  -- ../../gnu-efi/inc/efipxebc.h:206

   type EFI_PXE_BASE_CODE_MTFTP_INFO is record
      MCastIp : aliased EFI_IP_ADDRESS;  -- ../../gnu-efi/inc/efipxebc.h:209
      CPort : aliased EFI_PXE_BASE_CODE_UDP_PORT;  -- ../../gnu-efi/inc/efipxebc.h:210
      SPort : aliased EFI_PXE_BASE_CODE_UDP_PORT;  -- ../../gnu-efi/inc/efipxebc.h:211
      ListenTimeout : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efipxebc.h:212
      TransmitTimeout : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efipxebc.h:213
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipxebc.h:214

  -- PXE Base Code Mode structure
   type anon_array2071 is array (0 .. 7) of aliased EFI_PXE_BASE_CODE_ARP_ENTRY;
   type anon_array2073 is array (0 .. 7) of aliased EFI_PXE_BASE_CODE_ROUTE_ENTRY;
   type EFI_PXE_BASE_CODE_MODE is record
      Started : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:224
      Ipv6Available : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:225
      Ipv6Supported : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:226
      UsingIpv6 : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:227
      BisSupported : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:228
      BisDetected : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:229
      AutoArp : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:230
      SendGUID : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:231
      DhcpDiscoverValid : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:232
      DhcpAckReceived : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:233
      ProxyOfferReceived : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:234
      PxeDiscoverValid : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:235
      PxeReplyReceived : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:236
      PxeBisReplyReceived : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:237
      IcmpErrorReceived : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:238
      TftpErrorReceived : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:239
      MakeCallbacks : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipxebc.h:240
      TTL : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efipxebc.h:241
      ToS : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efipxebc.h:242
      StationIp : aliased EFI_IP_ADDRESS;  -- ../../gnu-efi/inc/efipxebc.h:243
      SubnetMask : aliased EFI_IP_ADDRESS;  -- ../../gnu-efi/inc/efipxebc.h:244
      DhcpDiscover : aliased EFI_PXE_BASE_CODE_PACKET;  -- ../../gnu-efi/inc/efipxebc.h:245
      DhcpAck : aliased EFI_PXE_BASE_CODE_PACKET;  -- ../../gnu-efi/inc/efipxebc.h:246
      ProxyOffer : aliased EFI_PXE_BASE_CODE_PACKET;  -- ../../gnu-efi/inc/efipxebc.h:247
      PxeDiscover : aliased EFI_PXE_BASE_CODE_PACKET;  -- ../../gnu-efi/inc/efipxebc.h:248
      PxeReply : aliased EFI_PXE_BASE_CODE_PACKET;  -- ../../gnu-efi/inc/efipxebc.h:249
      PxeBisReply : aliased EFI_PXE_BASE_CODE_PACKET;  -- ../../gnu-efi/inc/efipxebc.h:250
      IpFilter : aliased EFI_PXE_BASE_CODE_IP_FILTER;  -- ../../gnu-efi/inc/efipxebc.h:251
      ArpCacheEntries : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efipxebc.h:252
      ArpCache : aliased anon_array2071;  -- ../../gnu-efi/inc/efipxebc.h:253
      RouteTableEntries : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efipxebc.h:254
      RouteTable : aliased anon_array2073;  -- ../../gnu-efi/inc/efipxebc.h:255
      IcmpError : aliased EFI_PXE_BASE_CODE_ICMP_ERROR;  -- ../../gnu-efi/inc/efipxebc.h:256
      TftpError : aliased EFI_PXE_BASE_CODE_TFTP_ERROR;  -- ../../gnu-efi/inc/efipxebc.h:257
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipxebc.h:258

  -- PXE Base Code Interface Function definitions
   type u_EFI_PXE_BASE_CODE_PROTOCOL;
   type EFI_PXE_BASE_CODE_START is access function (arg1 : access u_EFI_PXE_BASE_CODE_PROTOCOL; arg2 : efidef_h.BOOLEAN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipxebc.h:266

   type EFI_PXE_BASE_CODE_STOP is access function (arg1 : access u_EFI_PXE_BASE_CODE_PROTOCOL) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipxebc.h:273

   type EFI_PXE_BASE_CODE_DHCP is access function (arg1 : access u_EFI_PXE_BASE_CODE_PROTOCOL; arg2 : efidef_h.BOOLEAN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipxebc.h:279

   type EFI_PXE_BASE_CODE_DISCOVER is access function
        (arg1 : access u_EFI_PXE_BASE_CODE_PROTOCOL;
         arg2 : efibind_h.UINT16;
         arg3 : access efibind_h.UINT16;
         arg4 : efidef_h.BOOLEAN;
         arg5 : access EFI_PXE_BASE_CODE_DISCOVER_INFO) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipxebc.h:286

   type EFI_PXE_BASE_CODE_MTFTP is access function
        (arg1 : access u_EFI_PXE_BASE_CODE_PROTOCOL;
         arg2 : EFI_PXE_BASE_CODE_TFTP_OPCODE;
         arg3 : System.Address;
         arg4 : efidef_h.BOOLEAN;
         arg5 : access efibind_h.UINT64;
         arg6 : access efibind_h.UINTN;
         arg7 : access EFI_IP_ADDRESS;
         arg8 : access efibind_h.UINT8;
         arg9 : access EFI_PXE_BASE_CODE_MTFTP_INFO;
         arg10 : efidef_h.BOOLEAN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipxebc.h:296

   type EFI_PXE_BASE_CODE_UDP_WRITE is access function
        (arg1 : access u_EFI_PXE_BASE_CODE_PROTOCOL;
         arg2 : efibind_h.UINT16;
         arg3 : access EFI_IP_ADDRESS;
         arg4 : access EFI_PXE_BASE_CODE_UDP_PORT;
         arg5 : access EFI_IP_ADDRESS;
         arg6 : access EFI_IP_ADDRESS;
         arg7 : access EFI_PXE_BASE_CODE_UDP_PORT;
         arg8 : access efibind_h.UINTN;
         arg9 : System.Address;
         arg10 : access efibind_h.UINTN;
         arg11 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipxebc.h:311

   type EFI_PXE_BASE_CODE_UDP_READ is access function
        (arg1 : access u_EFI_PXE_BASE_CODE_PROTOCOL;
         arg2 : efibind_h.UINT16;
         arg3 : access EFI_IP_ADDRESS;
         arg4 : access EFI_PXE_BASE_CODE_UDP_PORT;
         arg5 : access EFI_IP_ADDRESS;
         arg6 : access EFI_PXE_BASE_CODE_UDP_PORT;
         arg7 : access efibind_h.UINTN;
         arg8 : System.Address;
         arg9 : access efibind_h.UINTN;
         arg10 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipxebc.h:327

   type EFI_PXE_BASE_CODE_SET_IP_FILTER is access function (arg1 : access u_EFI_PXE_BASE_CODE_PROTOCOL; arg2 : access EFI_PXE_BASE_CODE_IP_FILTER) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipxebc.h:342

   type EFI_PXE_BASE_CODE_ARP is access function
        (arg1 : access u_EFI_PXE_BASE_CODE_PROTOCOL;
         arg2 : access EFI_IP_ADDRESS;
         arg3 : access efidef_h.EFI_MAC_ADDRESS) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipxebc.h:349

   type EFI_PXE_BASE_CODE_SET_PARAMETERS is access function
        (arg1 : access u_EFI_PXE_BASE_CODE_PROTOCOL;
         arg2 : access efidef_h.BOOLEAN;
         arg3 : access efidef_h.BOOLEAN;
         arg4 : access efibind_h.UINT8;
         arg5 : access efibind_h.UINT8;
         arg6 : access efidef_h.BOOLEAN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipxebc.h:357

   type EFI_PXE_BASE_CODE_SET_STATION_IP is access function
        (arg1 : access u_EFI_PXE_BASE_CODE_PROTOCOL;
         arg2 : access EFI_IP_ADDRESS;
         arg3 : access EFI_IP_ADDRESS) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipxebc.h:368

   type EFI_PXE_BASE_CODE_SET_PACKETS is access function
        (arg1 : access u_EFI_PXE_BASE_CODE_PROTOCOL;
         arg2 : access efidef_h.BOOLEAN;
         arg3 : access efidef_h.BOOLEAN;
         arg4 : access efidef_h.BOOLEAN;
         arg5 : access efidef_h.BOOLEAN;
         arg6 : access efidef_h.BOOLEAN;
         arg7 : access efidef_h.BOOLEAN;
         arg8 : access EFI_PXE_BASE_CODE_PACKET;
         arg9 : access EFI_PXE_BASE_CODE_PACKET;
         arg10 : access EFI_PXE_BASE_CODE_PACKET;
         arg11 : access EFI_PXE_BASE_CODE_PACKET;
         arg12 : access EFI_PXE_BASE_CODE_PACKET;
         arg13 : access EFI_PXE_BASE_CODE_PACKET) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipxebc.h:376

  -- PXE Base Code Protocol structure
   type u_EFI_PXE_BASE_CODE_PROTOCOL is record
      Revision : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efipxebc.h:400
      Start : EFI_PXE_BASE_CODE_START;  -- ../../gnu-efi/inc/efipxebc.h:401
      Stop : EFI_PXE_BASE_CODE_STOP;  -- ../../gnu-efi/inc/efipxebc.h:402
      Dhcp : EFI_PXE_BASE_CODE_DHCP;  -- ../../gnu-efi/inc/efipxebc.h:403
      Discover : EFI_PXE_BASE_CODE_DISCOVER;  -- ../../gnu-efi/inc/efipxebc.h:404
      Mtftp : EFI_PXE_BASE_CODE_MTFTP;  -- ../../gnu-efi/inc/efipxebc.h:405
      UdpWrite : EFI_PXE_BASE_CODE_UDP_WRITE;  -- ../../gnu-efi/inc/efipxebc.h:406
      UdpRead : EFI_PXE_BASE_CODE_UDP_READ;  -- ../../gnu-efi/inc/efipxebc.h:407
      SetIpFilter : EFI_PXE_BASE_CODE_SET_IP_FILTER;  -- ../../gnu-efi/inc/efipxebc.h:408
      Arp : EFI_PXE_BASE_CODE_ARP;  -- ../../gnu-efi/inc/efipxebc.h:409
      SetParameters : EFI_PXE_BASE_CODE_SET_PARAMETERS;  -- ../../gnu-efi/inc/efipxebc.h:410
      SetStationIp : EFI_PXE_BASE_CODE_SET_STATION_IP;  -- ../../gnu-efi/inc/efipxebc.h:411
      SetPackets : EFI_PXE_BASE_CODE_SET_PACKETS;  -- ../../gnu-efi/inc/efipxebc.h:412
      Mode : access EFI_PXE_BASE_CODE_MODE;  -- ../../gnu-efi/inc/efipxebc.h:413
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipxebc.h:399

   subtype EFI_PXE_BASE_CODE_PROTOCOL is u_EFI_PXE_BASE_CODE_PROTOCOL;  -- ../../gnu-efi/inc/efipxebc.h:414

  -- Note: Because it conflicted with the EDK2 struct name, the
  -- 'EFI_PXE_BASE_CODE_PROTOCOL' GUID definition, from older
  -- versions of gnu-efi, is now obsoleted.
  -- Use 'EFI_PXE_BASE_CODE_PROTOCOL_GUID' instead.
   subtype u_EFI_PXE_BASE_CODE is u_EFI_PXE_BASE_CODE_PROTOCOL;  -- ../../gnu-efi/inc/efipxebc.h:421

   subtype EFI_PXE_BASE_CODE is u_EFI_PXE_BASE_CODE_PROTOCOL;  -- ../../gnu-efi/inc/efipxebc.h:422

  -- Call Back Definitions
  -- Revision Number
   type EFI_PXE_BASE_CODE_FUNCTION is 
     (EFI_PXE_BASE_CODE_FUNCTION_FIRST,
      EFI_PXE_BASE_CODE_FUNCTION_DHCP,
      EFI_PXE_BASE_CODE_FUNCTION_DISCOVER,
      EFI_PXE_BASE_CODE_FUNCTION_MTFTP,
      EFI_PXE_BASE_CODE_FUNCTION_UDP_WRITE,
      EFI_PXE_BASE_CODE_FUNCTION_UDP_READ,
      EFI_PXE_BASE_CODE_FUNCTION_ARP,
      EFI_PXE_BASE_CODE_FUNCTION_IGMP,
      EFI_PXE_BASE_CODE_PXE_FUNCTION_LAST)
   with Convention => C;  -- ../../gnu-efi/inc/efipxebc.h:450

   type EFI_PXE_BASE_CODE_CALLBACK_STATUS is 
     (EFI_PXE_BASE_CODE_CALLBACK_STATUS_FIRST,
      EFI_PXE_BASE_CODE_CALLBACK_STATUS_CONTINUE,
      EFI_PXE_BASE_CODE_CALLBACK_STATUS_ABORT,
      EFI_PXE_BASE_CODE_CALLBACK_STATUS_LAST)
   with Convention => C;  -- ../../gnu-efi/inc/efipxebc.h:457

   type u_EFI_PXE_BASE_CODE_CALLBACK_PROTOCOL;
   type EFI_PXE_CALLBACK is access function
        (arg1 : access u_EFI_PXE_BASE_CODE_CALLBACK_PROTOCOL;
         arg2 : EFI_PXE_BASE_CODE_FUNCTION;
         arg3 : efidef_h.BOOLEAN;
         arg4 : efibind_h.UINT32;
         arg5 : access EFI_PXE_BASE_CODE_PACKET) return EFI_PXE_BASE_CODE_CALLBACK_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipxebc.h:461

   type u_EFI_PXE_BASE_CODE_CALLBACK_PROTOCOL is record
      Revision : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efipxebc.h:470
      Callback : EFI_PXE_CALLBACK;  -- ../../gnu-efi/inc/efipxebc.h:471
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipxebc.h:469

   subtype EFI_PXE_BASE_CODE_CALLBACK_PROTOCOL is u_EFI_PXE_BASE_CODE_CALLBACK_PROTOCOL;  -- ../../gnu-efi/inc/efipxebc.h:472

  -- Note: Because it conflicted with the EDK2 struct name, the
  -- 'EFI_PXE_BASE_CODE_CALLBACK_PROTOCOL' GUID definition, from
  -- older versions of gnu-efi, is now obsoleted.
  -- Use 'EFI_PXE_BASE_CODE_CALLBACK_PROTOCOL_GUID' instead.
   subtype u_EFI_PXE_BASE_CODE_CALLBACK is u_EFI_PXE_BASE_CODE_CALLBACK_PROTOCOL;  -- ../../gnu-efi/inc/efipxebc.h:479

   subtype EFI_PXE_BASE_CODE_CALLBACK is EFI_PXE_BASE_CODE_CALLBACK_PROTOCOL;  -- ../../gnu-efi/inc/efipxebc.h:480

end efipxebc_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
