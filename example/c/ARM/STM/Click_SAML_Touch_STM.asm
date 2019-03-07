Click_SAML_Touch_STM_samltouch_configTimer:
;click_saml_touch_timer.h,15 :: 		static void samltouch_configTimer()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;click_saml_touch_timer.h,17 :: 		RCC_APB1ENR.TIM2EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
_SX	[R0, ByteOffset(RCC_APB1ENR+0)]
;click_saml_touch_timer.h,18 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
_SX	[R0, ByteOffset(TIM2_CR1+0)]
;click_saml_touch_timer.h,19 :: 		TIM2_PSC = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;click_saml_touch_timer.h,20 :: 		TIM2_ARR = 35999;
MOVW	R1, #35999
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;click_saml_touch_timer.h,21 :: 		NVIC_IntEnable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;click_saml_touch_timer.h,22 :: 		TIM2_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
_SX	[R0, ByteOffset(TIM2_DIER+0)]
;click_saml_touch_timer.h,23 :: 		TIM2_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
_SX	[R0, ByteOffset(TIM2_CR1+0)]
;click_saml_touch_timer.h,24 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;click_saml_touch_timer.h,25 :: 		}
L_end_samltouch_configTimer:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of Click_SAML_Touch_STM_samltouch_configTimer
_Timer_interrupt:
;click_saml_touch_timer.h,27 :: 		void Timer_interrupt() iv IVT_INT_TIM2
SUB	SP, SP, #4
STR	LR, [SP, #0]
;click_saml_touch_timer.h,29 :: 		samltouch_tick();
BL	_samltouch_tick+0
;click_saml_touch_timer.h,30 :: 		timerCounter++;
MOVW	R1, #lo_addr(_timerCounter+0)
MOVT	R1, #hi_addr(_timerCounter+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;click_saml_touch_timer.h,31 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
_SX	[R0, ByteOffset(TIM2_SR+0)]
;click_saml_touch_timer.h,32 :: 		}
L_end_Timer_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer_interrupt
_samltouch_default_handler:
;Click_SAML_Touch_STM.c,38 :: 		void samltouch_default_handler( uint8_t *rsp, uint8_t *evArgs )
; rsp start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; rsp end address is: 0 (R0)
; rsp start address is: 0 (R0)
;Click_SAML_Touch_STM.c,42 :: 		samltouch_parser(tmp, &SAML_Touch);
MOVW	R1, #lo_addr(_SAML_Touch+0)
MOVT	R1, #hi_addr(_SAML_Touch+0)
; rsp end address is: 0 (R0)
BL	_samltouch_parser+0
;Click_SAML_Touch_STM.c,43 :: 		}
L_end_samltouch_default_handler:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _samltouch_default_handler
_systemInit:
;Click_SAML_Touch_STM.c,45 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_SAML_Touch_STM.c,47 :: 		mikrobus_uartInit( _MIKROBUS1, &_SAMLTOUCH_UART_CFG[0] );
MOVW	R0, #lo_addr(__SAMLTOUCH_UART_CFG+0)
MOVT	R0, #hi_addr(__SAMLTOUCH_UART_CFG+0)
MOV	R1, R0
MOVS	R0, #0
BL	_mikrobus_uartInit+0
;Click_SAML_Touch_STM.c,48 :: 		mikrobus_logInit( _LOG_USBUART_A, 115200 );
MOV	R1, #115200
MOVS	R0, #32
BL	_mikrobus_logInit+0
;Click_SAML_Touch_STM.c,49 :: 		mikrobus_logWrite( "---- System Init ----", _LOG_LINE );
MOVW	R0, #lo_addr(?lstr1_Click_SAML_Touch_STM+0)
MOVT	R0, #hi_addr(?lstr1_Click_SAML_Touch_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_SAML_Touch_STM.c,50 :: 		mikrobus_logWrite( "---------------------", _LOG_LINE );
MOVW	R0, #lo_addr(?lstr2_Click_SAML_Touch_STM+0)
MOVT	R0, #hi_addr(?lstr2_Click_SAML_Touch_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_SAML_Touch_STM.c,51 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;Click_SAML_Touch_STM.c,53 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_SAML_Touch_STM.c,56 :: 		samltouch_configTimer();
BL	Click_SAML_Touch_STM_samltouch_configTimer+0
;Click_SAML_Touch_STM.c,59 :: 		samltouch_uartDriverInit((T_SAMLTOUCH_P)&_MIKROBUS1_GPIO, (T_SAMLTOUCH_P)&_MIKROBUS1_UART);
MOVW	R1, #lo_addr(__MIKROBUS1_UART+0)
MOVT	R1, #hi_addr(__MIKROBUS1_UART+0)
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_samltouch_uartDriverInit+0
;Click_SAML_Touch_STM.c,60 :: 		samltouch_coreInit( samltouch_default_handler, 1500 );
MOVW	R0, #lo_addr(_samltouch_default_handler+0)
MOVT	R0, #hi_addr(_samltouch_default_handler+0)
MOVW	R1, #1500
BL	_samltouch_coreInit+0
;Click_SAML_Touch_STM.c,63 :: 		samltouch_hfcEnable( 1 );
MOVS	R0, #1
BL	_samltouch_hfcEnable+0
;Click_SAML_Touch_STM.c,64 :: 		timerCounter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_timerCounter+0)
MOVT	R0, #hi_addr(_timerCounter+0)
STR	R1, [R0, #0]
;Click_SAML_Touch_STM.c,65 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_applicationTask:
;Click_SAML_Touch_STM.c,67 :: 		void applicationTask()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_SAML_Touch_STM.c,70 :: 		samltouch_process();
BL	_samltouch_process+0
;Click_SAML_Touch_STM.c,72 :: 		if(timerCounter > 100)
MOVW	R0, #lo_addr(_timerCounter+0)
MOVT	R0, #hi_addr(_timerCounter+0)
LDR	R0, [R0, #0]
CMP	R0, #100
IT	LS
BLS	L_applicationTask0
;Click_SAML_Touch_STM.c,74 :: 		if(SAML_Touch.button2 == 1)
MOVW	R0, #lo_addr(_SAML_Touch+1)
MOVT	R0, #hi_addr(_SAML_Touch+1)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_applicationTask1
;Click_SAML_Touch_STM.c,76 :: 		mikrobus_logWrite( "Button 2 is pressed.", _LOG_LINE );
MOVW	R0, #lo_addr(?lstr3_Click_SAML_Touch_STM+0)
MOVT	R0, #hi_addr(?lstr3_Click_SAML_Touch_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_SAML_Touch_STM.c,77 :: 		}
IT	AL
BAL	L_applicationTask2
L_applicationTask1:
;Click_SAML_Touch_STM.c,78 :: 		else if(SAML_Touch.button1 == 1)
MOVW	R0, #lo_addr(_SAML_Touch+0)
MOVT	R0, #hi_addr(_SAML_Touch+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_applicationTask3
;Click_SAML_Touch_STM.c,80 :: 		mikrobus_logWrite( "Button 1 is pressed.", _LOG_LINE );
MOVW	R0, #lo_addr(?lstr4_Click_SAML_Touch_STM+0)
MOVT	R0, #hi_addr(?lstr4_Click_SAML_Touch_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_SAML_Touch_STM.c,81 :: 		}
L_applicationTask3:
L_applicationTask2:
;Click_SAML_Touch_STM.c,82 :: 		timerCounter = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_timerCounter+0)
MOVT	R0, #hi_addr(_timerCounter+0)
STR	R1, [R0, #0]
;Click_SAML_Touch_STM.c,83 :: 		}
L_applicationTask0:
;Click_SAML_Touch_STM.c,85 :: 		if(SAML_Touch.sw_state == 1)
MOVW	R0, #lo_addr(_SAML_Touch+2)
MOVT	R0, #hi_addr(_SAML_Touch+2)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_applicationTask4
;Click_SAML_Touch_STM.c,87 :: 		mikrobus_logWrite( "Slider is active.", _LOG_LINE );
MOVW	R0, #lo_addr(?lstr5_Click_SAML_Touch_STM+0)
MOVT	R0, #hi_addr(?lstr5_Click_SAML_Touch_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_SAML_Touch_STM.c,88 :: 		if(SAML_Touch.sw_pos != 0)
MOVW	R0, #lo_addr(_SAML_Touch+4)
MOVT	R0, #hi_addr(_SAML_Touch+4)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_applicationTask5
;Click_SAML_Touch_STM.c,90 :: 		mikrobus_logWrite( "Slider position is  ", _LOG_TEXT );
MOVW	R0, #lo_addr(?lstr6_Click_SAML_Touch_STM+0)
MOVT	R0, #hi_addr(?lstr6_Click_SAML_Touch_STM+0)
MOVS	R1, #1
BL	_mikrobus_logWrite+0
;Click_SAML_Touch_STM.c,91 :: 		IntToStr(SAML_Touch.sw_pos, demoText);
MOVW	R0, #lo_addr(_SAML_Touch+4)
MOVT	R0, #hi_addr(_SAML_Touch+4)
LDRH	R0, [R0, #0]
MOVW	R1, #lo_addr(_demoText+0)
MOVT	R1, #hi_addr(_demoText+0)
BL	_IntToStr+0
;Click_SAML_Touch_STM.c,92 :: 		mikrobus_logWrite( demoText, _LOG_LINE );
MOVS	R1, #2
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_mikrobus_logWrite+0
;Click_SAML_Touch_STM.c,93 :: 		}
L_applicationTask5:
;Click_SAML_Touch_STM.c,94 :: 		}
L_applicationTask4:
;Click_SAML_Touch_STM.c,95 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationTask
_main:
;Click_SAML_Touch_STM.c,97 :: 		void main()
;Click_SAML_Touch_STM.c,99 :: 		systemInit();
BL	_systemInit+0
;Click_SAML_Touch_STM.c,100 :: 		applicationInit();
BL	_applicationInit+0
;Click_SAML_Touch_STM.c,102 :: 		while (1)
L_main6:
;Click_SAML_Touch_STM.c,104 :: 		applicationTask();
BL	_applicationTask+0
;Click_SAML_Touch_STM.c,105 :: 		}
IT	AL
BAL	L_main6
;Click_SAML_Touch_STM.c,106 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
