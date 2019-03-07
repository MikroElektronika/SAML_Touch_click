
Click_SAML_Touch_PIC_samltouch_configTimer:

;click_saml_touch_timer.h,15 :: 		static void samltouch_configTimer()
;click_saml_touch_timer.h,17 :: 		T1CON         = 0x01;
	MOVLW       1
	MOVWF       T1CON+0 
;click_saml_touch_timer.h,18 :: 		TMR1IF_bit         = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;click_saml_touch_timer.h,19 :: 		TMR1H         = 0xC1;
	MOVLW       193
	MOVWF       TMR1H+0 
;click_saml_touch_timer.h,20 :: 		TMR1L         = 0x80;
	MOVLW       128
	MOVWF       TMR1L+0 
;click_saml_touch_timer.h,21 :: 		TMR1IE_bit         = 1;
	BSF         TMR1IE_bit+0, BitPos(TMR1IE_bit+0) 
;click_saml_touch_timer.h,22 :: 		INTCON         = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;click_saml_touch_timer.h,23 :: 		}
L_end_samltouch_configTimer:
	RETURN      0
; end of Click_SAML_Touch_PIC_samltouch_configTimer

_Interrupt:

;click_saml_touch_timer.h,25 :: 		void Interrupt()
;click_saml_touch_timer.h,27 :: 		if (TMR1IF_bit != 0)
	BTFSS       TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
	GOTO        L_Interrupt0
;click_saml_touch_timer.h,29 :: 		TMR1IF_bit = 0;
	BCF         TMR1IF_bit+0, BitPos(TMR1IF_bit+0) 
;click_saml_touch_timer.h,30 :: 		TMR1H         = 0xC1;
	MOVLW       193
	MOVWF       TMR1H+0 
;click_saml_touch_timer.h,31 :: 		TMR1L         = 0x80;
	MOVLW       128
	MOVWF       TMR1L+0 
;click_saml_touch_timer.h,33 :: 		samltouch_tick();
	CALL        _samltouch_tick+0, 0
;click_saml_touch_timer.h,34 :: 		timerCounter++;
	MOVLW       1
	ADDWF       _timerCounter+0, 1 
	MOVLW       0
	ADDWFC      _timerCounter+1, 1 
	ADDWFC      _timerCounter+2, 1 
	ADDWFC      _timerCounter+3, 1 
;click_saml_touch_timer.h,35 :: 		}
L_Interrupt0:
;click_saml_touch_timer.h,36 :: 		}
L_end_Interrupt:
L__Interrupt11:
	RETFIE      1
; end of _Interrupt

_samltouch_default_handler:

;Click_SAML_Touch_PIC.c,40 :: 		void samltouch_default_handler( uint8_t *rsp, uint8_t *evArgs )
;Click_SAML_Touch_PIC.c,44 :: 		samltouch_parser(tmp, &SAML_Touch);
	MOVF        FARG_samltouch_default_handler_rsp+0, 0 
	MOVWF       FARG_samltouch_parser_dataIn+0 
	MOVF        FARG_samltouch_default_handler_rsp+1, 0 
	MOVWF       FARG_samltouch_parser_dataIn+1 
	MOVLW       _SAML_Touch+0
	MOVWF       FARG_samltouch_parser_state+0 
	MOVLW       hi_addr(_SAML_Touch+0)
	MOVWF       FARG_samltouch_parser_state+1 
	CALL        _samltouch_parser+0, 0
;Click_SAML_Touch_PIC.c,45 :: 		}
L_end_samltouch_default_handler:
	RETURN      0
; end of _samltouch_default_handler

_systemInit:

;Click_SAML_Touch_PIC.c,47 :: 		void systemInit()
;Click_SAML_Touch_PIC.c,49 :: 		mikrobus_uartInit( _MIKROBUS1, &_SAMLTOUCH_UART_CFG[0] );
	CLRF        FARG_mikrobus_uartInit_bus+0 
	MOVLW       __SAMLTOUCH_UART_CFG+0
	MOVWF       FARG_mikrobus_uartInit_cfg+0 
	MOVLW       hi_addr(__SAMLTOUCH_UART_CFG+0)
	MOVWF       FARG_mikrobus_uartInit_cfg+1 
	MOVLW       higher_addr(__SAMLTOUCH_UART_CFG+0)
	MOVWF       FARG_mikrobus_uartInit_cfg+2 
	CALL        _mikrobus_uartInit+0, 0
