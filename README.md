# Yes, IDEs make the job easier, but..

## If you are an embedded developer, you should know what is going under the hood.

### Get rid of that IDE and do it like a boss  :sunglasses: 

##

![Image of nucleo](https://i.ibb.co/qxH7V1D/FLLL.jpg)


## :tada: GOOD NEWS :grin: : FROM NOW ON WE'LL USE OpenOCD & GDB FOR FLASHING AND DEBUGGING!



## What you will need : 

✪ Any Text Editor

✪ CMSIS / HAL Drivers (You can use your own HAL!)  

✪ Startup File + Linker Script (You can always use you own)

✪ GNU Make (Makefiles)

✪ GNU ARM Embedded Toolchain (Compiler/Other Tools)

✪ OpenOCD (If You Want to Flash/Debug Directly From the Command Line)

✪ The GNU Debugger - GDB (arm-none-eabi-gdb OR gdb-multiarch)



##


## STEPS : 


* DOWNLOAD (CLONE) THIS REPOSITORY :

```
$ git clone https://github.com/JihedChaibi/STM32-with-no-IDE
```


* ENTER THE STM32-with-no-IDE FOLDER :

```
$ cd STM32-with-no-IDE
```
  
* COMPILE THE DEMO CODE (src/main.c) :
```
  $ make 
```
* FLASH :
```
  $ make flash
```
* CLEAN BINARIES (OPTIONAL) :
```
  $ make clean
```
* ERASE THE CHIP'S CONTENT (OPTIONAL) :
```
  $ make erase
```
* START THE DEBUGGING SESSION :
```
  $ make debug
```
* OPEN ANOTHER TERMINAL WINDOW :
```
  $ make gdb
```

## Short term goals : 

- Debugging from the command line [DONE!] 
- Windows support [DONE!]
- Using CMake+GNU Make or CMake+Ninja as a main builder 

![Image of nucleo](https://i.redd.it/5ao2f5ufjzf51.jpg)



