
# Put your stlink folder here so make burn will work.
STLINK = stlink/build/Release/bin

# Put your source files here (or *.c, etc)
SRCS = src/*.c
SRCS += Drivers/src/*.c

# Binaries will be generated with this name (.elf, .bin, .hex, etc)
PROJ_NAME=first_test

# Put your STM32F4 library code directory here
STM_COMMON=../STM32F4-Discovery_FW_V1.1.0

# Normally you shouldn't need to change anything below this line!
#######################################################################################


CC=arm-none-eabi-gcc
OBJCOPY=arm-none-eabi-objcopy

CFLAGS  = -g -O2 -Wall -T LinkerScript.ld  -D USE_STDPERIPH_DRIVER 
CFLAGS += -mlittle-endian -mthumb -mcpu=cortex-m4 -mthumb-interwork
CFLAGS += -mfloat-abi=hard -mfpu=fpv4-sp-d16
CFLAGS += --specs=nosys.specs

CFLAGS += -I inc/
CFLAGS += -I Drivers/inc
CFLAGS += -I CMSIS/ST/STM32F4xx/Include
CFLAGS += -I CMSIS/Include

SRCS +=  Startup/startup_stm32.S



.PHONY: first_test

all: first_test

first_test: $(PROJ_NAME).elf

$(PROJ_NAME).elf: $(SRCS)
	$(CC) $(CFLAGS) $^ -o output/$@ 
	$(OBJCOPY) -O ihex output/$(PROJ_NAME).elf output/$(PROJ_NAME).hex
	$(OBJCOPY) -O binary output/$(PROJ_NAME).elf output/$(PROJ_NAME).bin

clean:
	rm -f *.o output/$(PROJ_NAME).elf output/$(PROJ_NAME).hex output/$(PROJ_NAME).bin

# Flash the STM32F4
burn:
	$(STLINK)/st-flash --reset write output/$(PROJ_NAME).bin 0x08000000
	
erase:
	$(STLINK)/st-flash erase