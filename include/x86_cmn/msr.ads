with MythOS.Types; use MythOS.Types;

package MSR is

    function  rdmsr(ecx: u32) return u64 with Export, Convention => C,
        External_Name => "MSR_RDMSR";
    procedure wrmsr(ecx: u32; data: u64) with Export, Convention => C,
        External_Name => "MSR_WRMSR";

end MSR;
