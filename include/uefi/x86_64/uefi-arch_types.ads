-- https://github.com/kiznit/uefi-headers/blob/master/Include/X64/ProcessorBind.h

package UEFI.Arch_Types is

    type UINT64 is range 0 .. 2**64 - 1;
    type INT64 is range  -2**63 .. 2**63 - 1;
    type UINT32 is range 0 .. 2**32 - 1;
    type INT32 is range -2**31 .. 2**31 - 1;
    type UINT16 is range 0 .. 2**16 - 1;
    type CHAR16 is new UINT16;
    type INT16 is range -2**15 .. 2**15 - 1;

    type BOOLEAN is (False, True) with Size => 8;
    for BOOLEAN use (False => 0, True => 1);
    type UINT8 is range 0 .. 2**8 - 1;
    type CHAR8 is range -2**7 .. 2**7 - 1;
    type INT8 is new CHAR8;

    type UINTN is new UINT64;
    type INTN is new INT64;

    MAX_BIT : constant := 2 ** 63;
    MAX_2_BITS : constant := 2 ** 63 or 2 ** 62;
    MAX_ADDRESS : constant := UINT64'Last;

    MAX_INTN : constant INTN := 2**63 - 1;
    MAX_UINTN : constant UINTN := 2**64 - 1;

    MIN_INTN : constant INTN := -2**63;
    
    CPU_STACK_ALIGNMENT : constant := 16;

    DEFAULT_PAGE_ALLOCAITON_GRANULARITY : constant := 16#1000#;
    RUNTIME_PAGE_ALLOCATION_GRANULARITY : constant := 16#1000#;

end UEFI.Arch_Types;
