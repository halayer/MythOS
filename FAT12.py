#!/usr/bin/python3
import struct


SECTOR_SIZE = 512

BAD = (0xFF7,)
RESERVED = tuple([0xFF0 + i for i in range(7)])
LAST = tuple([0xFF8 + i for i in range(8)])


class FAT12(object):
    
    def __init__(self, data):
        self.data = data

        self.oem = data[0x3:0xB].decode(errors="replace")
        self.sector_size = struct.unpack("H", data[0xB:0xD])[0]
        self.cluster_size = struct.unpack("B", data[0xD:0xE])[0]
        self.reserved_sectors = struct.unpack("H", data[0xE:0x10])[0]
        self.fats = struct.unpack("B", data[0x10:0x11])[0]
        self.max_root_entries = struct.unpack("H", data[0x11:0x13])[0]
        self.num_sectors = struct.unpack("H", data[0x13:0x15])[0]
        if self.num_sectors == 0: self.num_sectors = struct.unpack("I", data[0x20:0x24])[0]
        self.fat_size = struct.unpack("H", data[0x16:0x18])[0]
        self.fat_variant = data[0x36:0x3E]#.decode(errors="replace")

        self.FAT = []

        self._parseFAT()

    def _parseEntry(self, FAT_data, cluster):
        off = int(cluster * (12 / 8))

        if off % 2 == 0:
            bits = struct.unpack("<H", FAT_data[off:off+2])[0]
            #final = bits >> 4
        else:
            bits = struct.unpack("<H", bytes((FAT_data[off-1] & 0x0F, FAT_data[off+2])))[0]
            #final = (bits & 0xFF00 >> 8) | (bits & 0xFF << 8)

        if cluster == 0: final = (bits >> 4) & 0xFFF
        elif cluster == 1 or cluster % 2 != 0: final = bits & 0xFFF
        else:
            final = struct.unpack(">H", struct.pack("<H", bits))[0]

        return final

    def _parseFAT(self):
        FAT_data = self.data[SECTOR_SIZE*1:SECTOR_SIZE*(self.fat_size + 1)]

        for i in range(int(len(FAT_data) / 1.5)):
            entry = self._parseEntry(FAT_data, i)

            if entry: self.FAT.append(entry)

    def __repr__(self):
        ret = f"OEM: {self.oem}\nSector Size: {self.sector_size}\n" + \
              f"Cluster Size (in sectors): {self.cluster_size}\n" + \
              f"Reserved Sectors: {self.reserved_sectors}\nFATs: {self.fats}\n" + \
              f"Max Root Entries: {self.max_root_entries}\nSectors: {self.num_sectors}\n" + \
              f"FAT Size (in sectors): {self.fat_size}\nFAT Variant: {self.fat_variant}\n"

        return ret


if __name__ == "__main__":
    from pprint import pprint

    with open("cos.img", "rb") as file:
        data = file.read()[SECTOR_SIZE * 32:]

    fat = FAT12(data)
    print(fat)

    for i in range(len(fat.FAT)):
        print(str(i) + ":", hex(fat.FAT[i]))
