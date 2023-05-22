pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with efibind_h;
with efidef_h;

package efipoint_h is

   --  unsupported macro: EFI_SIMPLE_POINTER_PROTOCOL_GUID { 0x31878c87, 0xb75, 0x11d5, { 0x9a, 0x4f, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d } }
   --  unsupported macro: EFI_ABSOLUTE_POINTER_PROTOCOL_GUID { 0x8D59D32B, 0xC655, 0x4AE9, { 0x9B, 0x15, 0xF2, 0x59, 0x04, 0x99, 0x2A, 0x43 } }
   EFI_ABSP_SupportsAltActive : constant := 16#00000001#;  --  ../../gnu-efi/inc/efipoint.h:89
   EFI_ABSP_SupportsPressureAsZ : constant := 16#00000002#;  --  ../../gnu-efi/inc/efipoint.h:90
   EFI_ABSP_TouchActive : constant := 16#00000001#;  --  ../../gnu-efi/inc/efipoint.h:91
   EFI_ABS_AltActive : constant := 16#00000002#;  --  ../../gnu-efi/inc/efipoint.h:92

  -- Copyright (C) 2014 by John Cronin
  -- *
  -- * Permission is hereby granted, free of charge, to any person obtaining a copy
  -- * of this software and associated documentation files (the "Software"), to deal
  -- * in the Software without restriction, including without limitation the rights
  -- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  -- * copies of the Software, and to permit persons to whom the Software is
  -- * furnished to do so, subject to the following conditions:
  -- * The above copyright notice and this permission notice shall be included in
  -- * all copies or substantial portions of the Software.
  -- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  -- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  -- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  -- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  -- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  -- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  -- * THE SOFTWARE.
  --  

   type EFI_SIMPLE_POINTER_STATE is record
      RelativeMovementX : aliased efibind_h.INT32;  -- ../../gnu-efi/inc/efipoint.h:31
      RelativeMovementY : aliased efibind_h.INT32;  -- ../../gnu-efi/inc/efipoint.h:32
      RelativeMovementZ : aliased efibind_h.INT32;  -- ../../gnu-efi/inc/efipoint.h:33
      LeftButton : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipoint.h:34
      RightButton : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipoint.h:35
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipoint.h:36

   type EFI_SIMPLE_POINTER_MODE is record
      ResolutionX : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efipoint.h:39
      ResolutionY : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efipoint.h:40
      ResolutionZ : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efipoint.h:41
      LeftButton : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipoint.h:42
      RightButton : aliased efidef_h.BOOLEAN;  -- ../../gnu-efi/inc/efipoint.h:43
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipoint.h:44

   type u_EFI_SIMPLE_POINTER;
   type EFI_SIMPLE_POINTER_RESET is access function (arg1 : access u_EFI_SIMPLE_POINTER; arg2 : efidef_h.BOOLEAN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipoint.h:48

   type EFI_SIMPLE_POINTER_GET_STATE is access function (arg1 : access u_EFI_SIMPLE_POINTER; arg2 : access EFI_SIMPLE_POINTER_STATE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipoint.h:55

   type u_EFI_SIMPLE_POINTER is record
      Reset : EFI_SIMPLE_POINTER_RESET;  -- ../../gnu-efi/inc/efipoint.h:61
      GetState : EFI_SIMPLE_POINTER_GET_STATE;  -- ../../gnu-efi/inc/efipoint.h:62
      WaitForInput : efidef_h.EFI_EVENT;  -- ../../gnu-efi/inc/efipoint.h:63
      Mode : access EFI_SIMPLE_POINTER_MODE;  -- ../../gnu-efi/inc/efipoint.h:64
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipoint.h:60

   subtype EFI_SIMPLE_POINTER_PROTOCOL is u_EFI_SIMPLE_POINTER;  -- ../../gnu-efi/inc/efipoint.h:65

   type EFI_ABSOLUTE_POINTER_MODE is record
      AbsoluteMinX : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efipoint.h:73
      AbsoluteMinY : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efipoint.h:74
      AbsoluteMinZ : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efipoint.h:75
      AbsoluteMaxX : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efipoint.h:76
      AbsoluteMaxY : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efipoint.h:77
      AbsoluteMaxZ : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efipoint.h:78
      Attributes : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efipoint.h:79
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipoint.h:80

   type EFI_ABSOLUTE_POINTER_STATE is record
      CurrentX : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efipoint.h:83
      CurrentY : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efipoint.h:84
      CurrentZ : aliased efibind_h.UINT64;  -- ../../gnu-efi/inc/efipoint.h:85
      ActiveButtons : aliased efibind_h.UINT32;  -- ../../gnu-efi/inc/efipoint.h:86
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipoint.h:87

   type u_EFI_ABSOLUTE_POINTER_PROTOCOL;
   type EFI_ABSOLUTE_POINTER_RESET is access function (arg1 : access u_EFI_ABSOLUTE_POINTER_PROTOCOL; arg2 : efidef_h.BOOLEAN) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipoint.h:96

   type EFI_ABSOLUTE_POINTER_GET_STATE is access function (arg1 : access u_EFI_ABSOLUTE_POINTER_PROTOCOL; arg2 : access EFI_ABSOLUTE_POINTER_STATE) return efidef_h.EFI_STATUS
   with Convention => C;  -- ../../gnu-efi/inc/efipoint.h:103

   type u_EFI_ABSOLUTE_POINTER_PROTOCOL is record
      Reset : EFI_ABSOLUTE_POINTER_RESET;  -- ../../gnu-efi/inc/efipoint.h:109
      GetState : EFI_ABSOLUTE_POINTER_GET_STATE;  -- ../../gnu-efi/inc/efipoint.h:110
      WaitForInput : efidef_h.EFI_EVENT;  -- ../../gnu-efi/inc/efipoint.h:111
      Mode : access EFI_ABSOLUTE_POINTER_MODE;  -- ../../gnu-efi/inc/efipoint.h:112
   end record
   with Convention => C_Pass_By_Copy;  -- ../../gnu-efi/inc/efipoint.h:108

   subtype EFI_ABSOLUTE_POINTER_PROTOCOL is u_EFI_ABSOLUTE_POINTER_PROTOCOL;  -- ../../gnu-efi/inc/efipoint.h:113

end efipoint_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
