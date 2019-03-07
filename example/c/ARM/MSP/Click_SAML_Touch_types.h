#ifndef _SAMLTOUCH_T_
#define _SAMLTOUCH_T_

#include <stdint.h>
#include <stdbool.h>

#ifndef _SAMLTOUCH_H_

#define T_SAMLTOUCH_P const uint8_t* 

typedef struct
{
    uint8_t button1;
    uint8_t button2;
    uint8_t sw_state;
    uint16_t sw_pos;

} samltouch_state_T;

#endif
#endif