;Click_SAML_Touch_PIC.c,50 :: 		mikrobus_logInit( _MIKROBUS3, 115200 );
	MOVLW       2
	MOVWF       FARG_mikrobus_logInit_port+0 
	MOVLW       0
	MOVWF       FARG_mikrobus_logInit_baud+0 
	MOVLW       194
	MOVWF       FARG_mikrobus_logInit_baud+1 
	MOVLW       1
	MOVWF       FARG_mikrobus_logInit_baud+2 
	MOVLW       0
	MOVWF       FARG_mikrobus_logInit_baud+3 
	CALL        _mikrobus_logInit+0, 0
;Click_SAML_Touch_PIC.c,51 :: 		mikrobus_logWrite( "---- System Init ----", _LOG_LINE );
	MOVLW       ?lstr1_Click_SAML_Touch_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr1_Click_SAML_Touch_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_SAML_Touch_PIC.c,52 :: 		mikrobus_logWrite( "---------------------", _LOG_LINE );
	MOVLW       ?lstr2_Click_SAML_Touch_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr2_Click_SAML_Touch_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_SAML_Touch_PIC.c,53 :: 		}
L_end_systemInit:
	RETURN      0
; end of _systemInit

_applicationInit:

;Click_SAML_Touch_PIC.c,55 :: 		void applicationInit()
;Click_SAML_Touch_PIC.c,58 :: 		samltouch_configTimer();
	CALL        Click_SAML_Touch_PIC_samltouch_configTimer+0, 0
;Click_SAML_Touch_PIC.c,61 :: 		samltouch_uartDriverInit((T_SAMLTOUCH_P)&_MIKROBUS1_GPIO, (T_SAMLTOUCH_P)&_MIKROBUS1_UART);
	MOVLW       __MIKROBUS1_GPIO+0
	MOVWF       FARG_samltouch_uartDriverInit_gpioObj+0 
	MOVLW       hi_addr(__MIKROBUS1_GPIO+0)
	MOVWF       FARG_samltouch_uartDriverInit_gpioObj+1 
	MOVLW       higher_addr(__MIKROBUS1_GPIO+0)
	MOVWF       FARG_samltouch_uartDriverInit_gpioObj+2 
	MOVLW       __MIKROBUS1_UART+0
	MOVWF       FARG_samltouch_uartDriverInit_uartObj+0 
	MOVLW       hi_addr(__MIKROBUS1_UART+0)
	MOVWF       FARG_samltouch_uartDriverInit_uartObj+1 
	MOVLW       higher_addr(__MIKROBUS1_UART+0)
	MOVWF       FARG_samltouch_uartDriverInit_uartObj+2 
	CALL        _samltouch_uartDriverInit+0, 0
;Click_SAML_Touch_PIC.c,62 :: 		samltouch_coreInit( samltouch_default_handler, 1500 );
	MOVLW       _samltouch_default_handler+0
	MOVWF       FARG_samltouch_coreInit_defaultHdl+0 
	MOVLW       hi_addr(_samltouch_default_handler+0)
	MOVWF       FARG_samltouch_coreInit_defaultHdl+1 
	MOVLW       FARG_samltouch_default_handler_rsp+0
	MOVWF       FARG_samltouch_coreInit_defaultHdl+2 
	MOVLW       hi_addr(FARG_samltouch_default_handler_rsp+0)
	MOVWF       FARG_samltouch_coreInit_defaultHdl+3 
	MOVLW       220
	MOVWF       FARG_samltouch_coreInit_defaultWdog+0 
	MOVLW       5
	MOVWF       FARG_samltouch_coreInit_defaultWdog+1 
	MOVLW       0
	MOVWF       FARG_samltouch_coreInit_defaultWdog+2 
	MOVWF       FARG_samltouch_coreInit_defaultWdog+3 
	CALL        _samltouch_coreInit+0, 0
;Click_SAML_Touch_PIC.c,65 :: 		samltouch_hfcEnable( 1 );
	MOVLW       1
	MOVWF       FARG_samltouch_hfcEnable_hfcState+0 
	CALL        _samltouch_hfcEnable+0, 0
;Click_SAML_Touch_PIC.c,66 :: 		timerCounter = 0;
	CLRF        _timerCounter+0 
	CLRF        _timerCounter+1 
	CLRF        _timerCounter+2 
	CLRF        _timerCounter+3 
;Click_SAML_Touch_PIC.c,67 :: 		}
L_end_applicationInit:
	RETURN      0
; end of _applicationInit

_applicationTask:

