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
static const char *ng0 = "/opt/dmlab/home/victoriv/computer_design/ex1/registerfile.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2391112489_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    unsigned int t6;
    char *t7;
    unsigned char t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    int t15;
    int t16;
    unsigned int t17;
    unsigned char t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 660U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB7;

LAB8:
LAB3:    t1 = (t0 + 2384);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(63, ng0);
    t1 = xsi_get_transient_memory(1024U);
    memset(t1, 0, 1024U);
    t5 = t1;
    t6 = (32U * 1U);
    t7 = t5;
    memset(t7, (unsigned char)2, t6);
    t8 = (t6 != 0);
    if (t8 == 1)
        goto LAB5;

LAB6:    t10 = (t0 + 2428);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    memcpy(t14, t1, 1024U);
    xsi_driver_first_trans_fast(t10);
    goto LAB3;

LAB5:    t9 = (1024U / t6);
    xsi_mem_set_data(t5, t5, t6, t9);
    goto LAB6;

LAB7:    xsi_set_current_line(66, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t5 = t2;
    memset(t5, (unsigned char)2, 32U);
    t7 = (t0 + 2428);
    t10 = (t7 + 32U);
    t11 = *((char **)t10);
    t12 = (t11 + 32U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 32U);
    xsi_driver_first_trans_delta(t7, 992U, 32U, 0LL);
    xsi_set_current_line(68, ng0);
    t1 = (t0 + 1420U);
    t2 = *((char **)t1);
    t1 = (t0 + 868U);
    t5 = *((char **)t1);
    t1 = (t0 + 4596U);
    t15 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t5, t1);
    t16 = (t15 - 31);
    t6 = (t16 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, t15);
    t9 = (32U * t6);
    t17 = (0 + t9);
    t7 = (t2 + t17);
    t10 = (t0 + 2464);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    memcpy(t14, t7, 32U);
    xsi_driver_first_trans_fast_port(t10);
    xsi_set_current_line(69, ng0);
    t1 = (t0 + 1420U);
    t2 = *((char **)t1);
    t1 = (t0 + 960U);
    t5 = *((char **)t1);
    t1 = (t0 + 4612U);
    t15 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t5, t1);
    t16 = (t15 - 31);
    t6 = (t16 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, t15);
    t9 = (32U * t6);
    t17 = (0 + t9);
    t7 = (t2 + t17);
    t10 = (t0 + 2500);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    memcpy(t14, t7, 32U);
    xsi_driver_first_trans_fast_port(t10);
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 776U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t8 = (t4 == (unsigned char)3);
    if (t8 == 1)
        goto LAB12;

LAB13:    t3 = (unsigned char)0;

LAB14:    if (t3 != 0)
        goto LAB9;

LAB11:
LAB10:    goto LAB3;

LAB9:    xsi_set_current_line(71, ng0);
    t12 = (t0 + 1144U);
    t13 = *((char **)t12);
    t12 = (t0 + 1052U);
    t14 = *((char **)t12);
    t12 = (t0 + 4628U);
    t15 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t14, t12);
    t16 = (t15 - 31);
    t9 = (t16 * -1);
    t17 = (32U * t9);
    t19 = (0U + t17);
    t20 = (t0 + 2428);
    t21 = (t20 + 32U);
    t22 = *((char **)t21);
    t23 = (t22 + 32U);
    t24 = *((char **)t23);
    memcpy(t24, t13, 32U);
    xsi_driver_first_trans_delta(t20, t19, 32U, 0LL);
    goto LAB10;

LAB12:    t1 = (t0 + 1052U);
    t5 = *((char **)t1);
    t1 = (t0 + 5814);
    t18 = 1;
    if (5U == 5U)
        goto LAB15;

LAB16:    t18 = 0;

LAB17:    t3 = (!(t18));
    goto LAB14;

LAB15:    t6 = 0;

LAB18:    if (t6 < 5U)
        goto LAB19;
    else
        goto LAB17;

LAB19:    t10 = (t5 + t6);
    t11 = (t1 + t6);
    if (*((unsigned char *)t10) != *((unsigned char *)t11))
        goto LAB16;

LAB20:    t6 = (t6 + 1);
    goto LAB18;

}


extern void work_a_2391112489_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2391112489_3212880686_p_0};
	xsi_register_didat("work_a_2391112489_3212880686", "isim/tb_MIPSProcessor_isim_beh.exe.sim/work/a_2391112489_3212880686.didat");
	xsi_register_executes(pe);
}
