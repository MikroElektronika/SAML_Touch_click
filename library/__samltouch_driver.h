/*
    __samltouch_driver.h

-----------------------------------------------------------------------------

  This file is part of mikroSDK.

  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

----------------------------------------------------------------------------- */

/**
@file   __samltouch_driver.h
@brief    SAML_Touch Driver
@mainpage SAML_Touch Click
@{

@image html libstock_fb_view.jpg

@}

@defgroup   SAMLTOUCH
@brief      SAML_Touch Click Driver
@{

| Global Library Prefix | **SAMLTOUCH** |
|:---------------------:|:-----------------:|
| Version               | **1.0.0**    |
| Date                  | **feb 2019.**      |
| Developer             | **Katarina Perendic**     |

Command parser core configured for AT command based GSM devices.

*/
/* -------------------------------------------------------------------------- */

#include "stdint.h"
#include "stdbool.h"

#ifndef _SAMLTOUCH_H_
#define _SAMLTOUCH_H_

/**
 * @macro T_SAMLTOUCH_P 
 * @brief Global Abstract Macro 
 */
#define T_SAMLTOUCH_P    const uint8_t*

/** @defgroup SAMLTOUCH_AT_CMDS AT Command Types */                /** @{ */

extern const uint8_t _SAMLTOUCH_UNKNOWN ;                                   /**< Unknown command type */
extern const uint8_t _SAMLTOUCH_TEST    ;                                   /**< Test command type */
extern const uint8_t _SAMLTOUCH_SET     ;                                   /**< Set command type */
extern const uint8_t _SAMLTOUCH_GET     ;                                   /**< Get command type */
extern const uint8_t _SAMLTOUCH_URC     ;                                   /**< URC */
extern const uint8_t _SAMLTOUCH_EXEC    ;                                   /**< Exec command type */
                                                                       /** @} */
/** @defgroup SAMLTOUCH_AT_EVARG SAML_Touch Event Arguments */   /** @{ */

extern const uint8_t _SAMLTOUCH_EVARG_START_T    ;                          /**< Event argument 0 */
extern const uint8_t _SAMLTOUCH_EVARG_END_T      ;                          /**< Event argument 1 */
extern const uint8_t _SAMLTOUCH_EVARG_EVENT_T    ;                          /**< Event argument 2 */
                          
extern const uint8_t _SAMLTOUCH_EVENT_RESPONSE   ;                          /**< Response */
extern const uint8_t _SAMLTOUCH_EVENT_TIMEOUT    ;                          /**< Timeout */
extern const uint8_t _SAMLTOUCH_EVENT_BUFFER_OUT ;                          /**< Buffer warning */
extern const uint8_t _SAMLTOUCH_EVENT_CALLBACK   ;                          /** Callback */
                                                                       /** @} */
                                                                       
typedef struct
{
    uint8_t button1;
    uint8_t button2;
    uint8_t sw_state;
    uint16_t sw_pos;

} samltouch_state_T;

/**
 * @typedef T_samltouch_handler
 * @brief Handler Prototype
 */
typedef void ( *T_samltouch_handler )( char *buffer, uint8_t *evArgs );

