with EFIProt_H;
with EFIDef_H; use EFIDef_H;
with EFIApi_H; use EFIApi_H;
with EFICon_H; use EFICon_H;

pragma Source_File_Name(efi_main, Body_File_Name => "main.adb");

function efi_main(ImageHandle: EFI_HANDLE; ST: EFI_SYSTEM_TABLE)
    return EFI_STATUS is begin
    ST.ConOut.Reset(ST.ConOut, 1);
    ST.ConOut.OutputString(ST.ConOut, "Hello, World!");

    while True loop
        null;
    end loop;

    return EFI_SUCCESS;
end efi_main;
