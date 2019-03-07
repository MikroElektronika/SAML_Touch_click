![MikroE](http://www.mikroe.com/img/designs/beta/logo_small.png)

---

# SAML_Touch Click

- **CIC Prefix**  : SAMLTOUCH
- **Author**      : Katarina Perendic
- **Verison**     : 1.0.0
- **Date**        : feb 2019.

---


### Software Support

We provide a library for the SAML_Touch Click on our [LibStock](https://libstock.mikroe.com/projects/view/2757/saml-touch-click) 
page, as well as a demo application (example), developed using MikroElektronika 
[compilers](http://shop.mikroe.com/compilers). The demo can run on all the main 
MikroElektronika [development boards](http://shop.mikroe.com/development-boards).

**Library Description**

Biblioteka sadrzi funkciju koja parsira response koji je dobijen od modula i proverava stanje dugmica i slidera.
Generic parser 

Key functions :

- ``` void samltouch_parser(char *dataIn, samltouch_state_T *state) ``` - The function parses the response it receives

**Examples Description**

The application is composed of three sections :

- System Initialization - Initializes UART used for the communcation with SAML Touch module and UART used for infromation logging
- Application Initialization - Initializes driver init and timer init
- Application Task - running in parallel core state machine. Check that the button 1 or  button 2 or the active slider is pressed.
       If it detects that the buttons 1 or 2 are pressed, it logs a button detection message.
       If it detects that the slider is active, it logs a message that the slider is active and its current position is 0-255.

```.c
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
```

Additional Functions :

All additional functions such as timer initialization and default handler. 

The full application code, and ready to use projects can be found on our 
[LibStock](https://libstock.mikroe.com/projects/view/2757/saml-touch-click) page.

Other mikroE Libraries used in the example:

- String
- Conversion
- UART

**Additional notes and informations**

Depending on the development board you are using, you may need 
[USB UART click](http://shop.mikroe.com/usb-uart-click), 
[USB UART 2 Click](http://shop.mikroe.com/usb-uart-2-click) or 
[RS232 Click](http://shop.mikroe.com/rs232-click) to connect to your PC, for 
development systems with no UART to USB interface available on the board. The 
terminal available in all Mikroelektronika 
[compilers](http://shop.mikroe.com/compilers), or any other terminal application 
of your choice, can be used to read the message.

---
---
