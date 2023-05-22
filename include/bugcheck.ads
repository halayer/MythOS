with System;
with MythOS.Types; use MythOS.Types;

package Bugcheck is

    procedure print_backtrace with Export, Convention => C,
	External_Name => "Bugcheck_print_backtrace";

    type Backtrace_Array is array(0 .. 15) of u64;
    function backtrace(bt_arr: System.Address) return u8 with Import,
      Convention => C, External_Name => "Bugcheck_backtrace";

end Bugcheck;
