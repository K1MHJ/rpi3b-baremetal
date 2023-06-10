CROSS_PREFIX=aarch64-linux-gnu-
MAKEFILE_DIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))
BIN_DIR=$(MAKEFILE_DIR)../bin/
OBJ_DIR=$(MAKEFILE_DIR)../obj/
SRC_DIR=$(MAKEFILE_DIR)
CFLAGS = -Wall -O2 -ffreestanding -nostdinc -nostdlib -nostartfiles
LDFLAGS = -nostdlib

all: $(BIN_DIR)boot.bin

$(OBJ_DIR)startup.o: $(SRC_DIR)startup.s
	$(CROSS_PREFIX)gcc $(CFLAGS) -c $< -o $@

$(BIN_DIR)boot.elf: $(OBJ_DIR)startup.o
	$(CROSS_PREFIX)ld $(LDFLAGS) -T $(SRC_DIR)linker.ld $^ -o $@

$(BIN_DIR)boot.bin: $(BIN_DIR)boot.elf
	$(CROSS_PREFIX)objcopy -O binary $< $@

clean:
	rm -Rf $(BIN_DIR)* $(OBJ_DIR)* >/dev/null 2>/dev/null || true

run:
	bash $(SRC_DIR)../run-qemu.sh
