OUTPUT_ARCH( "riscv" )
/*ENTRY(_start)*/

SECTIONS
{
  . = 0x10010000;
  .text.init : { *(.text.init) }
  .tohost ALIGN(0x1000) : { *(.tohost) }
  .text ALIGN(0x1000) : { *(.text) }
  .data ALIGN(0x1000) : { *(.data) }
  .bss : { *(.bss) }
  _end = .;
}
