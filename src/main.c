#include <stdint.h>
#include "stm32f4xx.h"

void delay()
{
    volatile uint64_t k;
    for(k=0;k<9000000;k++);
}

int main()
{


    RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;

    GPIOA->MODER = (1 << 10);        // set pin 13 to be general purpose output
    GPIOA->MODER &= ~(1 << 11);      // set pin 13 to be general purpose output


    for (;;) {
       GPIOA->ODR |= (1 << 5);           // Set pin to HIGH
       delay();
       GPIOA->ODR &= ~(1 << 5);           // Set pin to LOW
       delay();
    }

    return 0;
}
