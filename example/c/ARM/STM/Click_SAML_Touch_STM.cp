#line 1 "D:/Clicks_git/S/SAML10_Touch_Click/SW/example/c/ARM/STM/Click_SAML_Touch_STM.c"
#line 1 "d:/clicks_git/s/saml10_touch_click/sw/example/c/arm/stm/click_saml_touch_types.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdbool.h"



 typedef char _Bool;
#line 1 "d:/clicks_git/s/saml10_touch_click/sw/example/c/arm/stm/click_saml_touch_config.h"
#line 1 "d:/clicks_git/s/saml10_touch_click/sw/example/c/arm/stm/click_saml_touch_types.h"
#line 3 "d:/clicks_git/s/saml10_touch_click/sw/example/c/arm/stm/click_saml_touch_config.h"
const uint32_t _SAMLTOUCH_TIMER_LIMIT = 5;
const uint16_t _SAMLTOUCH_BUF_WARNING = 250;
const uint8_t _SAMLTOUCH_POLL_ENABLE = 1;
const uint8_t _SAMLTOUCH_CALLBACK_ENABLE = 0;

const uint32_t _SAMLTOUCH_UART_CFG[ 4 ] =
{
 115200,
 _UART_8_BIT_DATA,
 _UART_NOPARITY,
 _UART_ONE_STOPBIT
};
#line 1 "d:/clicks_git/s/saml10_touch_click/sw/example/c/arm/stm/click_saml_touch_timer.h"
#line 1 "d:/clicks_git/s/saml10_touch_click/sw/example/c/arm/stm/click_saml_touch_types.h"
#line 1 "d:/clicks_git/s/saml10_touch_click/sw/library/__samltouch_driver.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdbool.h"
#line 53 "d:/clicks_git/s/saml10_touch_click/sw/library/__samltouch_driver.h"
extern const uint8_t _SAMLTOUCH_UNKNOWN ;
extern const uint8_t _SAMLTOUCH_TEST ;
extern const uint8_t _SAMLTOUCH_SET ;
extern const uint8_t _SAMLTOUCH_GET ;
extern const uint8_t _SAMLTOUCH_URC ;
extern const uint8_t _SAMLTOUCH_EXEC ;



extern const uint8_t _SAMLTOUCH_EVARG_START_T ;
extern const uint8_t _SAMLTOUCH_EVARG_END_T ;
extern const uint8_t _SAMLTOUCH_EVARG_EVENT_T ;

extern const uint8_t _SAMLTOUCH_EVENT_RESPONSE ;
extern const uint8_t _SAMLTOUCH_EVENT_TIMEOUT ;
extern const uint8_t _SAMLTOUCH_EVENT_BUFFER_OUT ;
extern const uint8_t _SAMLTOUCH_EVENT_CALLBACK ;


typedef struct
{
 uint8_t button1;
 uint8_t button2;
 uint8_t sw_state;
 uint16_t sw_pos;

} samltouch_state_T;
#line 85 "d:/clicks_git/s/saml10_touch_click/sw/library/__samltouch_driver.h"
typedef void ( *T_samltouch_handler )( char *buffer, uint8_t *evArgs );
#line 101 "d:/clicks_git/s/saml10_touch_click/sw/library/__samltouch_driver.h"
void samltouch_uartDriverInit( const uint8_t*  gpioObj,  const uint8_t*  uartObj);
#line 113 "d:/clicks_git/s/saml10_touch_click/sw/library/__samltouch_driver.h"
void samltouch_coreInit( T_samltouch_handler defaultHdl, uint32_t defaultWdog );
#line 125 "d:/clicks_git/s/saml10_touch_click/sw/library/__samltouch_driver.h"
void samltouch_hfcEnable(  _Bool  hfcState );
#line 134 "d:/clicks_git/s/saml10_touch_click/sw/library/__samltouch_driver.h"
void samltouch_modulePower(  _Bool  powerState );
#line 145 "d:/clicks_git/s/saml10_touch_click/sw/library/__samltouch_driver.h"
void samltouch_putc( char rxInput );
#line 153 "d:/clicks_git/s/saml10_touch_click/sw/library/__samltouch_driver.h"
void samltouch_tick();
#line 164 "d:/clicks_git/s/saml10_touch_click/sw/library/__samltouch_driver.h"
uint16_t samltouch_setHandler( char *pCmd, uint32_t timeout, T_samltouch_handler pHandler );
#line 174 "d:/clicks_git/s/saml10_touch_click/sw/library/__samltouch_driver.h"
void samltouch_cmdSingle( char *pCmd );
#line 186 "d:/clicks_git/s/saml10_touch_click/sw/library/__samltouch_driver.h"
void samltouch_cmdDouble( char *pCmd, char *pArg1 );
#line 199 "d:/clicks_git/s/saml10_touch_click/sw/library/__samltouch_driver.h"
void samltouch_cmdTriple( char *pCmd, char *pArg1, char *pArg2 );
#line 206 "d:/clicks_git/s/saml10_touch_click/sw/library/__samltouch_driver.h"
void samltouch_process();
#line 217 "d:/clicks_git/s/saml10_touch_click/sw/library/__samltouch_driver.h"
void samltouch_parser(char *dataIn, samltouch_state_T *state);
#line 13 "d:/clicks_git/s/saml10_touch_click/sw/example/c/arm/stm/click_saml_touch_timer.h"
uint32_t timerCounter = 0;

static void samltouch_configTimer()
{
 RCC_APB1ENR.TIM2EN = 1;
 TIM2_CR1.CEN = 0;
 TIM2_PSC = 1;
 TIM2_ARR = 35999;
 NVIC_IntEnable(IVT_INT_TIM2);
 TIM2_DIER.UIE = 1;
 TIM2_CR1.CEN = 1;
 EnableInterrupts();
}

void Timer_interrupt() iv IVT_INT_TIM2
{
 samltouch_tick();
 timerCounter++;
 TIM2_SR.UIF = 0;
}
#line 35 "D:/Clicks_git/S/SAML10_Touch_Click/SW/example/c/ARM/STM/Click_SAML_Touch_STM.c"
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
 mikrobus_logInit( _LOG_USBUART_A, 115200 );
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