#ifdef __cplusplus
extern "C"{
#endif

/** @defgroup SAMLTOUCH_INIT Driver Init Functions */              /** @{ */

/**
 * @brief Driver Initialization
 * 
 * @param[in] gpioObj pointer to GPIO object
 * @param[in] uartObj pointer to UART object
 *
 * Default UART driver intializaton function.
 */
void samltouch_uartDriverInit(T_SAMLTOUCH_P gpioObj, T_SAMLTOUCH_P uartObj);

/**
 * @brief Core Initialization
 *
 * @param[in] defaultHdl        default handler
 * @param[in] defaultWdog       default watchdog
 *
 * Initialization should be executed before any other function. User can
 * execute this function later inside the application to reset AT Engine to
 * the default state.
 */
void samltouch_coreInit( T_samltouch_handler defaultHdl, uint32_t defaultWdog );

                                                                       /** @} */
/** @defgroup SAMLTOUCH_FUNC Driver Functions */                   /** @{ */

/** 
 * @brief Hardware Flow Control State
 *
 * @param[in] hfcState 
 *
 * Enables or disables Hardware Flow Control.
 */
void samltouch_hfcEnable( bool hfcState );

/**
 * @brief Enables or disables module power
 *
 * @param[in] powerState
 *
 * Turn ON or OFF the module.
 */
void samltouch_modulePower( bool powerState );

/**
 * @brief Receive
 *
 * @param[in] rxInput       char received from the module
 *
 * Function is used to populate response buffer with characters received from
 * the module. This function should be placed inside UART ISR function.It also
 * can be used inside function which constatnly poll the UART RX register.
 */
void samltouch_putc( char rxInput );

/**
 * @brief Engine Tick
 *
 * Function must be placed inside the Timer ISR function which will be called
 * every one millisecond.
 */
void samltouch_tick();

/**
 * @brief Save AT Command to Storage
 *
 * @param[in] pCmd          command string
 * @param[in] timeout       timeout for provided command
 * @param[in] pHandler      handler for provided command
 *
 * Saves handlers and timeout for the particular command.
 */
uint16_t samltouch_setHandler( char *pCmd, uint32_t timeout, T_samltouch_handler pHandler );

/**
 * @brief Simple AT Command
 *
 * @param[in] pCmd          pointer to command string
 *
 * Function should be used in case of simple AT commands which have no
 * additional arguments expected. Most of the AT Commands uses this function.
 */
void samltouch_cmdSingle( char *pCmd );

/**
 * @brief Doble AT Command
 *
 * @param[in] pCmd          pointer to command string
 * @param[in] pArg1         pointer to the string used as additional argument
 *
 * Function should be used with AT commands which expects additional data after
 * the module responses with specific character. In most cases special character
 * is ">" like in example of AT command for SMS sending.
 */
void samltouch_cmdDouble( char *pCmd, char *pArg1 );

/**
 * @brief Triple AT Command
 *
 * @param[in] pCmd          pointer to command string
 * @param[in] pArg1         pointer to the string used as additional argument
 * @param[in] pArg2         pointer to the second additional argument
 *
 * Function should be used with AT command which excepts two additional
 * parameters after the execution of the command. This kind of AT functions are
 * very rare.
 */
void samltouch_cmdTriple( char *pCmd, char *pArg1, char *pArg2 );

/**
 * @brief AT Engine State Machine
 *
 * This function should be placed inside the infinite while loop.
 */
void samltouch_process();

/**
 * @brief Parser
 *
 * @param[in] dataIn                            pointer to response buffer
 * @param[out] samltouch_state_T *state         pointer to the structure
 *
 * The function parses the response it receives - 
 * restores the state of the button 1, button 2, the slider status and the slider position.
 */
void samltouch_parser(char *dataIn, samltouch_state_T *state);
                                                                       /** @} */
#ifdef __cplusplus
} // extern "C"
#endif
#endif

/**
    @example Click_SAML_Touch_STM.c
    @example Click_SAML_Touch_TIVA.c
    @example Click_SAML_Touch_CEC.c
    @example Click_SAML_Touch_KINETIS.c
    @example Click_SAML_Touch_MSP.c
    @example Click_SAML_Touch_PIC.c
    @example Click_SAML_Touch_PIC32.c
    @example Click_SAML_Touch_DSPIC.c
    @example Click_SAML_Touch_AVR.c
    @example Click_SAML_Touch_FT90x.c
    @example Click_SAML_Touch_STM.mbas
    @example Click_SAML_Touch_TIVA.mbas
    @example Click_SAML_Touch_CEC.mbas
    @example Click_SAML_Touch_KINETIS.mbas
    @example Click_SAML_Touch_MSP.mbas
    @example Click_SAML_Touch_PIC.mbas
    @example Click_SAML_Touch_PIC32.mbas
    @example Click_SAML_Touch_DSPIC.mbas
    @example Click_SAML_Touch_AVR.mbas
    @example Click_SAML_Touch_FT90x.mbas
    @example Click_SAML_Touch_STM.mpas
    @example Click_SAML_Touch_TIVA.mpas
    @example Click_SAML_Touch_CEC.mpas
    @example Click_SAML_Touch_KINETIS.mpas
    @example Click_SAML_Touch_MSP.mpas
    @example Click_SAML_Touch_PIC.mpas
    @example Click_SAML_Touch_PIC32.mpas
    @example Click_SAML_Touch_DSPIC.mpas
    @example Click_SAML_Touch_AVR.mpas
    @example Click_SAML_Touch_FT90x.mpas
*/                                                                     /** @} */
/* -------------------------------------------------------------------------- */
/*
  __samltouch_driver.h

  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

3. All advertising materials mentioning features or use of this software
   must display the following acknowledgement:
   This product includes software developed by the MikroElektonika.

4. Neither the name of the MikroElektonika nor the
   names of its contributors may be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY MIKROELEKTRONIKA ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL MIKROELEKTRONIKA BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

----------------------------------------------------------------------------- */