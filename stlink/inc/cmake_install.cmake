# Install script for directory: /home/geek-tn/Desktop/STM32-with-no-IDE/stlink/inc

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/stlink" TYPE FILE FILES
    "/home/geek-tn/Desktop/STM32-with-no-IDE/stlink/inc/backend.h"
    "/home/geek-tn/Desktop/STM32-with-no-IDE/stlink/inc/stlink.h"
    "/home/geek-tn/Desktop/STM32-with-no-IDE/stlink/inc/stm32.h"
    "/home/geek-tn/Desktop/STM32-with-no-IDE/stlink/inc/version.h"
    "/home/geek-tn/Desktop/STM32-with-no-IDE/stlink/src/stlink-lib/chipid.h"
    "/home/geek-tn/Desktop/STM32-with-no-IDE/stlink/src/stlink-lib/commands.h"
    "/home/geek-tn/Desktop/STM32-with-no-IDE/stlink/src/stlink-lib/flash_loader.h"
    "/home/geek-tn/Desktop/STM32-with-no-IDE/stlink/src/stlink-lib/libusb_settings.h"
    "/home/geek-tn/Desktop/STM32-with-no-IDE/stlink/src/stlink-lib/logging.h"
    "/home/geek-tn/Desktop/STM32-with-no-IDE/stlink/src/stlink-lib/md5.h"
    "/home/geek-tn/Desktop/STM32-with-no-IDE/stlink/src/stlink-lib/reg.h"
    "/home/geek-tn/Desktop/STM32-with-no-IDE/stlink/src/stlink-lib/sg.h"
    "/home/geek-tn/Desktop/STM32-with-no-IDE/stlink/src/stlink-lib/usb.h"
    )
endif()

