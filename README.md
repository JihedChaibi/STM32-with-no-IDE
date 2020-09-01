# Yes, IDEs make the job easier..

## But if you are an embedded developer, you should know what is going under the hood.

### Get rid of that IDE and do it like a boss

##

![Image of nucleo](https://i.ibb.co/qxH7V1D/FLLL.jpg)


What you will need: 

✪ Any Text Editor (I have used VSCode)

✪ CMSIS / HAL Drivers (Use your own HAL :sunglasses: )  

✪ GNU Make (Makefiles)

✪ GNU ARM Embedded Toolchain

✪ ST-Link (if you want to flash from the command line)

✪ CMake (Required to install ST-Link Programming Tool)

##

* COMPILE :

  $ make 
  
* CLEAN BINARIES :

  $ make clean

  
* INSTALL ST-LINK PROGRAMMING TOOL :

  $ make install_stlink

* FLASH :

  $ make burn

* ERASE CHIP :

  $ make erase
