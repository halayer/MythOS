pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with efibind_h;
with eficon_h;
with efidef_h;
with System;

package eficonex_h is

   --  unsupported macro: EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL_GUID { 0xdd9e7534, 0x7762, 0x4698, {0x8c, 0x14, 0xf5, 0x85, 0x17, 0xa6, 0x25, 0xaa} }
   EFI_SHIFT_STATE_VALID : constant := 16#80000000#;  --  ../../gnu-efi/inc/eficonex.h:40
   EFI_RIGHT_SHIFT_PRESSED : constant := 16#00000001#;  --  ../../gnu-efi/inc/eficonex.h:41
   EFI_LEFT_SHIFT_PRESSED : constant := 16#00000002#;  --  ../../gnu-efi/inc/eficonex.h:42
   EFI_RIGHT_CONTROL_PRESSED : constant := 16#00000004#;  --  ../../gnu-efi/inc/eficonex.h:43
   EFI_LEFT_CONTROL_PRESSED : constant := 16#00000008#;  --  ../../gnu-efi/inc/eficonex.h:44
   EFI_RIGHT_ALT_PRESSED : constant := 16#00000010#;  --  ../../gnu-efi/inc/eficonex.h:45
   EFI_LEFT_ALT_PRESSED : constant := 16#00000020#;  --  ../../gnu-efi/inc/eficonex.h:46
   EFI_RIGHT_LOGO_PRESSED : constant := 16#00000040#;  --  ../../gnu-efi/inc/eficonex.h:47
   EFI_LEFT_LOGO_PRESSED : constant := 16#00000080#;  --  ../../gnu-efi/inc/eficonex.h:48
   EFI_MENU_KEY_PRESSED : constant := 16#00000100#;  --  ../../gnu-efi/inc/eficonex.h:49
   EFI_SYS_REQ_PRESSED : constant := 16#00000200#;  --  ../../gnu-efi/inc/eficonex.h:50

   EFI_TOGGLE_STATE_VALID : constant := 16#80#;  --  ../../gnu-efi/inc/eficonex.h:53
   EFI_KEY_STATE_EXPOSED : constant := 16#40#;  --  ../../gnu-efi/inc/eficonex.h:54
   EFI_SCROLL_LOCK_ACTIVE : constant := 16#01#;  --  ../../gnu-efi/inc/eficonex.h:55
   EFI_NUM_LOCK_ACTIVE : constant := 16#02#;  --  ../../gnu-efi/inc/eficonex.h:56
   EFI_CAPS_LOCK_ACTIVE : constant := 16#04#;  --  ../../gnu-efi/inc/eficonex.h:57

  --++
  --Copyright (c) 2020 Kagurazaka Kotori <kagurazakakotori@gmail.com>
  --Module Name:
  --    eficonex.h
  --Abstract:
  --    EFI console extension protocols
  ---- 

  -- Simple Text Input Ex Protocol
   subtype EFI_KEY_TOGGLE_STATE is efibind_h.UINT8;  -- ../../gnu-efi/inc/eficonex.h:27

   type EFI_KEY_STATE is record
      KeyShiftState : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/eficonex.h:30
      KeyToggleState : aliased EFI_KEY_TOGGLE_STATE;  -- ../../gnu-efi/inc/eficonex.h:31
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/eficonex.h:29

   type EFI_KEY_DATA is record
      Key : aliased eficon_h.EFI_INPUT_KEY;  -- ../../gnu-efi/inc/eficonex.h:35
      KeyState : aliased EFI_KEY_STATE;  -- ../../gnu-efi/inc/eficonex.h:36
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/eficonex.h:37

  -- Shift states
  -- Toggle states
   type u_EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;
   type EFI_INPUT_RESET_EX is access function (arg1 : access u_EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL; arg2 : efidef_h.BOOLEAN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/eficonex.h:61

   type EFI_INPUT_READ_KEY_EX is access function (arg1 : access u_EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL; arg2 : access EFI_KEY_DATA) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/eficonex.h:68

   type EFI_SET_STATE is access function (arg1 : access u_EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL; arg2 : access EFI_KEY_TOGGLE_STATE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/eficonex.h:75

   type EFI_KEY_NOTIFY_FUNCTION is access function (arg1 : access EFI_KEY_DATA) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/eficonex.h:82

   type EFI_REGISTER_KEYSTROKE_NOTIFY is access function
        (arg1 : access u_EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;
         arg2 : access EFI_KEY_DATA;
         arg3 : EFI_KEY_NOTIFY_FUNCTION;
         arg4 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/eficonex.h:88

   type EFI_UNREGISTER_KEYSTROKE_NOTIFY is access function (arg1 : access u_EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL; arg2 : System.Address) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/eficonex.h:97

   type u_EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL is record
      Reset : EFI_INPUT_RESET_EX;  -- ../../gnu-efi/inc/eficonex.h:103
      ReadKeyStrokeEx : EFI_INPUT_READ_KEY_EX;  -- ../../gnu-efi/inc/eficonex.h:104
      WaitForKeyEx : efidef_h.EFI_EVENT;  -- ../../gnu-efi/inc/eficonex.h:105
      SetState : EFI_SET_STATE;  -- ../../gnu-efi/inc/eficonex.h:106
      RegisterKeyNotify : EFI_REGISTER_KEYSTROKE_NOTIFY;  -- ../../gnu-efi/inc/eficonex.h:107
      UnregisterKeyNotify : EFI_UNREGISTER_KEYSTROKE_NOTIFY;  -- ../../gnu-efi/inc/eficonex.h:108
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/eficonex.h:102

   subtype EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL is u_EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL;  -- ../../gnu-efi/inc/eficonex.h:109

end eficonex_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
