;/**************************************************************************//**
; * @file     startup_LM3S.s
; * @brief    CMSIS Cortex-M3 Core Device Startup File for
; *           TI Stellaris
; * @version  V3.00
; * @date     19. December 2011
; *
; * @note
; * Copyright (C) 2011 ARM Limited. All rights reserved.
; *
; * @par
; * ARM Limited (ARM) is supplying this software for use with Cortex-M
; * processor based microcontrollers.  This file can be freely distributed
; * within development tools that are supporting such ARM based processors.
; *
; * @par
; * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
; * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
; * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
; * ARM SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR
; * CONSEQUENTIAL DAMAGES, FOR ANY REASON WHATSOEVER.
; *
; ******************************************************************************/
;/*
;//-------- <<< Use Configuration Wizard in Context Menu >>> ------------------
;*/


; <h> Stack Configuration
;   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Stack_Size      EQU     0x00000400

                AREA    STACK, NOINIT, READWRITE, ALIGN=3
Stack_Mem       SPACE   Stack_Size
__initial_sp


; <h> Heap Configuration
;   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Heap_Size       EQU     0x00000100

                AREA    HEAP, NOINIT, READWRITE, ALIGN=3
__heap_base
Heap_Mem        SPACE   Heap_Size
__heap_limit


                PRESERVE8
                THUMB


; Vector Table Mapped to Address 0 at Reset

                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors
                EXPORT  __Vectors_End
                EXPORT  __Vectors_Size

__Vectors       DCD     __initial_sp              ; Top of Stack
                DCD     Reset_Handler             ; Reset Handler
                DCD     NMI_Handler               ; NMI Handler
                DCD     HardFault_Handler         ; Hard Fault Handler
                DCD     MemManage_Handler         ; MPU Fault Handler
                DCD     BusFault_Handler          ; Bus Fault Handler
                DCD     UsageFault_Handler        ; Usage Fault Handler
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     0                         ; Reserved
                DCD     SVC_Handler               ; SVCall Handler
                DCD     DebugMon_Handler          ; Debug Monitor Handler
                DCD     0                         ; Reserved
                DCD     PendSV_Handler            ; PendSV Handler
                DCD     SysTick_Handler           ; SysTick Handler

                ; External Interrupts

                DCD     GPIOA_Handler             ; GPIO Port A
                DCD     GPIOB_Handler             ; GPIO Port B
                DCD     GPIOC_Handler             ; GPIO Port C
                DCD     GPIOD_Handler             ; GPIO Port D
                DCD     GPIOE_Handler             ; GPIO Port E
                DCD     UART0_Handler             ; UART0 Rx and Tx
                DCD     UART1_Handler             ; UART1 Rx and Tx
                DCD     SSI0_Handler              ; SSI0 Rx and Tx
                DCD     I2C0_Handler              ; I2C0 Master and Slave
                DCD     PMW0_FAULT_Handler        ; PWM Fault
                DCD     PWM0_0_Handler            ; PWM Generator 0
                DCD     PWM0_1_Handler            ; PWM Generator 1
                DCD     PWM0_2_Handler            ; PWM Generator 2
                DCD     QEI0_Handler              ; Quadrature Encoder 0
                DCD     ADC0SS0_Handler           ; ADC Sequence 0
                DCD     ADC0SS1_Handler           ; ADC Sequence 1
                DCD     ADC0SS2_Handler           ; ADC Sequence 2
                DCD     ADC0SS3_Handler           ; ADC Sequence 3
                DCD     WDT0_Handler              ; Watchdog timer
                DCD     TIMER0A_Handler           ; Timer 0 subtimer A
                DCD     TIMER0B_Handler           ; Timer 0 subtimer B
                DCD     TIMER1A_Handler           ; Timer 1 subtimer A
                DCD     TIMER1B_Handler           ; Timer 1 subtimer B
                DCD     TIMER2A_Handler           ; Timer 2 subtimer A
                DCD     TIMER2B_Handler           ; Timer 2 subtimer B
                DCD     COMP0_Handler             ; Analog Comparator 0
                DCD     COMP1_Handler             ; Analog Comparator 1
                DCD     COMP2_Handler             ; Analog Comparator 2
                DCD     SYSCTL_Handler            ; System Control (PLL, OSC, BO)
                DCD     FLASH_Handler             ; FLASH Control
                DCD     GPIOF_Handler             ; GPIO Port F
                DCD     GPIOG_Handler             ; GPIO Port G
                DCD     GPIOH_Handler             ; GPIO Port H
                DCD     UART2_Handler             ; UART2 Rx and Tx
                DCD     SSI1_Handler              ; SSI1 Rx and Tx
                DCD     TIMER3A_Handler           ; Timer 3 subtimer A
                DCD     TIMER3B_Handler           ; Timer 3 subtimer B
                DCD     I2C1_Handler              ; I2C1 Master and Slave
                DCD     QEI1_Handler              ; Quadrature Encoder 1
                DCD     CAN0_Handler              ; CAN0
                DCD     CAN1_Handler              ; CAN1
                DCD     CAN2_Handler              ; CAN2
                DCD     ETH0_Handler              ; Ethernet
                DCD     HIB_Handler               ; Hibernate
                DCD     USB0_Handler              ; USB0
                DCD     PWM0_3_Handler            ; PWM Generator 3
                DCD     UDMA_Handler              ; uDMA Software Transfer
                DCD     UDMAERR_Handler           ; uDMA Error
                DCD     ADC1SS0_Handler           ; ADC1 Sequence 0
                DCD     ADC1SS1_Handler           ; ADC1 Sequence 1
                DCD     ADC1SS2_Handler           ; ADC1 Sequence 2
                DCD     ADC1SS3_Handler           ; ADC1 Sequence 3
                DCD     I2S0_Handler              ; I2S0
                DCD     EPI0_Handler              ; External Bus Interface 0
                DCD     GPIOJ_Handler             ; GPIO Port J
