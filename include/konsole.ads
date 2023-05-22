with System;

package Konsole is

    WIDTH  : constant Natural := 80;
    HEIGHT : constant Natural := 25;

    subtype Col is Natural range 0 .. WIDTH - 1;
    subtype Row is Natural range 0 .. HEIGHT - 1;

    -- wiki.osdev.org/Ada_Bare_Bones
    type Foreground_Color is (Black, Blue, Green, Cyan, Red, Magenta,
                              Brown, Light_Grey, Dark_Grey, Light_Blue,
                              Light_Green, Light_Cyan, Light_Red,
                              Light_Magenta, Yellow, White) with Size => 4;
    for Foreground_Color use (Black => 0, Blue => 1, Green => 2, Cyan => 3,
                              Red => 4, Magenta => 5, Brown => 6,
                              Light_Grey => 7, Dark_Grey => 8,
                              Light_Blue => 9, Light_Green => 10,
                              Light_Cyan => 11, Light_Red => 12,
                              Light_Magenta => 13, Yellow => 14, White => 15);

    type Background_Color is (Black, Blue, Green, Cyan, Red, Magenta, Brown,
                              Light_Grey) with Size => 4;
    for Background_Color use (Black => 0, Blue => 1, Green => 2, Cyan => 3,
                              Red => 4, Magenta => 5, Brown => 6,
                              Light_Grey => 7);

    type Cell_Color is record
        fgc : Foreground_Color := Light_Grey;
        bgc : Background_Color := Black;
    end record;
    for Cell_Color use record
        fgc at 0 range 0 .. 3;
        bgc at 0 range 4 .. 7;
    end record;
    for Cell_Color'Size use 8;

    type Cell is record
        char : Character;
        clr  : Cell_Color;
    end record with Size => 16;
    for Cell use record
        char at 0 range 0 .. 7;
        clr  at 0 range 8 .. 15;
    end record;

    type Video_Screen is array(Row,Col) of Cell;
    screen : Video_Screen with Import;
    for screen'Address use System'To_Address(16#000B_8000#);

    package Cursor is
        procedure update with Export, Convention => C,
            External_Name => "Konsole_Cursor_update";
        procedure move(x: Col; y: Row) with Export, Convention => C,
            External_Name => "Konsole_Cursor_move";
        procedure toggle(show: Boolean) with Export, Convention => C,
            External_Name => "Konsole_Cursor_toggle";
    end Cursor;

    procedure set_color(clr: Cell_Color) with Inline, Export, Convention => C,
        External_Name => "Konsole_set_color";
    procedure put(char: Character) with Export, Convention => C,
        External_Name => "Konsole_putc";
    procedure put(str: String);
    procedure clear with Export, Convention => C,
        External_Name => "Konsole_clear";

end Konsole;
