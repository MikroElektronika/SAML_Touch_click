/*
Example for SAML_Touch Click

    Date          : feb 2019.
    Author        : Katarina Perendic

Test configuration dsPIC :
    
    MCU                : P33FJ256GP710A
    Dev. Board         : EasyPIC Fusion v7
    dsPIC Compiler ver : v7.1.0.0

---

Description :

The application is composed of three sections :

- System Initialization - Initializes UART used for the communcation with SAML Touch module and UART used for infromation logging
- Application Initialization - Initializes driver init and timer init
- Application Task - running in parallel core state machine. Check that the button 1 or  button 2 or the active slider is pressed.
       If it detects that the buttons 1 or 2 are pressed, it logs a button detection message.
       If it detects that the slider is active, it logs a message that the slider is active and its current position is 0-255.

Additional Functions :

All additional functions such as timer initialization and default handler. 

*/

#include "Click_SAML_Touch_types.h"
#include "Click_SAML_Touch_config.h"
#include "Click_SAML_Touch_timer.h"

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
    mikrobus_logInit( _LOG_USBUART_B, 115200 );
    mikrobus_logWrite( "---- System Init ----", _LOG_LINE );
    mikrobus_logWrite( "---------------------", _LOG_LINE );
}

void applicationInit()
{
// TIMER INIT
    samltouch_configTimer();

// DRIVER INIT
    samltouch_uartDriverInit((T_SAMLTOUCH_P)&_MIKROBUS1_GPIO, (T_SAMLTOUCH_P)&_MIKROBUS1_UART);
    samltouch_coreInit( samltouch_default_handler, 1500 );

// MODULE POWER ON
    samltouch_hfcEnable( 1 );
    timerCounter = 0;
}

void applicationTask()
{
// CORE STATE MACHINE
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

/* -------------------------------------------------------------------------- */