CROSS_PREFIX=$(CROSS_COMPILE)
MAKEFILE_DIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))
BIN_DIR=$(MAKEFILE_DIR)../bin
OBJ_DIR=$(MAKEFILE_DIR)../obj
SRC_DIR=$(MAKEFILE_DIR)
SRCS = $(wildcard *.c)
OBJS = $(addprefix $(OBJ_DIR)/, $(SRCS:.c=.o))

CFLAGS = -Wall -O2 -ffreestanding -nostdinc -nostdlib -nostartfiles
LDFLAGS = -nostdlib

all: clean $(OBJ_DIR) $(BIN_DIR) $(BIN_DIR)/boot.bin

$(OBJ_DIR)/startup.o: $(SRC_DIR)/startup.s
	$(CROSS_PREFIX)gcc $(CFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o: %.c
	@[ -d $(OBJ_DIR) ]
	$(CROSS_PREFIX)gcc $(CFLAGS) -c $< -o $@

$(OBJ_DIR):
	@if [ ! -d $(OBJ_DIR) ]; then \
		echo ";; mkdir $(OBJ_DIR)"; mkdir -p $(OBJ_DIR); \
	fi

$(BIN_DIR):
	@if [ ! -d $(BIN_DIR) ]; then \
		echo ";; mkdir $(BIN_DIR)"; mkdir -p $(BIN_DIR); \
	fi

$(BIN_DIR)/boot.bin:  $(OBJ_DIR)/startup.o $(OBJS)
	$(CROSS_PREFIX)ld $(LDFLAGS) -T $(SRC_DIR)/linker.ld $^ -o $(BIN_DIR)/boot.elf
	$(CROSS_PREFIX)objcopy -O binary $(BIN_DIR)/boot.elf $@

clean:
	rm -Rf $(BIN_DIR) $(OBJ_DIR) >/dev/null 2>/dev/null || true

run:
	bash $(SRC_DIR)/run-qemu.sh
