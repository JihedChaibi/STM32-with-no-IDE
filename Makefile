# Makefile: Jihed Chaibi - 2020



#######################

# Binaries will be generated with this name (.elf, .bin, .hex, etc)
PROJ_NAME=first_test

#######################################################################################

CC=arm-none-eabi-gcc
GDB=gdb-multiarch
OBJCOPY=arm-none-eabi-objcopy

# Source Files

SRCS = src/*.c
SRCS += Drivers/src/*.c

SRCS +=  Startup/startup_stm32.S

# Compiler Flags

CFLAGS  = -g -O0 -Wall -T LinkerScript.ld -D USE_STDPERIPH_DRIVER
CFLAGS += -o output/$(PROJ_NAME).o -Wl,-Map=output/$(PROJ_NAME).map 
CFLAGS += -mlittle-endian -mthumb -mcpu=cortex-m4 -mthumb-interwork
CFLAGS += -mfloat-abi=hard -mfpu=fpv4-sp-d16
CFLAGS += --specs=nosys.specs

# Header Files (-I flag)

CFLAGS += -I include/
CFLAGS += -I Drivers/inc/
CFLAGS += -I CMSIS/Include/

#######################################################################################

.PHONY: first_test

all: first_test

first_test: $(PROJ_NAME).elf

$(PROJ_NAME).elf: $(SRCS)
	$(CC) $(CFLAGS) $^ -o output/$@
	$(OBJCOPY) -O ihex output/$(PROJ_NAME).elf output/$(PROJ_NAME).hex
	$(OBJCOPY) -O binary output/$(PROJ_NAME).elf output/$(PROJ_NAME).bin

clean:
	rm -f *.o output/$(PROJ_NAME).elf output/$(PROJ_NAME).hex output/$(PROJ_NAME).bin output/$(PROJ_NAME).map
	@echo "clean as a whistle!"

############################################




#### OPENOCD STUFF #####


HEXFILE = ./output/first_test.hex
ELFFILE = ./output/first_test.elf

#The path of OpenOCD will change automatically according to the OS (using the check_os)
#However, you can change it manually.

OPENOCD_PATH = /usr/share/openocd

export OPENOCD_BIN = openocd

#I'm using the nucleo STM32F401RE (F4 family)
#change this according to the family of your board
export OPENOCD_BOARD = $(OPENOCD_PATH)/scripts/board/st_nucleo_f4.cfg


############# FLASH #############

    OPENOCD_FLASH_CMDS += -c 'reset halt'
    OPENOCD_FLASH_CMDS += -c 'sleep 10'
    OPENOCD_FLASH_CMDS += -c 'flash protect 0 0 7 off'
    OPENOCD_FLASH_CMDS += -c 'halt'
    OPENOCD_FLASH_CMDS += -c 'flash write_image erase $(HEXFILE) 0 ihex'
    OPENOCD_FLASH_CMDS += -c shutdown
    export OPENOCD_FLASH_CMDS


############# ERASE #############

    OPENOCD_ERASE_CMDS += -c 'reset halt'
    OPENOCD_ERASE_CMDS += -c 'sleep 10'
    OPENOCD_ERASE_CMDS += -c 'sleep 10'
    OPENOCD_ERASE_CMDS += -c 'flash erase_address 0x08000000 0x00080000'
    OPENOCD_ERASE_CMDS += -c shutdown
    export OPENOCD_ERASE_CMDS


############# DEBUG #############

    OPENOCD_DEBUG_CMDS += -c 'halt'
    OPENOCD_DEBUG_CMDS += -c 'sleep 10'
    export OPENOCD_DEBUG_CMDS


########################################################################

flash: check_os
	$(OPENOCD_BIN) -f $(OPENOCD_BOARD) -c init $(OPENOCD_FLASH_CMDS)


erase: check_os
	$(OPENOCD_BIN) -f $(OPENOCD_BOARD) -c init $(OPENOCD_ERASE_CMDS)


run: check_os
	$(OPENOCD_BIN) -f $(OPENOCD_BOARD) -c init $(OPENOCD_RUN_CMDS)

debug: check_os
	$(OPENOCD_BIN) -f $(OPENOCD_BOARD) -c init $(OPENOCD_DEBUG_CMDS)

gdb: check_os
	$(GDB) $(GDB_FLAGS) --eval-command="target remote localhost:3333" ./output/$(PROJ_NAME).elf

##################################### CHECK OS #########################

check_os:
ifeq ($(OS),Windows_NT)
OSFLAG += Windows
OPENOCD_PATH = C:/openocd
GDB=arm-none-eabi-gdb
GDB_FLAGS=

else
ifeq ($(shell uname -s),Linux)
OSFLAG += Linux
OPENOCD_PATH = /usr/share/openocd
GDB=gdb-multiarch
GDB_FLAGS=-tui
endif
endif

print_os: check_os
	@echo $(OSFLAG)
