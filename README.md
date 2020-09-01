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

✪ ST-Link (If You Want to Flash Directly From the Command Line)

✪ CMake (Required to install ST-Link Programming Tool)

##




## STEPS: 


* DOWNLOAD (CLONE) THIS REPOSITORY :

```
$ git clone https://github.com/JihedChaibi/STM32-with-no-IDE
```


* ENTRE THE STM32-with-no-IDE FOLDER :

```
$ cd STM32-with-no-IDE
```

* DOWNLOAD ST-LINK PROGRAMMING TOOL :

```
$ make download_stlink
```
    
* INSTALL ST-LINK PROGRAMMING TOOL :
```
  $ make install_stlink
```

  
* COMPILE :
```
  $ make 
```
* FLASH :
```
  $ make burn
```
* CLEAN BINARIES (OPTIONAL) :
```
  $ make clean
```
* ERASE CHIP (OPTIONAL) :
```
  $ make erase
```


