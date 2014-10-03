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
static const char *ng0 = "/opt/dmlab/home/chriram/Documents/computer_design/ex1/registerfile.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3499444699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2391112489_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    int t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(58, ng0);
    t1 = (t0 + 568U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 2428);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(59, ng0);
    t3 = (t0 + 684U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(60, ng0);
    t3 = (t0 + 1052U);
    t7 = *((char **)t3);
    t3 = (t0 + 960U);
    t8 = *((char **)t3);
    t3 = (t0 + 4816U);
    t9 = ieee_std_logic_arith_conv_integer_unsigned(IEEE_P_3499444699, t8, t3);
    t10 = (t9 - 31);
    t11 = (t10 * -1);
    t12 = (32U * t11);
    t13 = (0U + t12);
    t14 = (t0 + 2480);
    t15 = (t14 + 32U);
    t16 = *((char **)t15);
    t17 = (t16 + 32U);
    t18 = *((char **)t17);
    memcpy(t18, t7, 32U);
    xsi_driver_first_trans_delta(t14, t13, 32U, 0LL);
    goto LAB6;

}

static void work_a_2391112489_3212880686_p_1(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 568U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 2436);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(68, ng0);
    t3 = (t0 + 1328U);
    t4 = *((char **)t3);
    t3 = (t0 + 776U);
    t5 = *((char **)t3);
    t3 = (t0 + 4784U);
    t6 = ieee_std_logic_arith_conv_integer_unsigned(IEEE_P_3499444699, t5, t3);
    t7 = (t6 - 31);
    t8 = (t7 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, t6);
    t9 = (32U * t8);
    t10 = (0 + t9);
    t11 = (t4 + t10);
    t12 = (t0 + 2516);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    t15 = (t14 + 32U);
    t16 = *((char **)t15);
    memcpy(t16, t11, 32U);
    xsi_driver_first_trans_fast_port(t12);
    xsi_set_current_line(69, ng0);
    t1 = (t0 + 1328U);
    t3 = *((char **)t1);
    t1 = (t0 + 868U);
    t4 = *((char **)t1);
    t1 = (t0 + 4800U);
    t6 = ieee_std_logic_arith_conv_integer_unsigned(IEEE_P_3499444699, t4, t1);
    t7 = (t6 - 31);
    t8 = (t7 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, t6);
    t9 = (32U * t8);
    t10 = (0 + t9);
    t5 = (t3 + t10);
    t11 = (t0 + 2552);
    t12 = (t11 + 32U);
    t13 = *((char **)t12);
    t14 = (t13 + 32U);
    t15 = *((char **)t14);
    memcpy(t15, t5, 32U);
    xsi_driver_first_trans_fast_port(t11);
    goto LAB3;

}


extern void work_a_2391112489_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2391112489_3212880686_p_0,(void *)work_a_2391112489_3212880686_p_1};
	xsi_register_didat("work_a_2391112489_3212880686", "isim/MIPSSystem_isim_beh.exe.sim/work/a_2391112489_3212880686.didat");
	xsi_register_executes(pe);
}
