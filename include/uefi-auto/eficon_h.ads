pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with efidef_h;
with efibind_h;

package eficon_h is

   --  unsupported macro: EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL_GUID { 0x387477c2, 0x69c7, 0x11d2, {0x8e, 0x39, 0x0, 0xa0, 0xc9, 0x69, 0x72, 0x3b} }
   --  unsupported macro: SIMPLE_TEXT_OUTPUT_PROTOCOL EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL_GUID
   EFI_BLACK : constant := 16#00#;  --  ../../gnu-efi/inc/eficon.h:76
   EFI_BLUE : constant := 16#01#;  --  ../../gnu-efi/inc/eficon.h:77
   EFI_GREEN : constant := 16#02#;  --  ../../gnu-efi/inc/eficon.h:78
   --  unsupported macro: EFI_CYAN (EFI_BLUE | EFI_GREEN)

   EFI_RED : constant := 16#04#;  --  ../../gnu-efi/inc/eficon.h:80
   --  unsupported macro: EFI_MAGENTA (EFI_BLUE | EFI_RED)
   --  unsupported macro: EFI_BROWN (EFI_GREEN | EFI_RED)
   --  unsupported macro: EFI_LIGHTGRAY (EFI_BLUE | EFI_GREEN | EFI_RED)

   EFI_BRIGHT : constant := 16#08#;  --  ../../gnu-efi/inc/eficon.h:84
   --  unsupported macro: EFI_DARKGRAY (EFI_BRIGHT)
   --  unsupported macro: EFI_LIGHTBLUE (EFI_BLUE | EFI_BRIGHT)
   --  unsupported macro: EFI_LIGHTGREEN (EFI_GREEN | EFI_BRIGHT)
   --  unsupported macro: EFI_LIGHTCYAN (EFI_CYAN | EFI_BRIGHT)
   --  unsupported macro: EFI_LIGHTRED (EFI_RED | EFI_BRIGHT)
   --  unsupported macro: EFI_LIGHTMAGENTA (EFI_MAGENTA | EFI_BRIGHT)
   --  unsupported macro: EFI_YELLOW (EFI_BROWN | EFI_BRIGHT)
   --  unsupported macro: EFI_WHITE (EFI_BLUE | EFI_GREEN | EFI_RED | EFI_BRIGHT)
   --  arg-macro: function EFI_TEXT_ATTR (f, b)
   --    return (f) or ((b) << 4);

   EFI_BACKGROUND_BLACK : constant := 16#00#;  --  ../../gnu-efi/inc/eficon.h:96
   EFI_BACKGROUND_BLUE : constant := 16#10#;  --  ../../gnu-efi/inc/eficon.h:97
   EFI_BACKGROUND_GREEN : constant := 16#20#;  --  ../../gnu-efi/inc/eficon.h:98
   --  unsupported macro: EFI_BACKGROUND_CYAN (EFI_BACKGROUND_BLUE | EFI_BACKGROUND_GREEN)

   EFI_BACKGROUND_RED : constant := 16#40#;  --  ../../gnu-efi/inc/eficon.h:100
   --  unsupported macro: EFI_BACKGROUND_MAGENTA (EFI_BACKGROUND_BLUE | EFI_BACKGROUND_RED)
   --  unsupported macro: EFI_BACKGROUND_BROWN (EFI_BACKGROUND_GREEN | EFI_BACKGROUND_RED)
   --  unsupported macro: EFI_BACKGROUND_LIGHTGRAY (EFI_BACKGROUND_BLUE | EFI_BACKGROUND_GREEN | EFI_BACKGROUND_RED)

   BOXDRAW_HORIZONTAL : constant := 16#2500#;  --  ../../gnu-efi/inc/eficon.h:159
   BOXDRAW_VERTICAL : constant := 16#2502#;  --  ../../gnu-efi/inc/eficon.h:160
   BOXDRAW_DOWN_RIGHT : constant := 16#250c#;  --  ../../gnu-efi/inc/eficon.h:161
   BOXDRAW_DOWN_LEFT : constant := 16#2510#;  --  ../../gnu-efi/inc/eficon.h:162
   BOXDRAW_UP_RIGHT : constant := 16#2514#;  --  ../../gnu-efi/inc/eficon.h:163
   BOXDRAW_UP_LEFT : constant := 16#2518#;  --  ../../gnu-efi/inc/eficon.h:164
   BOXDRAW_VERTICAL_RIGHT : constant := 16#251c#;  --  ../../gnu-efi/inc/eficon.h:165
   BOXDRAW_VERTICAL_LEFT : constant := 16#2524#;  --  ../../gnu-efi/inc/eficon.h:166
   BOXDRAW_DOWN_HORIZONTAL : constant := 16#252c#;  --  ../../gnu-efi/inc/eficon.h:167
   BOXDRAW_UP_HORIZONTAL : constant := 16#2534#;  --  ../../gnu-efi/inc/eficon.h:168
   BOXDRAW_VERTICAL_HORIZONTAL : constant := 16#253c#;  --  ../../gnu-efi/inc/eficon.h:169

   BOXDRAW_DOUBLE_HORIZONTAL : constant := 16#2550#;  --  ../../gnu-efi/inc/eficon.h:171
   BOXDRAW_DOUBLE_VERTICAL : constant := 16#2551#;  --  ../../gnu-efi/inc/eficon.h:172
   BOXDRAW_DOWN_RIGHT_DOUBLE : constant := 16#2552#;  --  ../../gnu-efi/inc/eficon.h:173
   BOXDRAW_DOWN_DOUBLE_RIGHT : constant := 16#2553#;  --  ../../gnu-efi/inc/eficon.h:174
   BOXDRAW_DOUBLE_DOWN_RIGHT : constant := 16#2554#;  --  ../../gnu-efi/inc/eficon.h:175

   BOXDRAW_DOWN_LEFT_DOUBLE : constant := 16#2555#;  --  ../../gnu-efi/inc/eficon.h:177
   BOXDRAW_DOWN_DOUBLE_LEFT : constant := 16#2556#;  --  ../../gnu-efi/inc/eficon.h:178
   BOXDRAW_DOUBLE_DOWN_LEFT : constant := 16#2557#;  --  ../../gnu-efi/inc/eficon.h:179

   BOXDRAW_UP_RIGHT_DOUBLE : constant := 16#2558#;  --  ../../gnu-efi/inc/eficon.h:181
   BOXDRAW_UP_DOUBLE_RIGHT : constant := 16#2559#;  --  ../../gnu-efi/inc/eficon.h:182
   BOXDRAW_DOUBLE_UP_RIGHT : constant := 16#255a#;  --  ../../gnu-efi/inc/eficon.h:183

   BOXDRAW_UP_LEFT_DOUBLE : constant := 16#255b#;  --  ../../gnu-efi/inc/eficon.h:185
   BOXDRAW_UP_DOUBLE_LEFT : constant := 16#255c#;  --  ../../gnu-efi/inc/eficon.h:186
   BOXDRAW_DOUBLE_UP_LEFT : constant := 16#255d#;  --  ../../gnu-efi/inc/eficon.h:187

   BOXDRAW_VERTICAL_RIGHT_DOUBLE : constant := 16#255e#;  --  ../../gnu-efi/inc/eficon.h:189
   BOXDRAW_VERTICAL_DOUBLE_RIGHT : constant := 16#255f#;  --  ../../gnu-efi/inc/eficon.h:190
   BOXDRAW_DOUBLE_VERTICAL_RIGHT : constant := 16#2560#;  --  ../../gnu-efi/inc/eficon.h:191

   BOXDRAW_VERTICAL_LEFT_DOUBLE : constant := 16#2561#;  --  ../../gnu-efi/inc/eficon.h:193
   BOXDRAW_VERTICAL_DOUBLE_LEFT : constant := 16#2562#;  --  ../../gnu-efi/inc/eficon.h:194
   BOXDRAW_DOUBLE_VERTICAL_LEFT : constant := 16#2563#;  --  ../../gnu-efi/inc/eficon.h:195

   BOXDRAW_DOWN_HORIZONTAL_DOUBLE : constant := 16#2564#;  --  ../../gnu-efi/inc/eficon.h:197
   BOXDRAW_DOWN_DOUBLE_HORIZONTAL : constant := 16#2565#;  --  ../../gnu-efi/inc/eficon.h:198
   BOXDRAW_DOUBLE_DOWN_HORIZONTAL : constant := 16#2566#;  --  ../../gnu-efi/inc/eficon.h:199

   BOXDRAW_UP_HORIZONTAL_DOUBLE : constant := 16#2567#;  --  ../../gnu-efi/inc/eficon.h:201
   BOXDRAW_UP_DOUBLE_HORIZONTAL : constant := 16#2568#;  --  ../../gnu-efi/inc/eficon.h:202
   BOXDRAW_DOUBLE_UP_HORIZONTAL : constant := 16#2569#;  --  ../../gnu-efi/inc/eficon.h:203

   BOXDRAW_VERTICAL_HORIZONTAL_DOUBLE : constant := 16#256a#;  --  ../../gnu-efi/inc/eficon.h:205
   BOXDRAW_VERTICAL_DOUBLE_HORIZONTAL : constant := 16#256b#;  --  ../../gnu-efi/inc/eficon.h:206
   BOXDRAW_DOUBLE_VERTICAL_HORIZONTAL : constant := 16#256c#;  --  ../../gnu-efi/inc/eficon.h:207

   BLOCKELEMENT_FULL_BLOCK : constant := 16#2588#;  --  ../../gnu-efi/inc/eficon.h:213
   BLOCKELEMENT_LIGHT_SHADE : constant := 16#2591#;  --  ../../gnu-efi/inc/eficon.h:214

   GEOMETRICSHAPE_UP_TRIANGLE : constant := 16#25b2#;  --  ../../gnu-efi/inc/eficon.h:219
   GEOMETRICSHAPE_RIGHT_TRIANGLE : constant := 16#25ba#;  --  ../../gnu-efi/inc/eficon.h:220
   GEOMETRICSHAPE_DOWN_TRIANGLE : constant := 16#25bc#;  --  ../../gnu-efi/inc/eficon.h:221
   GEOMETRICSHAPE_LEFT_TRIANGLE : constant := 16#25c4#;  --  ../../gnu-efi/inc/eficon.h:222

   ARROW_UP : constant := 16#2191#;  --  ../../gnu-efi/inc/eficon.h:228
   ARROW_DOWN : constant := 16#2193#;  --  ../../gnu-efi/inc/eficon.h:229
   --  unsupported macro: EFI_SIMPLE_TEXT_INPUT_PROTOCOL_GUID { 0x387477c1, 0x69c7, 0x11d2, {0x8e, 0x39, 0x0, 0xa0, 0xc9, 0x69, 0x72, 0x3b} }
   --  unsupported macro: SIMPLE_TEXT_INPUT_PROTOCOL EFI_SIMPLE_TEXT_INPUT_PROTOCOL_GUID

   CHAR_NULL : constant := 16#0000#;  --  ../../gnu-efi/inc/eficon.h:250
   CHAR_BACKSPACE : constant := 16#0008#;  --  ../../gnu-efi/inc/eficon.h:251
   CHAR_TAB : constant := 16#0009#;  --  ../../gnu-efi/inc/eficon.h:252
   CHAR_LINEFEED : constant := 16#000A#;  --  ../../gnu-efi/inc/eficon.h:253
   CHAR_CARRIAGE_RETURN : constant := 16#000D#;  --  ../../gnu-efi/inc/eficon.h:254

   SCAN_NULL : constant := 16#0000#;  --  ../../gnu-efi/inc/eficon.h:260
   SCAN_UP : constant := 16#0001#;  --  ../../gnu-efi/inc/eficon.h:261
   SCAN_DOWN : constant := 16#0002#;  --  ../../gnu-efi/inc/eficon.h:262
   SCAN_RIGHT : constant := 16#0003#;  --  ../../gnu-efi/inc/eficon.h:263
   SCAN_LEFT : constant := 16#0004#;  --  ../../gnu-efi/inc/eficon.h:264
   SCAN_HOME : constant := 16#0005#;  --  ../../gnu-efi/inc/eficon.h:265
   SCAN_END : constant := 16#0006#;  --  ../../gnu-efi/inc/eficon.h:266
   SCAN_INSERT : constant := 16#0007#;  --  ../../gnu-efi/inc/eficon.h:267
   SCAN_DELETE : constant := 16#0008#;  --  ../../gnu-efi/inc/eficon.h:268
   SCAN_PAGE_UP : constant := 16#0009#;  --  ../../gnu-efi/inc/eficon.h:269
   SCAN_PAGE_DOWN : constant := 16#000A#;  --  ../../gnu-efi/inc/eficon.h:270
   SCAN_F1 : constant := 16#000B#;  --  ../../gnu-efi/inc/eficon.h:271
   SCAN_F2 : constant := 16#000C#;  --  ../../gnu-efi/inc/eficon.h:272
   SCAN_F3 : constant := 16#000D#;  --  ../../gnu-efi/inc/eficon.h:273
   SCAN_F4 : constant := 16#000E#;  --  ../../gnu-efi/inc/eficon.h:274
   SCAN_F5 : constant := 16#000F#;  --  ../../gnu-efi/inc/eficon.h:275
   SCAN_F6 : constant := 16#0010#;  --  ../../gnu-efi/inc/eficon.h:276
   SCAN_F7 : constant := 16#0011#;  --  ../../gnu-efi/inc/eficon.h:277
   SCAN_F8 : constant := 16#0012#;  --  ../../gnu-efi/inc/eficon.h:278
   SCAN_F9 : constant := 16#0013#;  --  ../../gnu-efi/inc/eficon.h:279
   SCAN_F10 : constant := 16#0014#;  --  ../../gnu-efi/inc/eficon.h:280
   SCAN_F11 : constant := 16#0015#;  --  ../../gnu-efi/inc/eficon.h:281
   SCAN_F12 : constant := 16#0016#;  --  ../../gnu-efi/inc/eficon.h:282
   SCAN_ESC : constant := 16#0017#;  --  ../../gnu-efi/inc/eficon.h:283

  --++
  --Copyright (c) 1998  Intel Corporation
  --Module Name:
  --    eficon.h
  --Abstract:
  --    EFI console protocols
  --Revision History
  ---- 

  -- Text output protocol
   type u_SIMPLE_TEXT_OUTPUT_INTERFACE;
   type EFI_TEXT_RESET is access function (arg1 : access u_SIMPLE_TEXT_OUTPUT_INTERFACE; arg2 : efidef_h.BOOLEAN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/eficon.h:34

   type EFI_TEXT_OUTPUT_STRING is access function (arg1 : access u_SIMPLE_TEXT_OUTPUT_INTERFACE; arg2 : access efidef_h.CHAR16) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/eficon.h:41

   type EFI_TEXT_TEST_STRING is access function (arg1 : access u_SIMPLE_TEXT_OUTPUT_INTERFACE; arg2 : access efidef_h.CHAR16) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/eficon.h:48

   type EFI_TEXT_QUERY_MODE is access function
        (arg1 : access u_SIMPLE_TEXT_OUTPUT_INTERFACE;
         arg2 : efibind_h.UINTN;
         arg3 : access efibind_h.UINTN;
         arg4 : access efibind_h.UINTN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/eficon.h:55

   type EFI_TEXT_SET_MODE is access function (arg1 : access u_SIMPLE_TEXT_OUTPUT_INTERFACE; arg2 : efibind_h.UINTN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/eficon.h:64

   type EFI_TEXT_SET_ATTRIBUTE is access function (arg1 : access u_SIMPLE_TEXT_OUTPUT_INTERFACE; arg2 : efibind_h.UINTN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/eficon.h:71

   type EFI_TEXT_CLEAR_SCREEN is access function (arg1 : access u_SIMPLE_TEXT_OUTPUT_INTERFACE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/eficon.h:108

   type EFI_TEXT_SET_CURSOR_POSITION is access function
        (arg1 : access u_SIMPLE_TEXT_OUTPUT_INTERFACE;
         arg2 : efibind_h.UINTN;
         arg3 : efibind_h.UINTN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/eficon.h:114

   type EFI_TEXT_ENABLE_CURSOR is access function (arg1 : access u_SIMPLE_TEXT_OUTPUT_INTERFACE; arg2 : efidef_h.BOOLEAN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/eficon.h:122

  -- current settings
   type SIMPLE_TEXT_OUTPUT_MODE is record
      MaxMode : aliased efibind_h.INT32;  -- ../../gnu-efi/inc/eficon.h:128
      Mode : aliased efibind_h.INT32;  -- ../../gnu-efi/inc/eficon.h:130
      Attribute : aliased efibind_h.INT32;  -- ../../gnu-efi/inc/eficon.h:131
      CursorColumn : aliased efibind_h.INT32;  -- ../../gnu-efi/inc/eficon.h:132
      CursorRow : aliased efibind_h.INT32;  -- ../../gnu-efi/inc/eficon.h:133
      CursorVisible : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/eficon.h:134
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/eficon.h:135

   type u_SIMPLE_TEXT_OUTPUT_INTERFACE is record
      Reset : EFI_TEXT_RESET;  -- ../../gnu-efi/inc/eficon.h:138
      OutputString : EFI_TEXT_OUTPUT_STRING;  -- ../../gnu-efi/inc/eficon.h:140
      TestString : EFI_TEXT_TEST_STRING;  -- ../../gnu-efi/inc/eficon.h:141
      QueryMode : EFI_TEXT_QUERY_MODE;  -- ../../gnu-efi/inc/eficon.h:143
      SetMode : EFI_TEXT_SET_MODE;  -- ../../gnu-efi/inc/eficon.h:144
      SetAttribute : EFI_TEXT_SET_ATTRIBUTE;  -- ../../gnu-efi/inc/eficon.h:145
      ClearScreen : EFI_TEXT_CLEAR_SCREEN;  -- ../../gnu-efi/inc/eficon.h:147
      SetCursorPosition : EFI_TEXT_SET_CURSOR_POSITION;  -- ../../gnu-efi/inc/eficon.h:148
      EnableCursor : EFI_TEXT_ENABLE_CURSOR;  -- ../../gnu-efi/inc/eficon.h:149
      Mode : access SIMPLE_TEXT_OUTPUT_MODE;  -- ../../gnu-efi/inc/eficon.h:152
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/eficon.h:137

  -- Current mode
   subtype SIMPLE_TEXT_OUTPUT_INTERFACE is u_SIMPLE_TEXT_OUTPUT_INTERFACE;  -- ../../gnu-efi/inc/eficon.h:153

   subtype EFI_SIMPLE_TEXT_OUT_PROTOCOL is u_SIMPLE_TEXT_OUTPUT_INTERFACE;  -- ../../gnu-efi/inc/eficon.h:153

  -- Define's for required EFI Unicode Box Draw character
  -- EFI Required Block Elements Code Chart
  -- EFI Required Geometric Shapes Code Chart
  -- EFI Required Arrow shapes
  -- Text input protocol
   type EFI_INPUT_KEY is record
      ScanCode : aliased efibind_h.UINT16;  -- ../../gnu-efi/inc/eficon.h:242
      UnicodeChar : aliased efidef_h.CHAR16;  -- ../../gnu-efi/inc/eficon.h:243
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/eficon.h:244

  -- Baseline unicode control chars
  -- Scan codes for base line keys
   type u_SIMPLE_INPUT_INTERFACE;
   type EFI_INPUT_RESET is access function (arg1 : access u_SIMPLE_INPUT_INTERFACE; arg2 : efidef_h.BOOLEAN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/eficon.h:287

   type EFI_INPUT_READ_KEY is access function (arg1 : access u_SIMPLE_INPUT_INTERFACE; arg2 : access EFI_INPUT_KEY) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/eficon.h:294

   type u_SIMPLE_INPUT_INTERFACE is record
      Reset : EFI_INPUT_RESET;  -- ../../gnu-efi/inc/eficon.h:300
      ReadKeyStroke : EFI_INPUT_READ_KEY;  -- ../../gnu-efi/inc/eficon.h:301
      WaitForKey : efidef_h.EFI_EVENT;  -- ../../gnu-efi/inc/eficon.h:302
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/eficon.h:299

   subtype SIMPLE_INPUT_INTERFACE is u_SIMPLE_INPUT_INTERFACE;  -- ../../gnu-efi/inc/eficon.h:303

   subtype EFI_SIMPLE_TEXT_IN_PROTOCOL is u_SIMPLE_INPUT_INTERFACE;  -- ../../gnu-efi/inc/eficon.h:303

end eficon_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
