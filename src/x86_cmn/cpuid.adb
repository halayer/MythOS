with System.Machine_Code;
with MythOS.Types; use MythOS.Types;

package body CPUID is

    function CPUID(func: CPUID_eax) return CPUID_ret is
        ret : CPUID_ret;
    begin
        System.Machine_Code.Asm("movl %4, %%eax; cpuid;" &
                                "movl %%eax, %0; movl %%ebx, %1; movl %%ecx, %2; movl %%edx, %3",
                                Outputs => (u32'Asm_Output("=g", ret.eax),
                                            u32'Asm_Output("=g", ret.ebx),
                                            u32'Asm_Output("=g", ret.ecx),
                                            u32'Asm_Output("=g", ret.edx)),
                                Inputs  => u32'Asm_Input("g", func'Enum_Rep),
                                Clobber => "eax, ebx, ecx, edx",
                                Volatile => True);

        return ret;
    end CPUID;
    function CPUID(eax: CPUID_eax; ecx: u32) return CPUID_ret is
        ret : CPUID_ret;
    begin
        System.Machine_Code.Asm("movl %4, %%eax; movl %5, %%ecx; cpuid;" &
                                "movl %%eax, %0; movl %%ebx, %1; movl %%ecx, %2; movl %%edx, %3",
                                Outputs => (u32'Asm_Output("=g", ret.eax),
                                            u32'Asm_Output("=g", ret.ebx),
                                            u32'Asm_Output("=g", ret.ecx),
                                            u32'Asm_Output("=g", ret.edx)),
                                Inputs  => (u32'Asm_Input("g", u32(eax'Enum_Rep)),
                                            u32'Asm_Input("g", ecx)),
                                Clobber => "eax, ebx, ecx, edx",
                                Volatile => True);

        return ret;
    end CPUID;

end CPUID;
