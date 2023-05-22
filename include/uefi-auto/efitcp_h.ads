pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with efidef_h;
with efibind_h;
limited with efiip_h;
limited with efinet_h;
with System;

package efitcp_h is

   --  unsupported macro: EFI_TCP4_SERVICE_BINDING_PROTOCOL { 0x00720665, 0x67eb, 0x4a99, {0xba, 0xf7, 0xd3, 0xc3, 0x3a, 0x1c,0x7c, 0xc9}}
   --  unsupported macro: EFI_TCP4_PROTOCOL { 0x65530bc7, 0xa359, 0x410f, {0xb0, 0x10, 0x5a, 0xad, 0xc7, 0xec, 0x2b, 0x62}}
   --  unsupported macro: EFI_TCP6_SERVICE_BINDING_PROTOCOL { 0xec20eb79, 0x6c1a, 0x4664, {0x9a, 0xd, 0xd2, 0xe4, 0xcc, 0x16, 0xd6, 0x64}}
   --  unsupported macro: EFI_TCP6_PROTOCOL { 0x46e44855, 0xbd60, 0x4ab7, {0xab, 0xd, 0xa6, 0x79, 0xb9, 0x44, 0x7d, 0x77}}
   --  unsupported macro: EFI_CONNECTION_FIN EFIERR(104)
   --  unsupported macro: EFI_CONNECTION_RESET EFIERR(105)
   --  unsupported macro: EFI_CONNECTION_REFUSED EFIERR(106)
  --++
  --Copyright (c) 2013  Intel Corporation
  ---- 

   type EFI_TCP4_ACCESS_POINT is record
      UseDefaultAddress : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:25
      StationAddress : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efitcp.h:26
      SubnetMask : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efitcp.h:27
      StationPort : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efitcp.h:28
      RemoteAddress : aliased efidef_h.EFI_IPv4_ADDRESS;  -- ../../gnu-efi/inc/efitcp.h:29
      RemotePort : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efitcp.h:30
      ActiveFlag : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:31
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:32

   type EFI_TCP4_OPTION is record
      ReceiveBufferSize : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:35
      SendBufferSize : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:36
      MaxSynBackLog : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:37
      ConnectionTimeout : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:38
      DataRetries : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:39
      FinTimeout : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:40
      TimeWaitTimeout : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:41
      KeepAliveProbes : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:42
      KeepAliveTime : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:43
      KeepAliveInterval : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:44
      EnableNagle : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:45
      EnableTimeStamp : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:46
      EnableWindowScaling : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:47
      EnableSelectiveAck : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:48
      EnablePAthMtuDiscovery : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:49
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:50

  -- Receiving Filters
  -- I/O parameters
  -- Access Point
  -- TCP Control Options
   type EFI_TCP4_CONFIG_DATA is record
      TypeOfService : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efitcp.h:55
      TimeToLive : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efitcp.h:56
      AccessPoint : aliased EFI_TCP4_ACCESS_POINT;  -- ../../gnu-efi/inc/efitcp.h:59
      ControlOption : access EFI_TCP4_OPTION;  -- ../../gnu-efi/inc/efitcp.h:62
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:63

   type EFI_TCP4_CONNECTION_STATE is 
     (Tcp4StateClosed,
      Tcp4StateListen,
      Tcp4StateSynSent,
      Tcp4StateSynReceived,
      Tcp4StateEstablished,
      Tcp4StateFinWait1,
      Tcp4StateFinWait2,
      Tcp4StateClosing,
      Tcp4StateTimeWait,
      Tcp4StateCloseWait,
      Tcp4StateLastAck)
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:77

   type u_EFI_TCP4;
   type EFI_TCP4_GET_MODE_DATA is access function
        (arg1 : access u_EFI_TCP4;
         arg2 : access EFI_TCP4_CONNECTION_STATE;
         arg3 : access EFI_TCP4_CONFIG_DATA;
         arg4 : access efiip_h.EFI_IP4_MODE_DATA;
         arg5 : access efidef_h.EFI_MANAGED_NETWORK_CONFIG_DATA;
         arg6 : access efinet_h.EFI_SIMPLE_NETWORK_MODE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:81

   type EFI_TCP4_CONFIGURE is access function (arg1 : access u_EFI_TCP4; arg2 : access EFI_TCP4_CONFIG_DATA) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:92

   type EFI_TCP4_ROUTES is access function
        (arg1 : access u_EFI_TCP4;
         arg2 : efidef_h.BOOLEAN;
         arg3 : access efidef_h.EFI_IPv4_ADDRESS;
         arg4 : access efidef_h.EFI_IPv4_ADDRESS;
         arg5 : access efidef_h.EFI_IPv4_ADDRESS) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:99

   type EFI_TCP4_COMPLETION_TOKEN is record
      Event : efidef_h.EFI_EVENT;  -- ../../gnu-efi/inc/efitcp.h:108
      Status : aliased efidef_h.EFI_STATUS;  -- ../../gnu-efi/inc/efitcp.h:109
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:110

   type EFI_TCP4_CONNECTION_TOKEN is record
      CompletionToken : aliased EFI_TCP4_COMPLETION_TOKEN;  -- ../../gnu-efi/inc/efitcp.h:113
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:114

   type EFI_TCP4_CONNECT is access function (arg1 : access u_EFI_TCP4; arg2 : access EFI_TCP4_CONNECTION_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:118

   type EFI_TCP4_LISTEN_TOKEN is record
      CompletionToken : aliased EFI_TCP4_COMPLETION_TOKEN;  -- ../../gnu-efi/inc/efitcp.h:124
      NewChildHandle : efidef_h.EFI_HANDLE;  -- ../../gnu-efi/inc/efitcp.h:125
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:126

   type EFI_TCP4_ACCEPT is access function (arg1 : access u_EFI_TCP4; arg2 : access EFI_TCP4_LISTEN_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:130

   type EFI_TCP4_FRAGMENT_DATA is record
      FragmentLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:140
      FragmentBuffer : System.Address;  -- ../../gnu-efi/inc/efitcp.h:141
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:142

   type anon_array2941 is array (0 .. 0) of aliased EFI_TCP4_FRAGMENT_DATA;
   type EFI_TCP4_RECEIVE_DATA is record
      UrgentFlag : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:145
      DataLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:146
      FragmentCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:147
      FragmentTable : aliased anon_array2941;  -- ../../gnu-efi/inc/efitcp.h:148
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:149

   type EFI_TCP4_TRANSMIT_DATA is record
      Push : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:152
      Urgent : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:153
      DataLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:154
      FragmentCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:155
      FragmentTable : aliased anon_array2941;  -- ../../gnu-efi/inc/efitcp.h:156
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:157

   type anon_union2947 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            RxData : access EFI_TCP4_RECEIVE_DATA;  -- ../../gnu-efi/inc/efitcp.h:162
         when others =>
            TxData : access EFI_TCP4_TRANSMIT_DATA;  -- ../../gnu-efi/inc/efitcp.h:163
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type EFI_TCP4_IO_TOKEN is record
      CompletionToken : aliased EFI_TCP4_COMPLETION_TOKEN;  -- ../../gnu-efi/inc/efitcp.h:160
      Packet : aliased anon_union2947;  -- ../../gnu-efi/inc/efitcp.h:164
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:165

   type EFI_TCP4_TRANSMIT is access function (arg1 : access u_EFI_TCP4; arg2 : access EFI_TCP4_IO_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:169

   type EFI_TCP4_RECEIVE is access function (arg1 : access u_EFI_TCP4; arg2 : access EFI_TCP4_IO_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:176

   type EFI_TCP4_CLOSE_TOKEN is record
      CompletionToken : aliased EFI_TCP4_COMPLETION_TOKEN;  -- ../../gnu-efi/inc/efitcp.h:182
      AbortOnClose : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:183
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:184

   type EFI_TCP4_CLOSE is access function (arg1 : access u_EFI_TCP4; arg2 : access EFI_TCP4_CLOSE_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:188

   type EFI_TCP4_CANCEL is access function (arg1 : access u_EFI_TCP4; arg2 : access EFI_TCP4_COMPLETION_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:195

   type EFI_TCP4_POLL is access function (arg1 : access u_EFI_TCP4) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:202

   type u_EFI_TCP4 is record
      GetModeData : EFI_TCP4_GET_MODE_DATA;  -- ../../gnu-efi/inc/efitcp.h:207
      Configure : EFI_TCP4_CONFIGURE;  -- ../../gnu-efi/inc/efitcp.h:208
      Routes : EFI_TCP4_ROUTES;  -- ../../gnu-efi/inc/efitcp.h:209
      Connect : EFI_TCP4_CONNECT;  -- ../../gnu-efi/inc/efitcp.h:210
      c_Accept : EFI_TCP4_ACCEPT;  -- ../../gnu-efi/inc/efitcp.h:211
      Transmit : EFI_TCP4_TRANSMIT;  -- ../../gnu-efi/inc/efitcp.h:212
      Receive : EFI_TCP4_RECEIVE;  -- ../../gnu-efi/inc/efitcp.h:213
      Close : EFI_TCP4_CLOSE;  -- ../../gnu-efi/inc/efitcp.h:214
      Cancel : EFI_TCP4_CANCEL;  -- ../../gnu-efi/inc/efitcp.h:215
      Poll : EFI_TCP4_POLL;  -- ../../gnu-efi/inc/efitcp.h:216
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:206

   subtype EFI_TCP4 is u_EFI_TCP4;  -- ../../gnu-efi/inc/efitcp.h:217

   type EFI_TCP6_CONNECTION_STATE is 
     (Tcp6StateClosed,
      Tcp6StateListen,
      Tcp6StateSynSent,
      Tcp6StateSynReceived,
      Tcp6StateEstablished,
      Tcp6StateFinWait1,
      Tcp6StateFinWait2,
      Tcp6StateClosing,
      Tcp6StateTimeWait,
      Tcp6StateCloseWait,
      Tcp6StateLastAck)
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:231

   type EFI_TCP6_ACCESS_POINT is record
      StationAddress : aliased efidef_h.EFI_IPv6_ADDRESS;  -- ../../gnu-efi/inc/efitcp.h:234
      StationPort : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efitcp.h:235
      RemoteAddress : aliased efidef_h.EFI_IPv6_ADDRESS;  -- ../../gnu-efi/inc/efitcp.h:236
      RemotePort : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/efitcp.h:237
      ActiveFlag : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:238
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:239

   type EFI_TCP6_OPTION is record
      ReceiveBufferSize : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:242
      SendBufferSize : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:243
      MaxSynBackLog : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:244
      ConnectionTimeout : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:245
      DataRetries : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:246
      FinTimeout : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:247
      TimeWaitTimeout : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:248
      KeepAliveProbes : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:249
      KeepAliveTime : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:250
      KeepAliveInterval : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:251
      EnableNagle : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:252
      EnableTimeStamp : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:253
      EnableWindbowScaling : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:254
      EnableSelectiveAck : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:255
      EnablePathMtuDiscovery : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:256
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:257

   type EFI_TCP6_CONFIG_DATA is record
      TrafficClass : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efitcp.h:260
      HopLimit : aliased efibind_h.UINT8;  -- ../../gnu-efi/inc/efitcp.h:261
      AccessPoint : aliased EFI_TCP6_ACCESS_POINT;  -- ../../gnu-efi/inc/efitcp.h:262
      ControlOption : access EFI_TCP6_OPTION;  -- ../../gnu-efi/inc/efitcp.h:263
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:264

   type u_EFI_TCP6;
   type EFI_TCP6_GET_MODE_DATA is access function
        (arg1 : access u_EFI_TCP6;
         arg2 : access EFI_TCP6_CONNECTION_STATE;
         arg3 : access EFI_TCP6_CONFIG_DATA;
         arg4 : access efiip_h.EFI_IP6_MODE_DATA;
         arg5 : access efidef_h.EFI_MANAGED_NETWORK_CONFIG_DATA;
         arg6 : access efinet_h.EFI_SIMPLE_NETWORK_MODE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:268

   type EFI_TCP6_CONFIGURE is access function (arg1 : access u_EFI_TCP6; arg2 : access EFI_TCP6_CONFIG_DATA) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:279

   type EFI_TCP6_COMPLETION_TOKEN is record
      Event : efidef_h.EFI_EVENT;  -- ../../gnu-efi/inc/efitcp.h:285
      Status : aliased efidef_h.EFI_STATUS;  -- ../../gnu-efi/inc/efitcp.h:286
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:287

   type EFI_TCP6_CONNECTION_TOKEN is record
      CompletionToken : aliased EFI_TCP6_COMPLETION_TOKEN;  -- ../../gnu-efi/inc/efitcp.h:290
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:291

   type EFI_TCP6_CONNECT is access function (arg1 : access u_EFI_TCP6; arg2 : access EFI_TCP6_CONNECTION_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:295

   type EFI_TCP6_LISTEN_TOKEN is record
      CompletionToken : aliased EFI_TCP6_COMPLETION_TOKEN;  -- ../../gnu-efi/inc/efitcp.h:301
      NewChildHandle : efidef_h.EFI_HANDLE;  -- ../../gnu-efi/inc/efitcp.h:302
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:303

   type EFI_TCP6_ACCEPT is access function (arg1 : access u_EFI_TCP6; arg2 : access EFI_TCP6_LISTEN_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:307

   type EFI_TCP6_FRAGMENT_DATA is record
      FragmentLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:313
      FragmentBuffer : System.Address;  -- ../../gnu-efi/inc/efitcp.h:314
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:315

   type anon_array3031 is array (0 .. 0) of aliased EFI_TCP6_FRAGMENT_DATA;
   type EFI_TCP6_RECEIVE_DATA is record
      UrgentFlag : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:318
      DataLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:319
      FragmentCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:320
      FragmentTable : aliased anon_array3031;  -- ../../gnu-efi/inc/efitcp.h:321
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:322

   type EFI_TCP6_TRANSMIT_DATA is record
      Push : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:325
      Urgent : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:326
      DataLength : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:327
      FragmentCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efitcp.h:328
      FragmentTable : aliased anon_array3031;  -- ../../gnu-efi/inc/efitcp.h:329
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:330

   type anon_union3037 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            RxData : access EFI_TCP6_RECEIVE_DATA;  -- ../../gnu-efi/inc/efitcp.h:335
         when others =>
            TxData : access EFI_TCP6_TRANSMIT_DATA;  -- ../../gnu-efi/inc/efitcp.h:336
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;
   type EFI_TCP6_IO_TOKEN is record
      CompletionToken : aliased EFI_TCP6_COMPLETION_TOKEN;  -- ../../gnu-efi/inc/efitcp.h:333
      Packet : aliased anon_union3037;  -- ../../gnu-efi/inc/efitcp.h:337
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:338

   type EFI_TCP6_TRANSMIT is access function (arg1 : access u_EFI_TCP6; arg2 : access EFI_TCP6_IO_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:342

   type EFI_TCP6_RECEIVE is access function (arg1 : access u_EFI_TCP6; arg2 : access EFI_TCP6_IO_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:349

   type EFI_TCP6_CLOSE_TOKEN is record
      CompletionToken : aliased EFI_TCP6_COMPLETION_TOKEN;  -- ../../gnu-efi/inc/efitcp.h:355
      AbortOnClose : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efitcp.h:356
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:357

   type EFI_TCP6_CLOSE is access function (arg1 : access u_EFI_TCP6; arg2 : access EFI_TCP6_CLOSE_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:361

   type EFI_TCP6_CANCEL is access function (arg1 : access u_EFI_TCP6; arg2 : access EFI_TCP6_COMPLETION_TOKEN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:368

   type EFI_TCP6_POLL is access function (arg1 : access u_EFI_TCP6) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efitcp.h:375

   type u_EFI_TCP6 is record
      GetModeData : EFI_TCP6_GET_MODE_DATA;  -- ../../gnu-efi/inc/efitcp.h:380
      Configure : EFI_TCP6_CONFIGURE;  -- ../../gnu-efi/inc/efitcp.h:381
      Connect : EFI_TCP6_CONNECT;  -- ../../gnu-efi/inc/efitcp.h:382
      c_Accept : EFI_TCP6_ACCEPT;  -- ../../gnu-efi/inc/efitcp.h:383
      Transmit : EFI_TCP6_TRANSMIT;  -- ../../gnu-efi/inc/efitcp.h:384
      Receive : EFI_TCP6_RECEIVE;  -- ../../gnu-efi/inc/efitcp.h:385
      Close : EFI_TCP6_CLOSE;  -- ../../gnu-efi/inc/efitcp.h:386
      Cancel : EFI_TCP6_CANCEL;  -- ../../gnu-efi/inc/efitcp.h:387
      Poll : EFI_TCP6_POLL;  -- ../../gnu-efi/inc/efitcp.h:388
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efitcp.h:379

   subtype EFI_TCP6 is u_EFI_TCP6;  -- ../../gnu-efi/inc/efitcp.h:389

end efitcp_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
