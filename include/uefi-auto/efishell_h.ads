pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with System;
with efilink_h;
with efidef_h;
limited with efiprot_h;
with efibind_h;
limited with efidevp_h;
limited with efiapi_h;

package efishell_h is

   --  unsupported macro: EFI_SHELL_PROTOCOL_GUID { 0x6302d008, 0x7f9b, 0x4f30, { 0x87, 0xac, 0x60, 0xc9, 0xfe, 0xf5, 0xda, 0x4e } }
   EFI_DEVICE_NAME_USE_COMPONENT_NAME : constant := 16#00000001#;  --  ../../gnu-efi/inc/efishell.h:152
   EFI_DEVICE_NAME_USE_DEVICE_PATH : constant := 16#00000002#;  --  ../../gnu-efi/inc/efishell.h:153
   --  unsupported macro: EFI_SHELL_PARAMETERS_PROTOCOL_GUID { 0x752f3136, 0x4e16, 0x4fdc, { 0xa2, 0x2a, 0xe5, 0xf4, 0x68, 0x12, 0xf4, 0xca } }
   --  unsupported macro: EFI_SHELL_DYNAMIC_COMMAND_PROTOCOL_GUID { 0x3c7200e9, 0x005f, 0x4ea4, { 0x87, 0xde, 0xa3, 0xdf, 0xac, 0x8a, 0x27, 0xc3 } }

  --*
  --  EFI Shell protocol as defined in the UEFI Shell Specification 2.2.
  --  (C) Copyright 2014 Hewlett-Packard Development Company, L.P.<BR>
  --  Copyright (c) 2006 - 2018, Intel Corporation. All rights reserved.<BR>
  --  SPDX-License-Identifier: BSD-2-Clause-Patent
  --  This file is based on MdePkg/Include/Protocol/Shell.h from EDK2
  --  Ported to gnu-efi by Jiaqing Zhao <jiaqing.zhao@intel.com>
  --* 

   subtype SHELL_STATUS is unsigned;
   SHELL_STATUS_SHELL_SUCCESS : constant SHELL_STATUS := 0;
   SHELL_STATUS_SHELL_LOAD_ERROR : constant SHELL_STATUS := 1;
   SHELL_STATUS_SHELL_INVALID_PARAMETER : constant SHELL_STATUS := 2;
   SHELL_STATUS_SHELL_UNSUPPORTED : constant SHELL_STATUS := 3;
   SHELL_STATUS_SHELL_BAD_BUFFER_SIZE : constant SHELL_STATUS := 4;
   SHELL_STATUS_SHELL_BUFFER_TOO_SMALL : constant SHELL_STATUS := 5;
   SHELL_STATUS_SHELL_NOT_READY : constant SHELL_STATUS := 6;
   SHELL_STATUS_SHELL_DEVICE_ERROR : constant SHELL_STATUS := 7;
   SHELL_STATUS_SHELL_WRITE_PROTECTED : constant SHELL_STATUS := 8;
   SHELL_STATUS_SHELL_OUT_OF_RESOURCES : constant SHELL_STATUS := 9;
   SHELL_STATUS_SHELL_VOLUME_CORRUPTED : constant SHELL_STATUS := 10;
   SHELL_STATUS_SHELL_VOLUME_FULL : constant SHELL_STATUS := 11;
   SHELL_STATUS_SHELL_NO_MEDIA : constant SHELL_STATUS := 12;
   SHELL_STATUS_SHELL_MEDIA_CHANGED : constant SHELL_STATUS := 13;
   SHELL_STATUS_SHELL_NOT_FOUND : constant SHELL_STATUS := 14;
   SHELL_STATUS_SHELL_ACCESS_DENIED : constant SHELL_STATUS := 15;
   SHELL_STATUS_SHELL_TIMEOUT : constant SHELL_STATUS := 18;
   SHELL_STATUS_SHELL_NOT_STARTED : constant SHELL_STATUS := 19;
   SHELL_STATUS_SHELL_ALREADY_STARTED : constant SHELL_STATUS := 20;
   SHELL_STATUS_SHELL_ABORTED : constant SHELL_STATUS := 21;
   SHELL_STATUS_SHELL_INCOMPATIBLE_VERSION : constant SHELL_STATUS := 25;
   SHELL_STATUS_SHELL_SECURITY_VIOLATION : constant SHELL_STATUS := 26;
   SHELL_STATUS_SHELL_NOT_EQUAL : constant SHELL_STATUS := 27;  -- ../../gnu-efi/inc/efishell.h:46

   type SHELL_FILE_HANDLE is new System.Address;  -- ../../gnu-efi/inc/efishell.h:48

   type EFI_SHELL_FILE_INFO is record
      Link : aliased efilink_h.EFI_LIST_ENTRY;  -- ../../gnu-efi/inc/efishell.h:51
      Status : aliased efidef_h.EFI_STATUS;  -- ../../gnu-efi/inc/efishell.h:52
      FullName : access efidef_h.CHAR16;  -- ../../gnu-efi/inc/efishell.h:53
      FileName : access efidef_h.CHAR16;  -- ../../gnu-efi/inc/efishell.h:54
      Handle : SHELL_FILE_HANDLE;  -- ../../gnu-efi/inc/efishell.h:55
      Info : access efiprot_h.EFI_FILE_INFO;  -- ../../gnu-efi/inc/efishell.h:56
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efishell.h:57

   type EFI_SHELL_BATCH_IS_ACTIVE is access function return efidef_h.BOOLEAN
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:61

   type EFI_SHELL_CLOSE_FILE is access function (arg1 : SHELL_FILE_HANDLE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:67

   type EFI_SHELL_CREATE_FILE is access function
        (arg1 : access efidef_h.CHAR16;
         arg2 : efibind_h.UINT64;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:73

   type EFI_SHELL_DELETE_FILE is access function (arg1 : SHELL_FILE_HANDLE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:81

   type EFI_SHELL_DELETE_FILE_BY_NAME is access function (arg1 : access efidef_h.CHAR16) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:87

   type EFI_SHELL_DISABLE_PAGE_BREAK is access procedure
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:93

   type EFI_SHELL_ENABLE_PAGE_BREAK is access procedure
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:99

   type EFI_SHELL_EXECUTE is access function
        (arg1 : System.Address;
         arg2 : access efidef_h.CHAR16;
         arg3 : System.Address;
         arg4 : access efidef_h.EFI_STATUS) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:105

   type EFI_SHELL_FIND_FILES is access function (arg1 : access efidef_h.CHAR16; arg2 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:114

   type EFI_SHELL_FIND_FILES_IN_DIR is access function (arg1 : SHELL_FILE_HANDLE; arg2 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:121

   type EFI_SHELL_FLUSH_FILE is access function (arg1 : SHELL_FILE_HANDLE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:128

   type EFI_SHELL_FREE_FILE_LIST is access function (arg1 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:134

   type EFI_SHELL_GET_ALIAS is access function (arg1 : access efidef_h.CHAR16; arg2 : access efidef_h.BOOLEAN) return access efidef_h.CHAR16
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:140

   type EFI_SHELL_GET_CUR_DIR is access function (arg1 : access efidef_h.CHAR16) return access efidef_h.CHAR16
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:147

   subtype EFI_SHELL_DEVICE_NAME_FLAGS is efibind_h.UINT32;  -- ../../gnu-efi/inc/efishell.h:151

   type EFI_SHELL_GET_DEVICE_NAME is access function
        (arg1 : efidef_h.EFI_HANDLE;
         arg2 : EFI_SHELL_DEVICE_NAME_FLAGS;
         arg3 : access efidef_h.CHAR8;
         arg4 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:157

   type EFI_SHELL_GET_DEVICE_PATH_FROM_MAP is access function (arg1 : access efidef_h.CHAR16) return access constant efidevp_h.u_EFI_DEVICE_PATH_PROTOCOL
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:166

   type EFI_SHELL_GET_DEVICE_PATH_FROM_FILE_PATH is access function (arg1 : access efidef_h.CHAR16) return access efidevp_h.u_EFI_DEVICE_PATH_PROTOCOL
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:172

   type EFI_SHELL_GET_ENV is access function (arg1 : access efidef_h.CHAR16) return access efidef_h.CHAR16
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:178

   type EFI_SHELL_GET_ENV_EX is access function (arg1 : access efidef_h.CHAR16; arg2 : access efibind_h.UINT32) return access efidef_h.CHAR16
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:184

   type EFI_SHELL_GET_FILE_INFO is access function (arg1 : SHELL_FILE_HANDLE) return access efiprot_h.EFI_FILE_INFO
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:191

   type EFI_SHELL_GET_FILE_PATH_FROM_DEVICE_PATH is access function (arg1 : access constant efidevp_h.u_EFI_DEVICE_PATH_PROTOCOL) return access efidef_h.CHAR16
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:197

   type EFI_SHELL_GET_FILE_POSITION is access function (arg1 : SHELL_FILE_HANDLE; arg2 : access efibind_h.UINT64) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:203

   type EFI_SHELL_GET_FILE_SIZE is access function (arg1 : SHELL_FILE_HANDLE; arg2 : access efibind_h.UINT64) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:210

   type EFI_SHELL_GET_GUID_FROM_NAME is access function (arg1 : access efidef_h.CHAR16; arg2 : access efidef_h.EFI_GUID) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:217

   type EFI_SHELL_GET_GUID_NAME is access function (arg1 : access constant efidef_h.EFI_GUID; arg2 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:224

   type EFI_SHELL_GET_HELP_TEXT is access function
        (arg1 : access efidef_h.CHAR16;
         arg2 : access efidef_h.CHAR16;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:231

   type EFI_SHELL_GET_MAP_FROM_DEVICE_PATH is access function (arg1 : System.Address) return access efidef_h.CHAR16
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:239

   type EFI_SHELL_GET_PAGE_BREAK is access function return efidef_h.BOOLEAN
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:245

   type EFI_SHELL_IS_ROOT_SHELL is access function return efidef_h.BOOLEAN
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:251

   type EFI_SHELL_OPEN_FILE_BY_NAME is access function
        (arg1 : access efidef_h.CHAR16;
         arg2 : System.Address;
         arg3 : efibind_h.UINT64) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:257

   type EFI_SHELL_OPEN_FILE_LIST is access function
        (arg1 : access efidef_h.CHAR16;
         arg2 : efibind_h.UINT64;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:265

   type EFI_SHELL_OPEN_ROOT is access function (arg1 : access efidevp_h.u_EFI_DEVICE_PATH_PROTOCOL; arg2 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:273

   type EFI_SHELL_OPEN_ROOT_BY_HANDLE is access function (arg1 : efidef_h.EFI_HANDLE; arg2 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:280

   type EFI_SHELL_READ_FILE is access function
        (arg1 : SHELL_FILE_HANDLE;
         arg2 : access efibind_h.UINTN;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:287

   type EFI_SHELL_REGISTER_GUID_NAME is access function (arg1 : access constant efidef_h.EFI_GUID; arg2 : access efidef_h.CHAR16) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:295

   type EFI_SHELL_REMOVE_DUP_IN_FILE_LIST is access function (arg1 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:302

   type EFI_SHELL_SET_ALIAS is access function
        (arg1 : access efidef_h.CHAR16;
         arg2 : access efidef_h.CHAR16;
         arg3 : efidef_h.BOOLEAN;
         arg4 : efidef_h.BOOLEAN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:308

   type EFI_SHELL_SET_CUR_DIR is access function (arg1 : access efidef_h.CHAR16; arg2 : access efidef_h.CHAR16) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:317

   type EFI_SHELL_SET_ENV is access function
        (arg1 : access efidef_h.CHAR16;
         arg2 : access efidef_h.CHAR16;
         arg3 : efidef_h.BOOLEAN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:324

   type EFI_SHELL_SET_FILE_INFO is access function (arg1 : SHELL_FILE_HANDLE; arg2 : access constant efiprot_h.EFI_FILE_INFO) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:332

   type EFI_SHELL_SET_FILE_POSITION is access function (arg1 : SHELL_FILE_HANDLE; arg2 : efibind_h.UINT64) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:339

   type EFI_SHELL_SET_MAP is access function (arg1 : access constant efidevp_h.u_EFI_DEVICE_PATH_PROTOCOL; arg2 : access efidef_h.CHAR16) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:346

   type EFI_SHELL_WRITE_FILE is access function
        (arg1 : SHELL_FILE_HANDLE;
         arg2 : access efibind_h.UINTN;
         arg3 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:353

   type u_EFI_SHELL_PROTOCOL is record
      Execute : EFI_SHELL_EXECUTE;  -- ../../gnu-efi/inc/efishell.h:360
      GetEnv : EFI_SHELL_GET_ENV;  -- ../../gnu-efi/inc/efishell.h:361
      SetEnv : EFI_SHELL_SET_ENV;  -- ../../gnu-efi/inc/efishell.h:362
      GetAlias : EFI_SHELL_GET_ALIAS;  -- ../../gnu-efi/inc/efishell.h:363
      SetAlias : EFI_SHELL_SET_ALIAS;  -- ../../gnu-efi/inc/efishell.h:364
      GetHelpText : EFI_SHELL_GET_HELP_TEXT;  -- ../../gnu-efi/inc/efishell.h:365
      GetDevicePathFromMap : EFI_SHELL_GET_DEVICE_PATH_FROM_MAP;  -- ../../gnu-efi/inc/efishell.h:366
      GetMapFromDevicePath : EFI_SHELL_GET_MAP_FROM_DEVICE_PATH;  -- ../../gnu-efi/inc/efishell.h:367
      GetDevicePathFromFilePath : EFI_SHELL_GET_DEVICE_PATH_FROM_FILE_PATH;  -- ../../gnu-efi/inc/efishell.h:368
      GetFilePathFromDevicePath : EFI_SHELL_GET_FILE_PATH_FROM_DEVICE_PATH;  -- ../../gnu-efi/inc/efishell.h:369
      SetMap : EFI_SHELL_SET_MAP;  -- ../../gnu-efi/inc/efishell.h:370
      GetCurDir : EFI_SHELL_GET_CUR_DIR;  -- ../../gnu-efi/inc/efishell.h:371
      SetCurDir : EFI_SHELL_SET_CUR_DIR;  -- ../../gnu-efi/inc/efishell.h:372
      OpenFileList : EFI_SHELL_OPEN_FILE_LIST;  -- ../../gnu-efi/inc/efishell.h:373
      FreeFileList : EFI_SHELL_FREE_FILE_LIST;  -- ../../gnu-efi/inc/efishell.h:374
      RemoveDupInFileList : EFI_SHELL_REMOVE_DUP_IN_FILE_LIST;  -- ../../gnu-efi/inc/efishell.h:375
      BatchIsActive : EFI_SHELL_BATCH_IS_ACTIVE;  -- ../../gnu-efi/inc/efishell.h:376
      IsRootShell : EFI_SHELL_IS_ROOT_SHELL;  -- ../../gnu-efi/inc/efishell.h:377
      EnablePageBreak : EFI_SHELL_ENABLE_PAGE_BREAK;  -- ../../gnu-efi/inc/efishell.h:378
      DisablePageBreak : EFI_SHELL_DISABLE_PAGE_BREAK;  -- ../../gnu-efi/inc/efishell.h:379
      GetPageBreak : EFI_SHELL_GET_PAGE_BREAK;  -- ../../gnu-efi/inc/efishell.h:380
      GetDeviceName : EFI_SHELL_GET_DEVICE_NAME;  -- ../../gnu-efi/inc/efishell.h:381
      GetFileInfo : EFI_SHELL_GET_FILE_INFO;  -- ../../gnu-efi/inc/efishell.h:382
      SetFileInfo : EFI_SHELL_SET_FILE_INFO;  -- ../../gnu-efi/inc/efishell.h:383
      OpenFileByName : EFI_SHELL_OPEN_FILE_BY_NAME;  -- ../../gnu-efi/inc/efishell.h:384
      CloseFile : EFI_SHELL_CLOSE_FILE;  -- ../../gnu-efi/inc/efishell.h:385
      CreateFile : EFI_SHELL_CREATE_FILE;  -- ../../gnu-efi/inc/efishell.h:386
      ReadFile : EFI_SHELL_READ_FILE;  -- ../../gnu-efi/inc/efishell.h:387
      WriteFile : EFI_SHELL_WRITE_FILE;  -- ../../gnu-efi/inc/efishell.h:388
      DeleteFile : EFI_SHELL_DELETE_FILE;  -- ../../gnu-efi/inc/efishell.h:389
      DeleteFileByName : EFI_SHELL_DELETE_FILE_BY_NAME;  -- ../../gnu-efi/inc/efishell.h:390
      GetFilePosition : EFI_SHELL_GET_FILE_POSITION;  -- ../../gnu-efi/inc/efishell.h:391
      SetFilePosition : EFI_SHELL_SET_FILE_POSITION;  -- ../../gnu-efi/inc/efishell.h:392
      FlushFile : EFI_SHELL_FLUSH_FILE;  -- ../../gnu-efi/inc/efishell.h:393
      FindFiles : EFI_SHELL_FIND_FILES;  -- ../../gnu-efi/inc/efishell.h:394
      FindFilesInDir : EFI_SHELL_FIND_FILES_IN_DIR;  -- ../../gnu-efi/inc/efishell.h:395
      GetFileSize : EFI_SHELL_GET_FILE_SIZE;  -- ../../gnu-efi/inc/efishell.h:396
      OpenRoot : EFI_SHELL_OPEN_ROOT;  -- ../../gnu-efi/inc/efishell.h:397
      OpenRootByHandle : EFI_SHELL_OPEN_ROOT_BY_HANDLE;  -- ../../gnu-efi/inc/efishell.h:398
      ExecutionBreak : efidef_h.EFI_EVENT;  -- ../../gnu-efi/inc/efishell.h:399
      MajorVersion : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efishell.h:400
      MinorVersion : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efishell.h:401
      RegisterGuidName : EFI_SHELL_REGISTER_GUID_NAME;  -- ../../gnu-efi/inc/efishell.h:403
      GetGuidName : EFI_SHELL_GET_GUID_NAME;  -- ../../gnu-efi/inc/efishell.h:404
      GetGuidFromName : EFI_SHELL_GET_GUID_FROM_NAME;  -- ../../gnu-efi/inc/efishell.h:405
      GetEnvEx : EFI_SHELL_GET_ENV_EX;  -- ../../gnu-efi/inc/efishell.h:406
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efishell.h:359

  -- Added for Shell 2.1
   subtype EFI_SHELL_PROTOCOL is u_EFI_SHELL_PROTOCOL;  -- ../../gnu-efi/inc/efishell.h:407

   type u_EFI_SHELL_PARAMETERS_PROTOCOL is record
      Argv : System.Address;  -- ../../gnu-efi/inc/efishell.h:415
      Argc : aliased efibind_h.UINTN;  -- ../../gnu-efi/inc/efishell.h:416
      StdIn : SHELL_FILE_HANDLE;  -- ../../gnu-efi/inc/efishell.h:417
      StdOut : SHELL_FILE_HANDLE;  -- ../../gnu-efi/inc/efishell.h:418
      StdErr : SHELL_FILE_HANDLE;  -- ../../gnu-efi/inc/efishell.h:419
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efishell.h:414

   subtype EFI_SHELL_PARAMETERS_PROTOCOL is u_EFI_SHELL_PARAMETERS_PROTOCOL;  -- ../../gnu-efi/inc/efishell.h:420

   type u_EFI_SHELL_DYNAMIC_COMMAND_PROTOCOL;
   type SHELL_COMMAND_HANDLER is access function
        (arg1 : access u_EFI_SHELL_DYNAMIC_COMMAND_PROTOCOL;
         arg2 : access efiapi_h.u_EFI_SYSTEM_TABLE;
         arg3 : access EFI_SHELL_PARAMETERS_PROTOCOL;
         arg4 : access EFI_SHELL_PROTOCOL) return SHELL_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:429

   type SHELL_COMMAND_GETHELP is access function (arg1 : access u_EFI_SHELL_DYNAMIC_COMMAND_PROTOCOL; arg2 : access efidef_h.CHAR8) return access efidef_h.CHAR16
   with Convention => C;  -- ../../gnu-efi/inc/efishell.h:438

   type u_EFI_SHELL_DYNAMIC_COMMAND_PROTOCOL is record
      CommandName : access efidef_h.CHAR16;  -- ../../gnu-efi/inc/efishell.h:444
      Handler : SHELL_COMMAND_HANDLER;  -- ../../gnu-efi/inc/efishell.h:445
      GetHelp : SHELL_COMMAND_GETHELP;  -- ../../gnu-efi/inc/efishell.h:446
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efishell.h:443

   subtype EFI_SHELL_DYNAMIC_COMMAND_PROTOCOL is u_EFI_SHELL_DYNAMIC_COMMAND_PROTOCOL;  -- ../../gnu-efi/inc/efishell.h:447

end efishell_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
