/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x141a37e9 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/opt/dmlab/home/chriram/Documents/computer_design/exercise0/control_tb.vhd";
extern char *IEEE_P_2592010699;
extern char *WORK_P_1555542850;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
void work_p_1555542850_sub_1030774179_606387733(char *, char *, unsigned char , char *, char *);
char *work_p_1555542850_sub_1085539107_606387733(char *, unsigned char );
char *work_p_1555542850_sub_967164683_606387733(char *, unsigned char , char *);


static void work_a_3491362456_1878664202_p_0(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    int64 t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(57, ng0);

LAB3:    t1 = (t0 + 1776U);
    t2 = *((char **)t1);
    t3 = *((int64 *)t2);
    t4 = (t3 / 2);
    t1 = (t0 + 1604U);
    t5 = *((char **)t1);
    t6 = *((unsigned char *)t5);
    t7 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t6);
    t1 = (t0 + 2728);
    t8 = (t1 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t7;
    xsi_driver_first_trans_delta(t1, 0U, 1, t4);
    t12 = (t0 + 2728);
    xsi_driver_intertial_reject(t12, t4, t4);

LAB2:    t13 = (t0 + 2636);
    *((int *)t13) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

void work_a_3491362456_1878664202_sub_142653383_3539505537(char *t0, char *t1)
{
    char t9[16];
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;

LAB0:    t4 = (t0 + 960U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t4 = (t0 + 5693);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 48;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (48 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 1052U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t4 = (t0 + 5741);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 47;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (47 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 868U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t4 = (t0 + 5788);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 61;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (61 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);

LAB1:    return;
}

void work_a_3491362456_1878664202_sub_1773360739_3539505537(char *t0, char *t1)
{
    char t9[16];
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;
    int t14;
    int64 t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    int t24;

LAB0:    t4 = (t0 + 776U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t4 = (t0 + 5849);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 51;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (51 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t12 = 0;
    t14 = 20;

LAB2:    if (t12 <= t14)
        goto LAB3;

LAB5:
LAB1:    return;
LAB3:    work_a_3491362456_1878664202_sub_142653383_3539505537(t0, t1);
    t4 = (t0 + 1776U);
    t5 = *((char **)t4);
    t15 = *((int64 *)t5);
    xsi_process_wait(t1, t15);

LAB9:    t4 = (t1 + 48U);
    t8 = *((char **)t4);
    t10 = (t8 + 704U);
    *((unsigned int *)t10) = 1U;
    t11 = (t1 + 48U);
    t16 = *((char **)t11);
    t17 = (t16 + 0U);
    getcontext(t17);
    t18 = (t1 + 48U);
    t19 = *((char **)t18);
    t20 = (t19 + 704U);
    t13 = *((unsigned int *)t20);
    if (t13 == 1)
        goto LAB10;

LAB11:    t21 = (t1 + 48U);
    t22 = *((char **)t21);
    t23 = (t22 + 704U);
    *((unsigned int *)t23) = 3U;

LAB7:
LAB8:
LAB6:
LAB4:    if (t12 == t14)
        goto LAB5;

LAB12:    t24 = (t12 + 1);
    t12 = t24;
    goto LAB2;

LAB10:    xsi_saveStackAndSuspend(t1);
    goto LAB11;

}

void work_a_3491362456_1878664202_sub_2027534931_3539505537(char *t0, char *t1)
{
    char t9[16];
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;

LAB0:    t4 = (t0 + 960U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t4 = (t0 + 5900);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 43;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (43 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 1052U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t4 = (t0 + 5943);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 42;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (42 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 868U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t4 = (t0 + 5985);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 54;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (54 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);

LAB1:    return;
}

void work_a_3491362456_1878664202_sub_2009762893_3539505537(char *t0, char *t1)
{
    char t9[16];
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;

LAB0:    t4 = (t0 + 960U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t4 = (t0 + 6039);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 43;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (43 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 1052U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t4 = (t0 + 6082);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 42;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (42 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 868U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t4 = (t0 + 6124);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 59;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (59 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);

LAB1:    return;
}

void work_a_3491362456_1878664202_sub_3334902737_3539505537(char *t0, char *t1)
{
    char t9[16];
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;

LAB0:    t4 = (t0 + 960U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t4 = (t0 + 6183);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 40;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (40 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 1144U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)0);
    t4 = (t0 + 6223);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 50;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (50 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 1052U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t4 = (t0 + 6273);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 44;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (44 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);

LAB1:    return;
}

void work_a_3491362456_1878664202_sub_4052920409_3539505537(char *t0, char *t1)
{
    char t9[16];
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;

LAB0:    t4 = (t0 + 868U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t4 = (t0 + 6317);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 56;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (56 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 960U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t4 = (t0 + 6373);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 44;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (44 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 1052U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t4 = (t0 + 6417);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 40;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (40 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 1420U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t4 = (t0 + 6457);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 48;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (48 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);

LAB1:    return;
}

void work_a_3491362456_1878664202_sub_3985119032_3539505537(char *t0, char *t1)
{
    char t9[16];
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;

LAB0:    t4 = (t0 + 868U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t4 = (t0 + 6505);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 56;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (56 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 960U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t4 = (t0 + 6561);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 44;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (44 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 1052U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t4 = (t0 + 6605);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 40;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (40 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 1420U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t4 = (t0 + 6645);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 52;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (52 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 1328U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t4 = (t0 + 6697);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 48;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (48 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);

LAB1:    return;
}

void work_a_3491362456_1878664202_sub_2949435078_3539505537(char *t0, char *t1)
{
    char t9[16];
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;

LAB0:    t4 = (t0 + 960U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t4 = (t0 + 6745);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 44;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (44 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 1052U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t4 = (t0 + 6789);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 43;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (43 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 868U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t4 = (t0 + 6832);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 57;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (57 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 1420U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t4 = (t0 + 6889);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 56;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (56 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 1328U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t4 = (t0 + 6945);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 56;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (56 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);

LAB1:    return;
}

void work_a_3491362456_1878664202_sub_1313702727_3539505537(char *t0, char *t1)
{
    char t9[16];
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;

LAB0:    t4 = (t0 + 960U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t4 = (t0 + 7001);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 39;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (39 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 1144U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)1);
    t4 = (t0 + 7040);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 48;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (48 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);
    t4 = (t0 + 1052U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t4 = (t0 + 7088);
    t10 = (t9 + 0U);
    t11 = (t10 + 0U);
    *((int *)t11) = 1;
    t11 = (t10 + 4U);
    *((int *)t11) = 44;
    t11 = (t10 + 8U);
    *((int *)t11) = 1;
    t12 = (44 - 1);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t11 = (t10 + 12U);
    *((unsigned int *)t11) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t1, t7, t4, t9);

LAB1:    return;
}

static void work_a_3491362456_1878664202_p_1(char *t0)
{
    char t14[16];
    char *t1;
    char *t2;
    char *t3;
    int64 t4;
    int64 t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned char t12;
    unsigned int t13;
    char *t15;
    char *t16;
    int t17;
    unsigned int t18;
    unsigned char t19;

LAB0:    t1 = (t0 + 2456U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(148, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t5 = (t4 / 4);
    t2 = (t0 + 2356);
    xsi_process_wait(t2, t5);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(149, ng0);
    t2 = (t0 + 2764);
    t3 = (t2 + 32U);
    t6 = *((char **)t3);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(150, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 2356);
    xsi_process_wait(t2, t4);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(151, ng0);
    t2 = (t0 + 2764);
    t3 = (t2 + 32U);
    t6 = *((char **)t3);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(154, ng0);
    t2 = (t0 + 2356);
    work_a_3491362456_1878664202_sub_1773360739_3539505537(t0, t2);
    xsi_set_current_line(155, ng0);
    t2 = (t0 + 7132);
    xsi_report(t2, 13U, (unsigned char)0);
    xsi_set_current_line(158, ng0);
    t2 = (t0 + 2800);
    t3 = (t2 + 32U);
    t6 = *((char **)t3);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(159, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 2356);
    xsi_process_wait(t2, t4);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(160, ng0);
    t2 = (t0 + 2356);
    work_a_3491362456_1878664202_sub_2027534931_3539505537(t0, t2);
    xsi_set_current_line(161, ng0);
    t2 = (t0 + 7145);
    xsi_report(t2, 13U, (unsigned char)0);
    xsi_set_current_line(163, ng0);
    t2 = (t0 + 7158);
    t6 = work_p_1555542850_sub_967164683_606387733(WORK_P_1555542850, (unsigned char)0, t2);
    t7 = (t0 + 2836);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    memcpy(t11, t6, 16U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(164, ng0);
    t2 = (t0 + 2800);
    t3 = (t2 + 32U);
    t6 = *((char **)t3);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(165, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 2356);
    xsi_process_wait(t2, t4);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(166, ng0);
    t2 = (t0 + 2356);
    work_a_3491362456_1878664202_sub_2009762893_3539505537(t0, t2);
    xsi_set_current_line(167, ng0);
    t2 = (t0 + 7166);
    xsi_report(t2, 13U, (unsigned char)0);
    xsi_set_current_line(169, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 2356);
    xsi_process_wait(t2, t4);

LAB22:    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    xsi_set_current_line(170, ng0);
    t2 = (t0 + 2356);
    work_a_3491362456_1878664202_sub_3334902737_3539505537(t0, t2);
    xsi_set_current_line(171, ng0);
    t2 = (t0 + 2356);
    t3 = (t0 + 1236U);
    t6 = *((char **)t3);
    t3 = (t0 + 7179);
    t12 = 1;
    if (8U == 8U)
        goto LAB24;

LAB25:    t12 = 0;

LAB26:    t10 = (t0 + 7187);
    t15 = (t14 + 0U);
    t16 = (t15 + 0U);
    *((int *)t16) = 1;
    t16 = (t15 + 4U);
    *((int *)t16) = 46;
    t16 = (t15 + 8U);
    *((int *)t16) = 1;
    t17 = (46 - 1);
    t18 = (t17 * 1);
    t18 = (t18 + 1);
    t16 = (t15 + 12U);
    *((unsigned int *)t16) = t18;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t2, t12, t10, t14);
    xsi_set_current_line(172, ng0);
    t2 = (t0 + 7233);
    xsi_report(t2, 13U, (unsigned char)0);
    xsi_set_current_line(174, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 2356);
    xsi_process_wait(t2, t4);

LAB32:    *((char **)t1) = &&LAB33;
    goto LAB1;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

LAB24:    t13 = 0;

LAB27:    if (t13 < 8U)
        goto LAB28;
    else
        goto LAB26;

LAB28:    t8 = (t6 + t13);
    t9 = (t3 + t13);
    if (*((unsigned char *)t8) != *((unsigned char *)t9))
        goto LAB25;

LAB29:    t13 = (t13 + 1);
    goto LAB27;

LAB30:    xsi_set_current_line(175, ng0);
    t2 = (t0 + 2356);
    work_a_3491362456_1878664202_sub_1773360739_3539505537(t0, t2);
    xsi_set_current_line(176, ng0);
    t2 = (t0 + 7246);
    xsi_report(t2, 13U, (unsigned char)0);
    xsi_set_current_line(179, ng0);
    t2 = (t0 + 2800);
    t3 = (t2 + 32U);
    t6 = *((char **)t3);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(180, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 2356);
    xsi_process_wait(t2, t4);

LAB36:    *((char **)t1) = &&LAB37;
    goto LAB1;

LAB31:    goto LAB30;

LAB33:    goto LAB31;

LAB34:    xsi_set_current_line(181, ng0);
    t2 = (t0 + 2356);
    work_a_3491362456_1878664202_sub_2027534931_3539505537(t0, t2);
    xsi_set_current_line(182, ng0);
    t2 = (t0 + 7259);
    xsi_report(t2, 13U, (unsigned char)0);
    xsi_set_current_line(184, ng0);
    t2 = work_p_1555542850_sub_1085539107_606387733(WORK_P_1555542850, (unsigned char)1);
    t3 = (t0 + 2836);
    t6 = (t3 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 16U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(185, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 2356);
    xsi_process_wait(t2, t4);

LAB40:    *((char **)t1) = &&LAB41;
    goto LAB1;

LAB35:    goto LAB34;

LAB37:    goto LAB35;

LAB38:    xsi_set_current_line(186, ng0);
    t2 = (t0 + 2356);
    work_a_3491362456_1878664202_sub_2009762893_3539505537(t0, t2);
    xsi_set_current_line(187, ng0);
    t2 = (t0 + 7272);
    xsi_report(t2, 13U, (unsigned char)0);
    xsi_set_current_line(189, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 2356);
    xsi_process_wait(t2, t4);

LAB44:    *((char **)t1) = &&LAB45;
    goto LAB1;

LAB39:    goto LAB38;

LAB41:    goto LAB39;

LAB42:    xsi_set_current_line(190, ng0);
    t2 = (t0 + 2356);
    work_a_3491362456_1878664202_sub_4052920409_3539505537(t0, t2);
    xsi_set_current_line(191, ng0);
    t2 = (t0 + 7285);
    xsi_report(t2, 13U, (unsigned char)0);
    xsi_set_current_line(193, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 2356);
    xsi_process_wait(t2, t4);

LAB48:    *((char **)t1) = &&LAB49;
    goto LAB1;

LAB43:    goto LAB42;

LAB45:    goto LAB43;

LAB46:    xsi_set_current_line(194, ng0);
    t2 = (t0 + 2356);
    work_a_3491362456_1878664202_sub_3985119032_3539505537(t0, t2);
    xsi_set_current_line(195, ng0);
    t2 = (t0 + 7298);
    xsi_report(t2, 13U, (unsigned char)0);
    xsi_set_current_line(197, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 2356);
    xsi_process_wait(t2, t4);

LAB52:    *((char **)t1) = &&LAB53;
    goto LAB1;

LAB47:    goto LAB46;

LAB49:    goto LAB47;

LAB50:    xsi_set_current_line(198, ng0);
    t2 = (t0 + 2356);
    work_a_3491362456_1878664202_sub_2949435078_3539505537(t0, t2);
    xsi_set_current_line(199, ng0);
    t2 = (t0 + 2356);
    t3 = (t0 + 1512U);
    t6 = *((char **)t3);
    t12 = *((unsigned char *)t6);
    t19 = (t12 == (unsigned char)0);
    t3 = (t0 + 7311);
    t8 = (t14 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 1;
    t9 = (t8 + 4U);
    *((int *)t9) = 46;
    t9 = (t8 + 8U);
    *((int *)t9) = 1;
    t17 = (46 - 1);
    t13 = (t17 * 1);
    t13 = (t13 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t2, t19, t3, t14);
    xsi_set_current_line(201, ng0);
    t2 = (t0 + 7357);
    xsi_report(t2, 14U, (unsigned char)0);
    xsi_set_current_line(203, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 2356);
    xsi_process_wait(t2, t4);

LAB56:    *((char **)t1) = &&LAB57;
    goto LAB1;

LAB51:    goto LAB50;

LAB53:    goto LAB51;

LAB54:    xsi_set_current_line(204, ng0);
    t2 = (t0 + 2356);
    work_a_3491362456_1878664202_sub_1313702727_3539505537(t0, t2);
    xsi_set_current_line(205, ng0);
    t2 = (t0 + 2356);
    t3 = (t0 + 1512U);
    t6 = *((char **)t3);
    t12 = *((unsigned char *)t6);
    t19 = (t12 == (unsigned char)0);
    t3 = (t0 + 7371);
    t8 = (t14 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 1;
    t9 = (t8 + 4U);
    *((int *)t9) = 54;
    t9 = (t8 + 8U);
    *((int *)t9) = 1;
    t17 = (54 - 1);
    t13 = (t17 * 1);
    t13 = (t13 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t2, t19, t3, t14);
    xsi_set_current_line(207, ng0);
    t2 = (t0 + 7425);
    xsi_report(t2, 14U, (unsigned char)0);
    xsi_set_current_line(209, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 2356);
    xsi_process_wait(t2, t4);

LAB60:    *((char **)t1) = &&LAB61;
    goto LAB1;

LAB55:    goto LAB54;

LAB57:    goto LAB55;

LAB58:    xsi_set_current_line(210, ng0);
    t2 = (t0 + 2356);
    work_a_3491362456_1878664202_sub_142653383_3539505537(t0, t2);
    xsi_set_current_line(211, ng0);
    t2 = (t0 + 7439);
    xsi_report(t2, 14U, (unsigned char)0);
    xsi_set_current_line(214, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 2356);
    xsi_process_wait(t2, t4);

LAB64:    *((char **)t1) = &&LAB65;
    goto LAB1;

LAB59:    goto LAB58;

LAB61:    goto LAB59;

LAB62:    xsi_set_current_line(215, ng0);
    t2 = (t0 + 2356);
    work_a_3491362456_1878664202_sub_2027534931_3539505537(t0, t2);
    xsi_set_current_line(216, ng0);
    t2 = (t0 + 7453);
    xsi_report(t2, 14U, (unsigned char)0);
    xsi_set_current_line(219, ng0);
    t2 = work_p_1555542850_sub_1085539107_606387733(WORK_P_1555542850, (unsigned char)2);
    t3 = (t0 + 2836);
    t6 = (t3 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 16U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(220, ng0);
    t2 = (t0 + 2800);
    t3 = (t2 + 32U);
    t6 = *((char **)t3);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(221, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 2356);
    xsi_process_wait(t2, t4);

LAB68:    *((char **)t1) = &&LAB69;
    goto LAB1;

LAB63:    goto LAB62;

LAB65:    goto LAB63;

LAB66:    xsi_set_current_line(222, ng0);
    t2 = (t0 + 2356);
    work_a_3491362456_1878664202_sub_2009762893_3539505537(t0, t2);
    xsi_set_current_line(223, ng0);
    t2 = (t0 + 7467);
    xsi_report(t2, 14U, (unsigned char)0);
    xsi_set_current_line(225, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 2356);
    xsi_process_wait(t2, t4);

LAB72:    *((char **)t1) = &&LAB73;
    goto LAB1;

LAB67:    goto LAB66;

LAB69:    goto LAB67;

LAB70:    xsi_set_current_line(226, ng0);
    t2 = (t0 + 2356);
    work_a_3491362456_1878664202_sub_4052920409_3539505537(t0, t2);
    xsi_set_current_line(227, ng0);
    t2 = (t0 + 7481);
    xsi_report(t2, 14U, (unsigned char)0);
    xsi_set_current_line(229, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 2356);
    xsi_process_wait(t2, t4);

LAB76:    *((char **)t1) = &&LAB77;
    goto LAB1;

LAB71:    goto LAB70;

LAB73:    goto LAB71;

LAB74:    xsi_set_current_line(230, ng0);
    t2 = (t0 + 2356);
    work_a_3491362456_1878664202_sub_3985119032_3539505537(t0, t2);
    xsi_set_current_line(231, ng0);
    t2 = (t0 + 7495);
    xsi_report(t2, 14U, (unsigned char)0);
    xsi_set_current_line(233, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 2356);
    xsi_process_wait(t2, t4);

LAB80:    *((char **)t1) = &&LAB81;
    goto LAB1;

LAB75:    goto LAB74;

LAB77:    goto LAB75;

LAB78:    xsi_set_current_line(234, ng0);
    t2 = (t0 + 2356);
    work_a_3491362456_1878664202_sub_2949435078_3539505537(t0, t2);
    xsi_set_current_line(235, ng0);
    t2 = (t0 + 2356);
    t3 = (t0 + 1512U);
    t6 = *((char **)t3);
    t12 = *((unsigned char *)t6);
    t19 = (t12 == (unsigned char)1);
    t3 = (t0 + 7509);
    t8 = (t14 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 1;
    t9 = (t8 + 4U);
    *((int *)t9) = 51;
    t9 = (t8 + 8U);
    *((int *)t9) = 1;
    t17 = (51 - 1);
    t13 = (t17 * 1);
    t13 = (t13 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t2, t19, t3, t14);
    xsi_set_current_line(237, ng0);
    t2 = (t0 + 7560);
    xsi_report(t2, 14U, (unsigned char)0);
    xsi_set_current_line(239, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 2356);
    xsi_process_wait(t2, t4);

LAB84:    *((char **)t1) = &&LAB85;
    goto LAB1;

LAB79:    goto LAB78;

LAB81:    goto LAB79;

LAB82:    xsi_set_current_line(240, ng0);
    t2 = (t0 + 2356);
    work_a_3491362456_1878664202_sub_1313702727_3539505537(t0, t2);
    xsi_set_current_line(241, ng0);
    t2 = (t0 + 2356);
    t3 = (t0 + 1512U);
    t6 = *((char **)t3);
    t12 = *((unsigned char *)t6);
    t19 = (t12 == (unsigned char)1);
    t3 = (t0 + 7574);
    t8 = (t14 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 1;
    t9 = (t8 + 4U);
    *((int *)t9) = 51;
    t9 = (t8 + 8U);
    *((int *)t9) = 1;
    t17 = (51 - 1);
    t13 = (t17 * 1);
    t13 = (t13 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t13;
    work_p_1555542850_sub_1030774179_606387733(WORK_P_1555542850, t2, t19, t3, t14);
    xsi_set_current_line(243, ng0);
    t2 = (t0 + 7625);
    xsi_report(t2, 14U, (unsigned char)0);
    xsi_set_current_line(245, ng0);
    t2 = (t0 + 1776U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 2356);
    xsi_process_wait(t2, t4);

LAB88:    *((char **)t1) = &&LAB89;
    goto LAB1;

LAB83:    goto LAB82;

LAB85:    goto LAB83;

LAB86:    xsi_set_current_line(246, ng0);
    t2 = (t0 + 2356);
    work_a_3491362456_1878664202_sub_1773360739_3539505537(t0, t2);
    xsi_set_current_line(247, ng0);
    t2 = (t0 + 7639);
    xsi_report(t2, 14U, (unsigned char)0);
    xsi_set_current_line(249, ng0);
    if ((unsigned char)0 == 0)
        goto LAB90;

LAB91:    xsi_set_current_line(250, ng0);

LAB94:    t2 = (t0 + 2684);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB95;
    goto LAB1;

LAB87:    goto LAB86;

LAB89:    goto LAB87;

LAB90:    t2 = (t0 + 7653);
    xsi_report(t2, 12U, (unsigned char)3);
    goto LAB91;

LAB92:    t3 = (t0 + 2684);
    *((int *)t3) = 0;
    goto LAB2;

LAB93:    t3 = (t0 + 1604U);
    t6 = *((char **)t3);
    t12 = *((unsigned char *)t6);
    t19 = (t12 == (unsigned char)3);
    if (t19 == 1)
        goto LAB92;
    else
        goto LAB94;

LAB95:    goto LAB93;

}


extern void work_a_3491362456_1878664202_init()
{
	static char *pe[] = {(void *)work_a_3491362456_1878664202_p_0,(void *)work_a_3491362456_1878664202_p_1};
	static char *se[] = {(void *)work_a_3491362456_1878664202_sub_142653383_3539505537,(void *)work_a_3491362456_1878664202_sub_1773360739_3539505537,(void *)work_a_3491362456_1878664202_sub_2027534931_3539505537,(void *)work_a_3491362456_1878664202_sub_2009762893_3539505537,(void *)work_a_3491362456_1878664202_sub_3334902737_3539505537,(void *)work_a_3491362456_1878664202_sub_4052920409_3539505537,(void *)work_a_3491362456_1878664202_sub_3985119032_3539505537,(void *)work_a_3491362456_1878664202_sub_2949435078_3539505537,(void *)work_a_3491362456_1878664202_sub_1313702727_3539505537};
	xsi_register_didat("work_a_3491362456_1878664202", "isim/control_tb_isim_beh.exe.sim/work/a_3491362456_1878664202.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