__Vectors_End

__Vectors_Size  EQU     __Vectors_End - __Vectors

                AREA    |.text|, CODE, READONLY


; Reset Handler

Reset_Handler   PROC
                EXPORT  Reset_Handler             [WEAK]
                IMPORT  SystemInit
                IMPORT  __main
                LDR     R0, =SystemInit
                BLX     R0
                LDR     R0, =__main
                BX      R0
                ENDP


; Dummy Exception Handlers (infinite loops which can be modified)

NMI_Handler     PROC
                EXPORT  NMI_Handler               [WEAK]
                B       .
                ENDP
HardFault_Handler\
                PROC
                EXPORT  HardFault_Handler         [WEAK]
                B       .
                ENDP
MemManage_Handler\
                PROC
                EXPORT  MemManage_Handler         [WEAK]
                B       .
                ENDP
BusFault_Handler\
                PROC
                EXPORT  BusFault_Handler          [WEAK]
                B       .
                ENDP
UsageFault_Handler\
                PROC
                EXPORT  UsageFault_Handler        [WEAK]
                B       .
                ENDP
SVC_Handler     PROC
                EXPORT  SVC_Handler               [WEAK]
                B       .
                ENDP
DebugMon_Handler\
                PROC
                EXPORT  DebugMon_Handler          [WEAK]
                B       .
                ENDP
PendSV_Handler\
                PROC
                EXPORT  PendSV_Handler            [WEAK]
                B       .
                ENDP
SysTick_Handler\
                PROC
                EXPORT  SysTick_Handler           [WEAK]
                B       .
                ENDP

GPIOA_Handler\
                PROC
                EXPORT  GPIOA_Handler [WEAK]
                B       .
                ENDP

GPIOB_Handler\
                PROC
                EXPORT  GPIOB_Handler [WEAK]
                B       .
                ENDP

GPIOC_Handler\
                PROC
                EXPORT  GPIOC_Handler [WEAK]
                B       .
                ENDP

GPIOD_Handler\
                PROC
                EXPORT  GPIOD_Handler [WEAK]
                B       .
                ENDP

GPIOE_Handler\
                PROC
                EXPORT  GPIOE_Handler [WEAK]
                B       .
                ENDP

UART0_Handler\
                PROC
                EXPORT  UART0_Handler [WEAK]
                B       .
                ENDP

UART1_Handler\
                PROC
                EXPORT  UART1_Handler [WEAK]
                B       .
                ENDP

SSI0_Handler\
                PROC
                EXPORT  SSI0_Handler [WEAK]
                B       .
                ENDP

I2C0_Handler\
                PROC
                EXPORT  I2C0_Handler [WEAK]
                B       .
                ENDP

PMW0_FAULT_Handler\
                PROC
                EXPORT  PMW0_FAULT_Handler [WEAK]
                B       .
                ENDP

PWM0_0_Handler\
                PROC
                EXPORT  PWM0_0_Handler [WEAK]
                B       .
                ENDP

PWM0_1_Handler\
                PROC
                EXPORT  PWM0_1_Handler [WEAK]
                B       .
                ENDP

PWM0_2_Handler\
                PROC
                EXPORT  PWM0_2_Handler [WEAK]
                B       .
                ENDP

QEI0_Handler\
                PROC
                EXPORT  QEI0_Handler [WEAK]
                B       .
                ENDP

ADC0SS0_Handler\
                PROC
                EXPORT  ADC0SS0_Handler [WEAK]
                B       .
                ENDP

ADC0SS1_Handler\
                PROC
                EXPORT  ADC0SS1_Handler [WEAK]
                B       .
                ENDP

ADC0SS2_Handler\
                PROC
                EXPORT  ADC0SS2_Handler [WEAK]
                B       .
                ENDP

ADC0SS3_Handler\
                PROC
                EXPORT  ADC0SS3_Handler [WEAK]
                B       .
                ENDP

WDT0_Handler\
                PROC
                EXPORT  WDT0_Handler [WEAK]
                B       .
                ENDP

TIMER0A_Handler\
                PROC
                EXPORT  TIMER0A_Handler [WEAK]
                B       .
                ENDP