;Click_SAML_Touch_PIC.c,69 :: 		void applicationTask()
;Click_SAML_Touch_PIC.c,72 :: 		samltouch_process();
	CALL        _samltouch_process+0, 0
;Click_SAML_Touch_PIC.c,74 :: 		if(timerCounter > 100)
	MOVF        _timerCounter+3, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__applicationTask16
	MOVF        _timerCounter+2, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__applicationTask16
	MOVF        _timerCounter+1, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__applicationTask16
	MOVF        _timerCounter+0, 0 
	SUBLW       100
L__applicationTask16:
	BTFSC       STATUS+0, 0 
	GOTO        L_applicationTask1
;Click_SAML_Touch_PIC.c,76 :: 		if(SAML_Touch.button2 == 1)
	MOVF        _SAML_Touch+1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_applicationTask2
;Click_SAML_Touch_PIC.c,78 :: 		mikrobus_logWrite( "Button 2 is pressed.", _LOG_LINE );
	MOVLW       ?lstr3_Click_SAML_Touch_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr3_Click_SAML_Touch_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_SAML_Touch_PIC.c,79 :: 		}
	GOTO        L_applicationTask3
L_applicationTask2:
;Click_SAML_Touch_PIC.c,80 :: 		else if(SAML_Touch.button1 == 1)
	MOVF        _SAML_Touch+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_applicationTask4
;Click_SAML_Touch_PIC.c,82 :: 		mikrobus_logWrite( "Button 1 is pressed.", _LOG_LINE );
	MOVLW       ?lstr4_Click_SAML_Touch_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr4_Click_SAML_Touch_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_SAML_Touch_PIC.c,83 :: 		}
L_applicationTask4:
L_applicationTask3:
;Click_SAML_Touch_PIC.c,84 :: 		timerCounter = 0;
	CLRF        _timerCounter+0 
	CLRF        _timerCounter+1 
	CLRF        _timerCounter+2 
	CLRF        _timerCounter+3 
;Click_SAML_Touch_PIC.c,85 :: 		}
L_applicationTask1:
;Click_SAML_Touch_PIC.c,87 :: 		if(SAML_Touch.sw_state == 1)
	MOVF        _SAML_Touch+2, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_applicationTask5
;Click_SAML_Touch_PIC.c,89 :: 		mikrobus_logWrite( "Slider is active.", _LOG_LINE );
	MOVLW       ?lstr5_Click_SAML_Touch_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr5_Click_SAML_Touch_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_SAML_Touch_PIC.c,90 :: 		if(SAML_Touch.sw_pos != 0)
	MOVLW       0
	XORWF       _SAML_Touch+4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__applicationTask17
	MOVLW       0
	XORWF       _SAML_Touch+3, 0 
L__applicationTask17:
	BTFSC       STATUS+0, 2 
	GOTO        L_applicationTask6
;Click_SAML_Touch_PIC.c,92 :: 		mikrobus_logWrite( "Slider position is  ", _LOG_TEXT );
	MOVLW       ?lstr6_Click_SAML_Touch_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr6_Click_SAML_Touch_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       1
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_SAML_Touch_PIC.c,93 :: 		IntToStr(SAML_Touch.sw_pos, demoText);
	MOVF        _SAML_Touch+3, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _SAML_Touch+4, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _demoText+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_demoText+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;Click_SAML_Touch_PIC.c,94 :: 		mikrobus_logWrite( demoText, _LOG_LINE );
	MOVLW       _demoText+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(_demoText+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_SAML_Touch_PIC.c,95 :: 		}
L_applicationTask6:
;Click_SAML_Touch_PIC.c,96 :: 		}
L_applicationTask5:
;Click_SAML_Touch_PIC.c,97 :: 		}
L_end_applicationTask:
	RETURN      0
; end of _applicationTask

_main:

;Click_SAML_Touch_PIC.c,99 :: 		void main()
;Click_SAML_Touch_PIC.c,101 :: 		systemInit();
	CALL        _systemInit+0, 0
;Click_SAML_Touch_PIC.c,102 :: 		applicationInit();
	CALL        _applicationInit+0, 0
;Click_SAML_Touch_PIC.c,104 :: 		while (1)
L_main7:
;Click_SAML_Touch_PIC.c,106 :: 		applicationTask();
	CALL        _applicationTask+0, 0
;Click_SAML_Touch_PIC.c,107 :: 		}
	GOTO        L_main7
;Click_SAML_Touch_PIC.c,108 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
