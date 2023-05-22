with Ada.Unchecked_Conversion;
with System.Machine_Code;
with MythOS.Types; use MythOS.Types;

package body MSR is

    type MSR_data is record
        edx, eax : u32;
    end record;
    for MSR_data use record
        eax at 0 range  0 .. 31;
        edx at 0 range 32 .. 63;
    end record;
    function MSR_to_u64 is new Ada.Unchecked_Conversion(MSR_data, u64);
    function u64_to_MSR is new Ada.Unchecked_Conversion(u64, MSR_data);

    function rdmsr(ecx: u32) return u64 is
        ret : MSR_data;
    begin
        System.Machine_Code.Asm("movl %0, %%ecx; rdmsr;" &
            "movl %%edx, %1; movl %%eax, %2",
            Inputs  => u32'Asm_Input("g", ecx),
            Outputs => (u32'Asm_Output("=g", ret.edx),
                        u32'Asm_Output("=g", ret.eax)),
            Clobber => "eax, ecx, edx",
            Volatile => True);

        return MSR_to_u64(ret);
    end rdmsr;

    procedure wrmsr(ecx: u32; data: u64) is
        ret : MSR_data := u64_to_MSR(data);
    begin
        System.Machine_Code.Asm("movl %0, %%ecx; movl %1, %%edx;" &
            "movl %2, %%eax; wrmsr",
            Inputs => (u32'Asm_Input("g", ecx),
                       u32'Asm_Input("g", ret.edx),
                       u32'Asm_Input("g", ret.eax)),
            Clobber => "eax, ecx, edx",
            Volatile => True);
    end wrmsr;

end MSR;
