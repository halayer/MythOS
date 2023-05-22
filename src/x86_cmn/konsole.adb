with MythOS.Types; use MythOS.Types;
with HAL;

package body Konsole is

    type Console_Cursor_T is record
        x : Col := 0;
        y : Row := 0;

        hidden : Boolean := False;
    end record;
    console_cursor : Console_Cursor_T;
    color : Cell_Color := Cell_Color'(Light_Grey, Black);
    disable_updating : Boolean := False;

    package body Cursor is
        procedure update is
            use type u16;
            location : u16 := u16(u16(console_cursor.y * WIDTH) + u16(console_cursor.x));
        begin
            if console_cursor.hidden then return; end if;

            HAL.move_cursor(location);
        end update;

        procedure move(x: Col; y: Row) is begin
            console_cursor.x := x;
            console_cursor.y := y;

            update;
        end move;

        procedure toggle(show: Boolean) is begin
            if show then
                console_cursor.hidden := False;
                update;
                return;
            end if;

            console_cursor.y := console_cursor.y + HEIGHT; -- Move the cursor off the screen
            update;

            console_cursor.y := console_cursor.y - HEIGHT; -- Restore the old position,
            console_cursor.hidden := True;                 -- but don't update it
        end toggle;
    end Cursor;

    procedure set_color(clr: Cell_Color) is begin color := clr; end set_color;

    procedure put(char: Character) is begin
        if char = Character'Val(10) then
            goto newline;
        elsif char = Character'Val(13) then
            console_cursor.x := 0;
        else
            screen(console_cursor.y,console_cursor.x) := Cell'(char, color);
            console_cursor.x := console_cursor.x + 1;

            if console_cursor.x = WIDTH then goto newline; end if;
        end if;

        goto ret;

        <<newline>>
        console_cursor.y := console_cursor.y + 1;
        console_cursor.x := 0;

        <<ret>>
        if disable_updating then return; end if;
        Cursor.update;
    end put;

    procedure put(str: String) is begin
        disable_updating := True;
        for char of str loop
            put(char);
        end loop;
        disable_updating := False;

        Cursor.update;
    end put;

    procedure clear is begin
        for x in 0 .. WIDTH loop
            for y in 0 .. HEIGHT loop
                screen(y,x) := Cell'(Character'Val(0), color);
            end loop;
        end loop;
    end clear;

end Konsole;
