pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with efiapi_h;
with efibind_h;
with efidef_h;

package efifs_h is

   EFI_PARTITION_SIGNATURE : constant := 16#5053595320494249#;  --  ../../gnu-efi/inc/efifs.h:27
   EFI_PARTITION_REVISION : constant := 16#00010001#;  --  ../../gnu-efi/inc/efifs.h:28
   MIN_EFI_PARTITION_BLOCK_SIZE : constant := 512;  --  ../../gnu-efi/inc/efifs.h:29
   EFI_PARTITION_LBA : constant := 1;  --  ../../gnu-efi/inc/efifs.h:30

   EFI_FILE_HEADER_SIGNATURE : constant := 16#454c494620494249#;  --  ../../gnu-efi/inc/efifs.h:49
   EFI_FILE_HEADER_REVISION : constant := 16#00010000#;  --  ../../gnu-efi/inc/efifs.h:50
   EFI_FILE_STRING_SIZE : constant := 260;  --  ../../gnu-efi/inc/efifs.h:51
   --  arg-macro: function EFI_FILE_LBAL (a)
   --    return (EFI_LBAL *) (((CHAR8 *) (a)) + (a).LBALOffset);

   EFI_FILE_CLASS_FREE_SPACE : constant := 1;  --  ../../gnu-efi/inc/efifs.h:74
   EFI_FILE_CLASS_EMPTY : constant := 2;  --  ../../gnu-efi/inc/efifs.h:75
   EFI_FILE_CLASS_NORMAL : constant := 3;  --  ../../gnu-efi/inc/efifs.h:76

   EFI_LBAL_SIGNATURE : constant := 16#4c41424c20494249#;  --  ../../gnu-efi/inc/efifs.h:84
   EFI_LBAL_REVISION : constant := 16#00010000#;  --  ../../gnu-efi/inc/efifs.h:85
   --  arg-macro: function EFI_LBAL_ARRAY_SIZE (lbal, offs, blks)
   --    return ((blks) - (offs) - (lbal).Hdr.HeaderSize) / sizeof(EFI_RL);
   --  arg-macro: function EFI_LBAL_RL (a)
   --    return (EFI_RL*) (((CHAR8 *) (a)) + (a).Hdr.HeaderSize);

  --++
  --Copyright (c) 1998  Intel Corporation
  --Module Name:
  --    efifs.h
  --Abstract:
  --    EFI File System structures
  --Revision History
  ---- 

  -- EFI Partition header (normaly starts in LBA 1)
   type u_EFI_PARTITION_HEADER is record
      Hdr : aliased efiapi_h.EFI_TABLE_HEADER;  -- ../../gnu-efi/inc/efifs.h:33
      DirectoryAllocationNumber : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efifs.h:34
      BlockSize : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efifs.h:35
      FirstUsableLba : aliased efidef_h.EFI_LBA;  -- ../../gnu-efi/inc/efifs.h:36
      LastUsableLba : aliased efidef_h.EFI_LBA;  -- ../../gnu-efi/inc/efifs.h:37
      UnusableSpace : aliased efidef_h.EFI_LBA;  -- ../../gnu-efi/inc/efifs.h:38
      FreeSpace : aliased efidef_h.EFI_LBA;  -- ../../gnu-efi/inc/efifs.h:39
      RootFile : aliased efidef_h.EFI_LBA;  -- ../../gnu-efi/inc/efifs.h:40
      SecutiryFile : aliased efidef_h.EFI_LBA;  -- ../../gnu-efi/inc/efifs.h:41
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efifs.h:32

   subtype EFI_PARTITION_HEADER is u_EFI_PARTITION_HEADER;  -- ../../gnu-efi/inc/efifs.h:42

  -- File header
   type anon_array2573 is array (0 .. 259) of aliased efidef_h.CHAR16;
   type u_EFI_FILE_HEADER is record
      Hdr : aliased efiapi_h.EFI_TABLE_HEADER;  -- ../../gnu-efi/inc/efifs.h:54
      Class : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efifs.h:55
      LBALOffset : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efifs.h:56
      Parent : aliased efidef_h.EFI_LBA;  -- ../../gnu-efi/inc/efifs.h:57
      FileSize : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efifs.h:58
      FileAttributes : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efifs.h:59
      FileCreateTime : aliased efidef_h.EFI_TIME;  -- ../../gnu-efi/inc/efifs.h:60
      FileModificationTime : aliased efidef_h.EFI_TIME;  -- ../../gnu-efi/inc/efifs.h:61
      VendorGuid : aliased efidef_h.EFI_GUID;  -- ../../gnu-efi/inc/efifs.h:62
      FileString : aliased anon_array2573;  -- ../../gnu-efi/inc/efifs.h:63
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efifs.h:53

   subtype EFI_FILE_HEADER is u_EFI_FILE_HEADER;  -- ../../gnu-efi/inc/efifs.h:64

  -- Return the file's first LBAL which is in the same
  -- logical block as the file header
  -- Logical Block Address List - the fundemental block
  -- description structure
   type u_EFI_LBAL is record
      Hdr : aliased efiapi_h.EFI_TABLE_HEADER;  -- ../../gnu-efi/inc/efifs.h:88
      Class : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efifs.h:89
      Parent : aliased efidef_h.EFI_LBA;  -- ../../gnu-efi/inc/efifs.h:90
      Next : aliased efidef_h.EFI_LBA;  -- ../../gnu-efi/inc/efifs.h:91
      ArraySize : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efifs.h:92
      ArrayCount : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efifs.h:93
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efifs.h:87

   subtype EFI_LBAL is u_EFI_LBAL;  -- ../../gnu-efi/inc/efifs.h:94

  -- Array size 
  -- Logical Block run-length
   type EFI_RL is record
      Start : aliased efidef_h.EFI_LBA;  -- ../../gnu-efi/inc/efifs.h:105
      Length : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efifs.h:106
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efifs.h:107

  -- Return the run-length structure from an LBAL header
end efifs_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
