#line 1 "D:/Clicks_git/S/SAML10_Touch_Click/SW/example/c/PIC/Click_SAML_Touch_PIC.c"
#line 1 "d:/clicks_git/s/saml10_touch_click/sw/example/c/pic/click_saml_touch_types.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;



typedef signed char int_fast8_t;
typedef signed int int_fast16_t;
typedef signed long int int_fast32_t;


typedef unsigned char uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned long int uint_fast32_t;


typedef signed int intptr_t;
typedef unsigned int uintptr_t;


typedef signed long int intmax_t;
typedef unsigned long int uintmax_t;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 11 "d:/clicks_git/s/saml10_touch_click/sw/example/c/pic/click_saml_touch_types.h"
typedef struct
{
 uint8_t button1;
 uint8_t button2;
 uint8_t sw_state;
 uint16_t sw_pos;

} samltouch_state_T;
#line 1 "d:/clicks_git/s/saml10_touch_click/sw/example/c/pic/click_saml_touch_config.h"
#line 1 "d:/clicks_git/s/saml10_touch_click/sw/example/c/pic/click_saml_touch_types.h"
#line 3 "d:/clicks_git/s/saml10_touch_click/sw/example/c/pic/click_saml_touch_config.h"
const uint32_t _SAMLTOUCH_TIMER_LIMIT = 5;
const uint16_t _SAMLTOUCH_BUF_WARNING = 192;
const uint8_t _SAMLTOUCH_POLL_ENABLE = 1;
const uint8_t _SAMLTOUCH_CALLBACK_ENABLE = 0;

const uint32_t _SAMLTOUCH_UART_CFG[ 1 ] =
{
 115200
};
#line 1 "d:/clicks_git/s/saml10_touch_click/sw/example/c/pic/click_saml_touch_timer.h"
#line 1 "d:/clicks_git/s/saml10_touch_click/sw/example/c/pic/click_saml_touch_types.h"
#line 11 "d:/clicks_git/s/saml10_touch_click/sw/example/c/pic/click_saml_touch_timer.h"
uint32_t timerCounter = 0;

static void samltouch_configTimer()
{
 T1CON = 0x01;
 TMR1IF_bit = 0;
 TMR1H = 0xC1;
 TMR1L = 0x80;
 TMR1IE_bit = 1;
 INTCON = 0xC0;
}

void Interrupt()
{
 if (TMR1IF_bit != 0)
 {
 TMR1IF_bit = 0;
 TMR1H = 0xC1;
 TMR1L = 0x80;

 samltouch_tick();
 timerCounter++;
 }
}
#line 35 "D:/Clicks_git/S/SAML10_Touch_Click/SW/example/c/PIC/Click_SAML_Touch_PIC.c"
char demoText[ 500 ] = {0};
samltouch_state_T SAML_Touch;

void samltouch_default_handler( uint8_t *rsp, uint8_t *evArgs )
{
 char *tmp;
 tmp = rsp;
 samltouch_parser(tmp, &SAML_Touch);
}

void systemInit()
{
 mikrobus_uartInit( _MIKROBUS1, &_SAMLTOUCH_UART_CFG[0] );
 mikrobus_logInit( _MIKROBUS3, 115200 );
 mikrobus_logWrite( "---- System Init ----", _LOG_LINE );
 mikrobus_logWrite( "---------------------", _LOG_LINE );
}

void applicationInit()
{

 samltouch_configTimer();


 samltouch_uartDriverInit(( const uint8_t* )&_MIKROBUS1_GPIO, ( const uint8_t* )&_MIKROBUS1_UART);
 samltouch_coreInit( samltouch_default_handler, 1500 );


 samltouch_hfcEnable( 1 );
 timerCounter = 0;
}

void applicationTask()
{

 samltouch_process();

 if(timerCounter > 100)
 {
 if(SAML_Touch.button2 == 1)
 {
 mikrobus_logWrite( "Button 2 is pressed.", _LOG_LINE );
 }
 else if(SAML_Touch.button1 == 1)
 {
 mikrobus_logWrite( "Button 1 is pressed.", _LOG_LINE );
 }
 timerCounter = 0;
 }

 if(SAML_Touch.sw_state == 1)
 {
 mikrobus_logWrite( "Slider is active.", _LOG_LINE );
 if(SAML_Touch.sw_pos != 0)
 {
 mikrobus_logWrite( "Slider position is  ", _LOG_TEXT );
 IntToStr(SAML_Touch.sw_pos, demoText);
 mikrobus_logWrite( demoText, _LOG_LINE );
 }
 }
}

void main()
{
 systemInit();
 applicationInit();

 while (1)
 {
 applicationTask();
 }
}