TIMER0B_Handler\
                PROC
                EXPORT  TIMER0B_Handler [WEAK]
                B       .
                ENDP

TIMER1A_Handler\
                PROC
                EXPORT  TIMER1A_Handler [WEAK]
                B       .
                ENDP

TIMER1B_Handler\
                PROC
                EXPORT  TIMER1B_Handler [WEAK]
                B       .
                ENDP

TIMER2A_Handler\
                PROC
                EXPORT  TIMER2A_Handler [WEAK]
                B       .
                ENDP

TIMER2B_Handler\
                PROC
                EXPORT  TIMER2B_Handler [WEAK]
                B       .
                ENDP

COMP0_Handler\
                PROC
                EXPORT  COMP0_Handler [WEAK]
                B       .
                ENDP

COMP1_Handler\
                PROC
                EXPORT  COMP1_Handler [WEAK]
                B       .
                ENDP

COMP2_Handler\
                PROC
                EXPORT  COMP2_Handler [WEAK]
                B       .
                ENDP

SYSCTL_Handler\
                PROC
                EXPORT  SYSCTL_Handler [WEAK]
                B       .
                ENDP

FLASH_Handler\
                PROC
                EXPORT  FLASH_Handler [WEAK]
                B       .
                ENDP

GPIOF_Handler\
                PROC
                EXPORT  GPIOF_Handler [WEAK]
                B       .
                ENDP

GPIOG_Handler\
                PROC
                EXPORT  GPIOG_Handler [WEAK]
                B       .
                ENDP

GPIOH_Handler\
                PROC
                EXPORT  GPIOH_Handler [WEAK]
                B       .
                ENDP

UART2_Handler\
                PROC
                EXPORT  UART2_Handler [WEAK]
                B       .
                ENDP

SSI1_Handler\
                PROC
                EXPORT  SSI1_Handler [WEAK]
                B       .
                ENDP

TIMER3A_Handler\
                PROC
                EXPORT  TIMER3A_Handler [WEAK]
                B       .
                ENDP

TIMER3B_Handler\
                PROC
                EXPORT  TIMER3B_Handler [WEAK]
                B       .
                ENDP

I2C1_Handler\
                PROC
                EXPORT  I2C1_Handler [WEAK]
                B       .
                ENDP

QEI1_Handler\
                PROC
                EXPORT  QEI1_Handler [WEAK]
                B       .
                ENDP

CAN0_Handler\
                PROC
                EXPORT  CAN0_Handler [WEAK]
                B       .
                ENDP

CAN1_Handler\
                PROC
                EXPORT  CAN1_Handler [WEAK]
                B       .
                ENDP

CAN2_Handler\
                PROC
                EXPORT  CAN2_Handler [WEAK]
                B       .
                ENDP

ETH0_Handler\
                PROC
                EXPORT  ETH0_Handler [WEAK]
                B       .
                ENDP

HIB_Handler\
                PROC
                EXPORT  HIB_Handler [WEAK]
                B       .
                ENDP

USB0_Handler\
                PROC
                EXPORT  USB0_Handler [WEAK]
                B       .
                ENDP

PWM0_3_Handler\
                PROC
                EXPORT  PWM0_3_Handler [WEAK]
                B       .
                ENDP

UDMA_Handler\
                PROC
                EXPORT  UDMA_Handler [WEAK]
                B       .
                ENDP

UDMAERR_Handler\
                PROC
                EXPORT  UDMAERR_Handler [WEAK]
                B       .
                ENDP

ADC1SS0_Handler\
                PROC
                EXPORT  ADC1SS0_Handler [WEAK]
                B       .
                ENDP

ADC1SS1_Handler\
                PROC
                EXPORT  ADC1SS1_Handler [WEAK]
                B       .
                ENDP

ADC1SS2_Handler\
                PROC
                EXPORT  ADC1SS2_Handler [WEAK]
                B       .
                ENDP

ADC1SS3_Handler\
                PROC
                EXPORT  ADC1SS3_Handler [WEAK]
                B       .
                ENDP

I2S0_Handler\
                PROC
                EXPORT  I2S0_Handler [WEAK]
                B       .
                ENDP

EPI0_Handler\
                PROC
                EXPORT  EPI0_Handler [WEAK]
                B       .
                ENDP

GPIOJ_Handler\
                PROC
                EXPORT  GPIOJ_Handler [WEAK]
                B       .
                ENDP

                ALIGN


; User Initial Stack & Heap

                IF      :DEF:__MICROLIB

                EXPORT  __initial_sp
                EXPORT  __heap_base
                EXPORT  __heap_limit

                ELSE

                IMPORT  __use_two_region_memory
                EXPORT  __user_initial_stackheap
__user_initial_stackheap

                LDR     R0, =  Heap_Mem
                LDR     R1, =(Stack_Mem + Stack_Size)
                LDR     R2, = (Heap_Mem +  Heap_Size)
                LDR     R3, = Stack_Mem
                BX      LR

                ALIGN

                ENDIF


                END
