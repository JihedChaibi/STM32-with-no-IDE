# Yes, IDEs make the job easier, but..

## If you are an embedded developer, you should know what is going under the hood.

### Get rid of that IDE and do it like a boss  :sunglasses: 

##

![Image of nucleo](https://i.ibb.co/qxH7V1D/FLLL.jpg)


What you will need : 

✪ Any Text Editor (I have used VSCode)

✪ CMSIS / HAL Drivers (You can use your own HAL!)  

✪ GNU Make (Makefiles)

✪ GNU ARM Embedded Toolchain (Compiler/Other Tools)

✪ ST-Link* (If You Want to Flash Directly From the Command Line)

✪ CMake (Required to install ST-Link Programming Tool)


###### :exclamation: :neutral_face: * IMPORTANT NOTE : For the time being ST-LINK only works for Linux users (you can still use any external programming tool, if you're a fan of GUIs). I am currently working on the Windows part, stay tuned. :pray:


##


## STEPS: 


* DOWNLOAD (CLONE) THIS REPOSITORY :

```
$ git clone https://github.com/JihedChaibi/STM32-with-no-IDE
```


* ENTER THE STM32-with-no-IDE FOLDER :

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

  
* COMPILE THE DEMO CODE (src/main.c) :
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
* ERASE THE CHIP'S CONTENT (OPTIONAL) :
```
  $ make erase
```


