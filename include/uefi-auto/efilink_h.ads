pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with efidef_h;
with efibind_h;

package efilink_h is

   --  arg-macro: procedure InitializeListHead (ListHead)
   --    (ListHead).Flink := ListHead; (ListHead).Blink := ListHead;
   --  arg-macro: function IsListEmpty (ListHead)
   --    return (ListHead).Flink = (ListHead);
   --  arg-macro: procedure RemoveEntryList (Entry)
   --    _RemoveEntryList(Entry);
   --  arg-macro: procedure InsertTailList (ListHead, Entry)
   --    { LIST_ENTRY *_ListHead, *_Blink; _ListHead := (ListHead); _Blink := _ListHead.Blink; (Entry).Flink := _ListHead; (Entry).Blink := _Blink; _Blink.Flink := (Entry); _ListHead.Blink := (Entry); }
   --  arg-macro: procedure InsertHeadList (ListHead, Entry)
   --    { LIST_ENTRY *_ListHead, *_Flink; _ListHead := (ListHead); _Flink := _ListHead.Flink; (Entry).Flink := _Flink; (Entry).Blink := _ListHead; _Flink.Blink := (Entry); _ListHead.Flink := (Entry); }
   --  arg-macro: procedure SwapListEntries (Entry1, Entry2)
   --    { LIST_ENTRY *Entry1Flink, *Entry1Blink; LIST_ENTRY *Entry2Flink, *Entry2Blink; Entry2Flink := (Entry2).Flink; Entry2Blink := (Entry2).Blink; Entry1Flink := (Entry1).Flink; Entry1Blink := (Entry1).Blink; Entry2Blink.Flink := Entry2Flink; Entry2Flink.Blink := Entry2Blink; (Entry2).Flink := Entry1; (Entry2).Blink := Entry1Blink; Entry1Blink.Flink := (Entry2); (Entry1).Blink := (Entry2); }
   --  arg-macro: function EFI_FIELD_OFFSET (TYPE, Field)
   --    return (UINTN)(intptr_t)(and(((TYPE *) 0).Field));
   --  unsupported macro: BASE_CR _CR
   --  arg-macro: procedure CR (Record, TYPE, Field, Signature)
   --    _CR(Record, TYPE, Field)
  --++
  --Copyright (c) 1998  Intel Corporation
  --Module Name:
  --    link.h (renamed efilink.h to avoid conflicts)
  --Abstract:
  --    EFI link list macro's
  --Revision History
  ---- 

  -- List entry - doubly linked list
   type u_LIST_ENTRY;
   type u_LIST_ENTRY is record
      Flink : access u_LIST_ENTRY;  -- ../../gnu-efi/inc/efilink.h:29
      Blink : access u_LIST_ENTRY;  -- ../../gnu-efi/inc/efilink.h:30
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efilink.h:28

   subtype LIST_ENTRY is u_LIST_ENTRY;  -- ../../gnu-efi/inc/efilink.h:31

   subtype EFI_LIST_ENTRY is u_LIST_ENTRY;  -- ../../gnu-efi/inc/efilink.h:31

  --  VOID
  --  InitializeListHead(
  --      LIST_ENTRY *ListHead
  --      );
  --  BOOLEAN
  --  IsListEmpty(
  --      PLIST_ENTRY ListHead
  --      );
  --  VOID
  --  RemoveEntryList(
  --      PLIST_ENTRY Entry
  --      );
  --  VOID
  --  InsertTailList(
  --      PLIST_ENTRY ListHead,
  --      PLIST_ENTRY Entry
  --      );
  --  VOID
  --  InsertHeadList(
  --      PLIST_ENTRY ListHead,
  --      PLIST_ENTRY Entry
  --      );
  --  VOID
  --  SwapListEntries(
  --      PLIST_ENTRY Entry1,
  --      PLIST_ENTRY Entry2
  --      );
  -- Put Entry2 before Entry1
  --  EFI_FIELD_OFFSET - returns the byte offset to a field within a structure
  --  CONTAINING_RECORD - returns a pointer to the structure
  --      from one of it's elements.
  -- EDK2 uses BASE_CR for the above
  -- A lock structure
   type u_FLOCK is record
      Tpl : aliased efidef_h.EFI_TPL;  -- ../../gnu-efi/inc/efilink.h:176
      OwnerTpl : aliased efidef_h.EFI_TPL;  -- ../../gnu-efi/inc/efilink.h:177
      Lock : aliased efibind_h.UINTN;  -- ../../gnu-efi/inc/efilink.h:178
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efilink.h:175

   subtype FLOCK is u_FLOCK;  -- ../../gnu-efi/inc/efilink.h:179

end efilink_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
