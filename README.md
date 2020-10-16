# Yes, IDEs make the job easier, but..

## If you are an embedded developer, you should know what is going under the hood.

### Get rid of that IDE and do it like a boss  :sunglasses: 

##

![Image of nucleo](https://i.ibb.co/qxH7V1D/FLLL.jpg)


## What you will need : 

✪ Any Text Editor

✪ CMSIS / HAL Drivers (You can use your own HAL!)  

✪ Startup File + Linker Script (You can always use you own)

✪ GNU Make (Makefiles)

✪ GNU ARM Embedded Toolchain (Compiler/Other Tools)

✪ OpenOCD (If You Want to Flash/Debug Directly From the Command Line)



###### :exclamation: :neutral_face: * IMPORTANT NOTE : For the time being ST-LINK only works for Linux users (you can still use any external programming tool, if you're a fan of GUIs). I am currently working on the Windows part, stay tuned. :pray:


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



