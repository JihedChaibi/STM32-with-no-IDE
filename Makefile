# Makefile: Jihed Chaibi - 2020



####OPENOCD SHIT#####


HEXFILE = ./output/first_test.hex
ELFFILE = ./output/first_test.elf

OPENOCD_PATH = /usr/share/openocd
export OPENOCD_BIN = openocd
export OPENOCD_BOARD = $(OPENOCD_PATH)/scripts/board/st_nucleo_f4.cfg


#FLASH #############

    OPENOCD_FLASH_CMDS += -c 'reset halt' 
    OPENOCD_FLASH_CMDS += -c 'sleep 10'  
    OPENOCD_FLASH_CMDS += -c 'flash protect 0 0 7 off' 
	OPENOCD_FLASH_CMDS += -c 'halt'
	OPENOCD_FLASH_CMDS += -c 'flash write_image erase $(HEXFILE) 0 ihex' 
    OPENOCD_FLASH_CMDS += -c 'reset run' 
	OPENOCD_FLASH_CMDS += -c shutdown 


#ERASE #############

    OPENOCD_ERASE_CMDS += -c 'reset halt'
    OPENOCD_ERASE_CMDS += -c 'sleep 10'
    OPENOCD_ERASE_CMDS += -c 'flash erase_address 0x08000000 0x00080000'
    OPENOCD_ERASE_CMDS += -c shutdown


#RUN ##################
    OPENOCD_RUN_CMDS += -c 'reset halt' 
    OPENOCD_RUN_CMDS += -c 'sleep 10' 
    OPENOCD_RUN_CMDS += -c 'reset run' 
    OPENOCD_RUN_CMDS += -c 'sleep 10'  
    OPENOCD_RUN_CMDS += -c shutdown 



.openocd: 
	$(OPENOCD_BIN) -f $(OPENOCD_BOARD) 

.flash:
	$(OPENOCD_BIN) -f $(OPENOCD_BOARD) -c init $(OPENOCD_FLASH_CMDS) 


.erase: 
	$(OPENOCD_BIN) -f $(OPENOCD_BOARD) -c init $(OPENOCD_ERASE_CMDS) 


.run: 
	$(OPENOCD_BIN) -f $(OPENOCD_BOARD) -c init $(OPENOCD_RUN_CMDS) 

gdb:
	gdb-multiarch -tui --eval-command="target remote localhost:3333" ./output/first_test.elf


#######################



# Stlink folder
STLINK = stlink/bin

# Binaries will be generated with this name (.elf, .bin, .hex, etc)
PROJ_NAME=first_test

#######################################################################################

CC=arm-none-eabi-gcc
OBJCOPY=arm-none-eabi-objcopy

# Source Files

SRCS = src/*.c
SRCS += Drivers/src/*.c

SRCS +=  Startup/startup_stm32.S

# Compiler Flags

CFLAGS  = -g -O0 -Wall -T LinkerScript.ld -D USE_STDPERIPH_DRIVER
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
	$(CC) $(CFLAGS) $^ -o output/$@ -o output/$(PROJ_NAME).s
	$(OBJCOPY) -O ihex output/$(PROJ_NAME).elf output/$(PROJ_NAME).hex
	$(OBJCOPY) -O binary output/$(PROJ_NAME).elf output/$(PROJ_NAME).bin

clean:
	rm -f *.o output/$(PROJ_NAME).elf output/$(PROJ_NAME).hex output/$(PROJ_NAME).bin
	@echo "clean as a whistle!"

# Flash the STM32F4
burn: first_test
ifeq ($(OS),Windows_NT)
	@echo "Oops! looks like you are using Windows, which is not supported yet :-("
	@echo "You can manually install stlink or use an external tool to program your microcontroller"
	@echo "You can use this HEX file: output/$(PROJ_NAME).hex"

else
ifeq ($(shell uname -s),Linux)
	@echo "If st-link is not istalled, type 'make install_stlink'"
	@echo ""
	$(STLINK)/st-flash --reset write output/$(PROJ_NAME).bin 0x08000000
endif
endif


download_stlink:
	$(shell git clone https://github.com/stlink-org/stlink)

install_stlink:
	cd stlink && cmake .
	cd stlink && make


erase:
	$(STLINK)/st-flash erase


check_os:
ifeq ($(OS),Windows_NT)
OSFLAG += Windows
else
ifeq ($(shell uname -s),Linux)
OSFLAG += Linux
endif
endif

print_os: check_os
	@echo $(OSFLAG)
