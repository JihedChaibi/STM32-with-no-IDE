# Yes, IDEs make the job easier..

## But if you are an embedded developer, you should know what is going under the hood.

### Get rid of that IDE and do it like a boss

##

![Image of nucleo](https://i.ibb.co/qxH7V1D/FLLL.jpg)


What you will need: 

✪ Any Text Editor (I have used VSCode)

✪ CMSIS / HAL Drivers (Use your own HAL :sunglasses: )  

✪ GNU Make (Makefiles)

✪ GNU ARM Embedded Toolchain (Compiler/Other Tools)

✪ ST-Link (if you want to flash from the command line)

✪ CMake (Required to install ST-Link Programming Tool)

##


STEPS: 


* DOWNLOAD ST-LINK PROGRAMMING TOOL :

  $ make download_stlink
  
    
* INSTALL ST-LINK PROGRAMMING TOOL :

  $ make install_stlink
  
  
* COMPILE :

  $ make 

* FLASH :

  $ make burn

* CLEAN BINARIES :

  $ make clean

* ERASE CHIP :

  $ make erase
