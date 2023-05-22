with MythOS.Types; use MythOS.Types;
with HAL;
with x86;

package PIC is

    procedure remap(master_base, slave_base: HAL.Interrupts.Number) with Export,
      Convention => C, External_Name => "PIC_remap";

    procedure set_mask(mask: u16) with Export, Convention => C,
      External_Name => "PIC_set_mask";

    procedure toggle(irq_line: x86.IRQ) with Export, Convention => C,
      External_Name => "PIC_toggle_irq";
    procedure toggle(enable: Boolean) with Export, Convention => C,
      External_Name => "PIC_toggle";

end PIC;
