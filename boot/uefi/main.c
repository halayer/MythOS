#include <efi.h>

#define put(msg) uefi_call_wrapper(ST->ConOut->OutputString, 2, ST->ConOut, msg)

EFI_STATUS EFIAPI efi_main(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *ST) {
    //ST->ConOut->Reset(ST->ConOut, 1);
    uefi_call_wrapper(ST->ConOut->Reset, 2, ST->ConOut, 1);
    //ST->ConOut->OutputString(ST->ConOut, L"Hello, World!\n");
    uefi_call_wrapper(ST->ConOut->OutputString, 2, ST->ConOut, L"poooooop!\r\n");
    put(L"TODO: Implement UEFI bootloader.");

    while (1) {}

    return EFI_SUCCESS;
}
