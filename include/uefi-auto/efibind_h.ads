pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with bits_stdint_uintn_h;
with bits_stdint_intn_h;
with System;

package efibind_h is

   --  unsupported macro: VOID void
   --  arg-macro: function EFIERR (a)
   --    return 16#8000000000000000# or a;
   EFI_ERROR_MASK : constant := 16#8000000000000000#;  --  ../../gnu-efi/inc/x86_64/efibind.h:135
   --  arg-macro: function EFIERR_OEM (a)
   --    return 16#c000000000000000# or a;

   BAD_POINTER : constant := 16#FBFBFBFBFBFBFBFB#;  --  ../../gnu-efi/inc/x86_64/efibind.h:139
   MAX_ADDRESS : constant := 16#FFFFFFFFFFFFFFFF#;  --  ../../gnu-efi/inc/x86_64/efibind.h:140
   --  arg-macro: procedure BREAKPOINT ()
   --    while (TRUE);

   MIN_ALIGNMENT_SIZE : constant := 4;  --  ../../gnu-efi/inc/x86_64/efibind.h:152
   --  arg-macro: procedure ALIGN_VARIABLE (Value, Adjustment)
   --    (UINTN)Adjustment := 0; if((UINTN)Value mod MIN_ALIGNMENT_SIZE) (UINTN)Adjustment := MIN_ALIGNMENT_SIZE - ((UINTN)Value mod MIN_ALIGNMENT_SIZE); Value := (UINTN)Value + (UINTN)Adjustment
   --  arg-macro: function EFI_SIGNATURE_16 (A, B)
   --    return (A) or (B<<8);
   --  arg-macro: function EFI_SIGNATURE_32 (A, B, C, D)
   --    return EFI_SIGNATURE_16(A,B) or (EFI_SIGNATURE_16(C,D) << 16);
   --  arg-macro: function EFI_SIGNATURE_64 (A, B, C, D, E, F, G, H)
   --    return EFI_SIGNATURE_32(A,B,C,D) or ((UINT64)(EFI_SIGNATURE_32(E,F,G,H)) << 32);
   --  arg-macro: procedure RUNTIME_CODE (a)
   --    alloc_text("rtcode", a)
   --  arg-macro: procedure BEGIN_RUNTIME_DATA ()
   --    data_seg("rtdata")
   --  arg-macro: procedure END_RUNTIME_DATA ()
   --    data_seg("")
   --  unsupported macro: VOLATILE volatile
   --  arg-macro: procedure EFI_DRIVER_ENTRY_POINT (InitFunction)
   --    UINTN InitializeDriver ( VOID *ImageHandle, VOID *SystemTable ) { return InitFunction(ImageHandle, SystemTable); } EFI_STATUS efi_main( EFI_HANDLE image, EFI_SYSTEM_TABLE *systab ) __attribute__((weak, alias ("InitializeDriver")));
   --  arg-macro: function LOAD_INTERNAL_DRIVER (_if, type, name, entry)
   --    return _if).LoadInternal(type, name, entry;
   --  arg-macro: procedure INTERFACE_DECL (x)
   --    struct x
   --  unsupported macro: uefi_call_wrapper(func,va_num,...) __VA_ARG_NSUFFIX__(_cast64_efi_call, __VA_ARGS__) (func , ##__VA_ARGS__)

  --++
  --Copyright (c) 1998  Intel Corporation
  --Module Name:
  --    efefind.h
  --Abstract:
  --    EFI to compile bindings
  --Revision History
  ---- 

  -- Basic int types of various widths
  -- No ANSI C 1999/2000 stdint.h integer width declarations 
  -- Use Microsoft C compiler integer width declarations 
  --  Use LP64 programming model from C_FLAGS for integer width declarations  
  --  Assume P64 programming model from C_FLAGS for integer width declarations  
  -- Basic EFI types of various widths
   subtype UINT64 is bits_stdint_uintn_h.uint64_t;  -- ../../gnu-efi/inc/x86_64/efibind.h:103

   subtype INT64 is bits_stdint_intn_h.int64_t;  -- ../../gnu-efi/inc/x86_64/efibind.h:104

   subtype UINT32 is bits_stdint_uintn_h.uint32_t;  -- ../../gnu-efi/inc/x86_64/efibind.h:107

   subtype INT32 is bits_stdint_intn_h.int32_t;  -- ../../gnu-efi/inc/x86_64/efibind.h:108

   subtype UINT16 is bits_stdint_uintn_h.uint16_t;  -- ../../gnu-efi/inc/x86_64/efibind.h:111

   subtype INT16 is bits_stdint_intn_h.int16_t;  -- ../../gnu-efi/inc/x86_64/efibind.h:112

   subtype UINT8 is bits_stdint_uintn_h.uint8_t;  -- ../../gnu-efi/inc/x86_64/efibind.h:113

   subtype INT8 is bits_stdint_intn_h.int8_t;  -- ../../gnu-efi/inc/x86_64/efibind.h:114

   subtype WCHAR is int;  -- ../../gnu-efi/inc/x86_64/efibind.h:115

   subtype INTN is bits_stdint_intn_h.int64_t;  -- ../../gnu-efi/inc/x86_64/efibind.h:121

   subtype UINTN is bits_stdint_uintn_h.uint64_t;  -- ../../gnu-efi/inc/x86_64/efibind.h:122

  -- Pointers must be aligned to these address to function
  -- Define macros to build data structure signatures from characters.
  -- To export & import functions in the EFI emulator environment
  -- EFIAPI - prototype calling convention for EFI function pointers
  -- BOOTSERVICE - prototype for implementation of a boot service interface
  -- RUNTIMESERVICE - prototype for implementation of a runtime service interface
  -- RUNTIMEFUNCTION - prototype for implementation of a runtime function that is not a service
  -- RUNTIME_CODE - pragma macro for declaring runtime code    
  -- Force amd64/ms calling conventions.
  --#define RUNTIMESERVICE(proto,a)    alloc_text("rtcode",a); proto a
  --#define RUNTIMEFUNCTION(proto,a)   alloc_text("rtcode",a); proto a
  -- To help ensure proper coding of integrated drivers, they are
  -- compiled as DLLs.  In NT they require a dll init entry pointer.
  -- The macro puts a stub entry point into the DLL so it will load.
  -- When build similiar to FW, then link everything together as
  -- one big module. For the MSVC toolchain, we simply tell the
  -- linker what our driver init function is using /ENTRY.
  -- Some compilers don't support the forward reference construct:
  --  typedef struct XXXXX
  -- The following macro provide a workaround for such cases.
  -- for x86_64, EFI_FUNCTION_WRAPPER must be defined  
  --  Credits for macro-magic:
  --    https://groups.google.com/forum/?fromgroups#!topic/comp.std.c/d-6Mj5Lko_s
  --    http://efesx.com/2010/08/31/overloading-macros/
  -- 

  -- Prototypes of EFI cdecl -> stdcall trampolines  
   function efi_call0 (func : System.Address) return UINT64  -- ../../gnu-efi/inc/x86_64/efibind.h:324
   with Import => True, 
        Convention => C, 
        External_Name => "efi_call0";

   function efi_call1 (func : System.Address; arg1 : UINT64) return UINT64  -- ../../gnu-efi/inc/x86_64/efibind.h:325
   with Import => True, 
        Convention => C, 
        External_Name => "efi_call1";

   function efi_call2
     (func : System.Address;
      arg1 : UINT64;
      arg2 : UINT64) return UINT64  -- ../../gnu-efi/inc/x86_64/efibind.h:326
   with Import => True, 
        Convention => C, 
        External_Name => "efi_call2";

   function efi_call3
     (func : System.Address;
      arg1 : UINT64;
      arg2 : UINT64;
      arg3 : UINT64) return UINT64  -- ../../gnu-efi/inc/x86_64/efibind.h:327
   with Import => True, 
        Convention => C, 
        External_Name => "efi_call3";

   function efi_call4
     (func : System.Address;
      arg1 : UINT64;
      arg2 : UINT64;
      arg3 : UINT64;
      arg4 : UINT64) return UINT64  -- ../../gnu-efi/inc/x86_64/efibind.h:328
   with Import => True, 
        Convention => C, 
        External_Name => "efi_call4";

   function efi_call5
     (func : System.Address;
      arg1 : UINT64;
      arg2 : UINT64;
      arg3 : UINT64;
      arg4 : UINT64;
      arg5 : UINT64) return UINT64  -- ../../gnu-efi/inc/x86_64/efibind.h:330
   with Import => True, 
        Convention => C, 
        External_Name => "efi_call5";

   function efi_call6
     (func : System.Address;
      arg1 : UINT64;
      arg2 : UINT64;
      arg3 : UINT64;
      arg4 : UINT64;
      arg5 : UINT64;
      arg6 : UINT64) return UINT64  -- ../../gnu-efi/inc/x86_64/efibind.h:332
   with Import => True, 
        Convention => C, 
        External_Name => "efi_call6";

   function efi_call7
     (func : System.Address;
      arg1 : UINT64;
      arg2 : UINT64;
      arg3 : UINT64;
      arg4 : UINT64;
      arg5 : UINT64;
      arg6 : UINT64;
      arg7 : UINT64) return UINT64  -- ../../gnu-efi/inc/x86_64/efibind.h:334
   with Import => True, 
        Convention => C, 
        External_Name => "efi_call7";

   function efi_call8
     (func : System.Address;
      arg1 : UINT64;
      arg2 : UINT64;
      arg3 : UINT64;
      arg4 : UINT64;
      arg5 : UINT64;
      arg6 : UINT64;
      arg7 : UINT64;
      arg8 : UINT64) return UINT64  -- ../../gnu-efi/inc/x86_64/efibind.h:336
   with Import => True, 
        Convention => C, 
        External_Name => "efi_call8";

   function efi_call9
     (func : System.Address;
      arg1 : UINT64;
      arg2 : UINT64;
      arg3 : UINT64;
      arg4 : UINT64;
      arg5 : UINT64;
      arg6 : UINT64;
      arg7 : UINT64;
      arg8 : UINT64;
      arg9 : UINT64) return UINT64  -- ../../gnu-efi/inc/x86_64/efibind.h:339
   with Import => True, 
        Convention => C, 
        External_Name => "efi_call9";

   function efi_call10
     (func : System.Address;
      arg1 : UINT64;
      arg2 : UINT64;
      arg3 : UINT64;
      arg4 : UINT64;
      arg5 : UINT64;
      arg6 : UINT64;
      arg7 : UINT64;
      arg8 : UINT64;
      arg9 : UINT64;
      arg10 : UINT64) return UINT64  -- ../../gnu-efi/inc/x86_64/efibind.h:342
   with Import => True, 
        Convention => C, 
        External_Name => "efi_call10";

  -- Front-ends to efi_callX to avoid compiler warnings  
  -- main wrapper (va_num ignored)  
end efibind_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
