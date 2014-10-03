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
static const char *ng0 = "/opt/dmlab/home/chriram/Documents/computer_design/ex1/alu.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

char *ieee_p_2592010699_sub_1735675855_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_795620321_503743352(char *, char *, char *, char *, char *, char *);
unsigned char ieee_p_3620187407_sub_1742983514_3965413181(char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767740470_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_0832606739_3212880686_p_0(char *t0)
{
    char t17[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    char *t15;
    int t16;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    unsigned char t28;

LAB0:    xsi_set_current_line(28, ng0);
    t1 = (t0 + 1832);
    t2 = (t1 + 32U);
    t3 = *((char **)t2);
    t4 = (t3 + 32U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(30, ng0);
    t1 = (t0 + 776U);
    t2 = *((char **)t1);
    t1 = (t0 + 3400);
    t6 = xsi_mem_cmp(t1, t2, 4U);
    if (t6 == 1)
        goto LAB3;

LAB9:    t4 = (t0 + 3404);
    t7 = xsi_mem_cmp(t4, t2, 4U);
    if (t7 == 1)
        goto LAB4;

LAB10:    t8 = (t0 + 3408);
    t10 = xsi_mem_cmp(t8, t2, 4U);
    if (t10 == 1)
        goto LAB5;

LAB11:    t11 = (t0 + 3412);
    t13 = xsi_mem_cmp(t11, t2, 4U);
    if (t13 == 1)
        goto LAB6;

LAB12:    t14 = (t0 + 3416);
    t16 = xsi_mem_cmp(t14, t2, 4U);
    if (t16 == 1)
        goto LAB7;

LAB13:
LAB8:    xsi_set_current_line(49, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t3 = (t0 + 1868);
    t4 = (t3 + 32U);
    t5 = *((char **)t4);
    t8 = (t5 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 32U);
    xsi_driver_first_trans_fast_port(t3);

LAB2:    t1 = (t0 + 1788);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(32, ng0);
    t18 = (t0 + 592U);
    t19 = *((char **)t18);
    t18 = (t0 + 3260U);
    t20 = (t0 + 684U);
    t21 = *((char **)t20);
    t20 = (t0 + 3276U);
    t22 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t17, t19, t18, t21, t20);
    t23 = (t0 + 1868);
    t24 = (t23 + 32U);
    t25 = *((char **)t24);
    t26 = (t25 + 32U);
    t27 = *((char **)t26);
    memcpy(t27, t22, 32U);
    xsi_driver_first_trans_fast_port(t23);
    goto LAB2;

LAB4:    xsi_set_current_line(34, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t1 = (t0 + 3260U);
    t3 = (t0 + 684U);
    t4 = *((char **)t3);
    t3 = (t0 + 3276U);
    t5 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t17, t2, t1, t4, t3);
    t8 = (t0 + 1868);
    t9 = (t8 + 32U);
    t11 = *((char **)t9);
    t12 = (t11 + 32U);
    t14 = *((char **)t12);
    memcpy(t14, t5, 32U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB5:    xsi_set_current_line(36, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t1 = (t0 + 3260U);
    t3 = (t0 + 684U);
    t4 = *((char **)t3);
    t3 = (t0 + 3276U);
    t5 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t17, t2, t1, t4, t3);
    t8 = (t0 + 1868);
    t9 = (t8 + 32U);
    t11 = *((char **)t9);
    t12 = (t11 + 32U);
    t14 = *((char **)t12);
    memcpy(t14, t5, 32U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB6:    xsi_set_current_line(38, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t1 = (t0 + 3276U);
    t3 = (t0 + 592U);
    t4 = *((char **)t3);
    t3 = (t0 + 3260U);
    t5 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t17, t2, t1, t4, t3);
    t8 = (t0 + 1868);
    t9 = (t8 + 32U);
    t11 = *((char **)t9);
    t12 = (t11 + 32U);
    t14 = *((char **)t12);
    memcpy(t14, t5, 32U);
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(39, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t1 = (t0 + 3276U);
    t3 = (t0 + 592U);
    t4 = *((char **)t3);
    t3 = (t0 + 3260U);
    t28 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t4, t3);
    if (t28 != 0)
        goto LAB15;

LAB17:
LAB16:    goto LAB2;

LAB7:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t1 = (t0 + 3260U);
    t3 = (t0 + 684U);
    t4 = *((char **)t3);
    t3 = (t0 + 3276U);
    t28 = ieee_p_3620187407_sub_1742983514_3965413181(IEEE_P_3620187407, t2, t1, t4, t3);
    if (t28 != 0)
        goto LAB18;

LAB20:    xsi_set_current_line(46, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t3 = (t0 + 1868);
    t4 = (t3 + 32U);
    t5 = *((char **)t4);
    t8 = (t5 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 32U);
    xsi_driver_first_trans_fast_port(t3);

LAB19:    goto LAB2;

LAB14:;
LAB15:    xsi_set_current_line(40, ng0);
    t5 = (t0 + 1832);
    t8 = (t5 + 32U);
    t9 = *((char **)t8);
    t11 = (t9 + 32U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t5);
    goto LAB16;

LAB18:    xsi_set_current_line(44, ng0);
    t5 = xsi_get_transient_memory(32U);
    memset(t5, 0, 32U);
    t8 = t5;
    memset(t8, (unsigned char)3, 32U);
    t9 = (t0 + 1868);
    t11 = (t9 + 32U);
    t12 = *((char **)t11);
    t14 = (t12 + 32U);
    t15 = *((char **)t14);
    memcpy(t15, t5, 32U);
    xsi_driver_first_trans_fast_port(t9);
    goto LAB19;

}


extern void work_a_0832606739_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0832606739_3212880686_p_0};
	xsi_register_didat("work_a_0832606739_3212880686", "isim/tb_MIPSProcessor_isim_beh.exe.sim/work/a_0832606739_3212880686.didat");
	xsi_register_executes(pe);
}
