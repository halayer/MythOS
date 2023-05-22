with Ada.Unchecked_Conversion;
with MythOS.Types; use MythOS.Types;

package CPUID is

    -- https://c9x.me/x86/html/file_module_x86_id_45.html
    type CPUID_ret is record
        eax : u32;
        ebx : u32;
        ecx : u32;
        edx : u32;
    end record;

    -- https://wiki.osdev.org/CPUID
    type EDX_Features is record
        FPU    : Boolean;
        VME    : Boolean;
        DE     : Boolean;
        PSE    : Boolean;
        TSC    : Boolean;
        MSR    : Boolean;
        PAE    : Boolean;
        MCE    : Boolean;
        CX8    : Boolean;
        APIC   : Boolean;
        SEP    : Boolean;
        MTRR   : Boolean;
        PGE    : Boolean;
        MCA    : Boolean;
        CMOV   : Boolean;
        PAT    : Boolean;
        PSE_36 : Boolean;
        PSN    : Boolean;
        CLFSH  : Boolean;
        DS     : Boolean;
        ACPI   : Boolean;
        MMX    : Boolean;
        FXSR   : Boolean;
        SSE    : Boolean;
        SSE2   : Boolean;
        SS     : Boolean;
        HTT    : Boolean;
        TM     : Boolean;
        PBE    : Boolean;
    end record with Size => 32;
    for EDX_Features use record
        FPU    at 0 range  0 .. 0;
        VME    at 0 range  1 .. 1;
        DE     at 0 range  2 .. 2;
        PSE    at 0 range  3 .. 3;
        TSC    at 0 range  4 .. 4;
        MSR    at 0 range  5 .. 5;
        PAE    at 0 range  6 .. 6;
        MCE    at 0 range  7 .. 7;
        CX8    at 0 range  8 .. 8;
        APIC   at 0 range  9 .. 9;
        SEP    at 0 range 11 .. 11;
        MTRR   at 0 range 12 .. 12;
        PGE    at 0 range 13 .. 13;
        MCA    at 0 range 14 .. 14;
        CMOV   at 0 range 15 .. 15;
        PAT    at 0 range 16 .. 16;
        PSE_36 at 0 range 17 .. 17;
        PSN    at 0 range 18 .. 18;
        CLFSH  at 0 range 19 .. 19;
        DS     at 0 range 21 .. 21;
        ACPI   at 0 range 22 .. 22;
        MMX    at 0 range 23 .. 23;
        FXSR   at 0 range 24 .. 24;
        SSE    at 0 range 25 .. 25;
        SSE2   at 0 range 26 .. 26;
        SS     at 0 range 27 .. 27;
        HTT    at 0 range 28 .. 28;
        TM     at 0 range 29 .. 29;
        PBE    at 0 range 31 .. 31;
    end record;
    function u32_to_edx_features is new Ada.Unchecked_Conversion(u32, EDX_Features);
    function edx_features_to_u32 is new Ada.Unchecked_Conversion(EDX_Features, u32);

    type CPUID_eax is (Vendor, Features, TLB, Serial, Caches) with Size => 32;
    for CPUID_eax use (Vendor => 0, Features => 1, TLB => 2, Serial => 3,
                       Caches => 4);

    function CPUID(func: CPUID_eax) return CPUID_ret with Inline, Export,
      Convention => C, External_Name => "CPUID";
    function CPUID(eax: CPUID_eax; ecx: u32) return CPUID_ret with Inline, Export,
      Convention => C, External_Name => "CPUIDex";

end CPUID;
