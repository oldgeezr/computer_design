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
static const char *ng0 = "/opt/dmlab/home/chriram/Documents/computer_design/exercise0/stack.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_3539408484_1878664202_p_0(char *t0)
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
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    int t16;
    int t17;
    unsigned char t18;
    char *t19;
    int t20;
    int t21;
    unsigned int t22;

LAB0:    xsi_set_current_line(38, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 568U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB7;

LAB9:
LAB8:
LAB3:    t1 = (t0 + 2268);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(39, ng0);
    t1 = xsi_get_transient_memory(8192U);
    memset(t1, 0, 8192U);
    t5 = t1;
    t6 = (8U * 1U);
    t7 = t5;
    memset(t7, (unsigned char)2, t6);
    t8 = (t6 != 0);
    if (t8 == 1)
        goto LAB5;

LAB6:    t10 = (t0 + 1476U);
    t11 = *((char **)t10);
    t10 = (t11 + 0);
    memcpy(t10, t1, 8192U);
    xsi_set_current_line(40, ng0);
    t1 = (t0 + 1544U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(41, ng0);
    t1 = (t0 + 2312);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t7 = (t5 + 32U);
    t10 = *((char **)t7);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(42, ng0);
    t1 = (t0 + 2348);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t7 = (t5 + 32U);
    t10 = *((char **)t7);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(43, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t2 = t1;
    memset(t2, (unsigned char)2, 8U);
    t5 = (t0 + 2384);
    t7 = (t5 + 32U);
    t10 = *((char **)t7);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB3;

LAB5:    t9 = (8192U / t6);
    xsi_mem_set_data(t5, t5, t6, t9);
    goto LAB6;

LAB7:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 868U);
    t5 = *((char **)t2);
    t8 = *((unsigned char *)t5);
    t13 = (t8 == (unsigned char)3);
    if (t13 == 1)
        goto LAB13;

LAB14:    t4 = (unsigned char)0;

LAB15:    if (t4 != 0)
        goto LAB10;

LAB12:
LAB11:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 960U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t8 = (t4 == (unsigned char)3);
    if (t8 == 1)
        goto LAB22;

LAB23:    t3 = (unsigned char)0;

LAB24:    if (t3 != 0)
        goto LAB19;

LAB21:
LAB20:    xsi_set_current_line(74, ng0);
    t1 = (t0 + 1544U);
    t2 = *((char **)t1);
    t16 = *((int *)t2);
    t3 = (t16 == 0);
    if (t3 != 0)
        goto LAB30;

LAB32:    t1 = (t0 + 1544U);
    t2 = *((char **)t1);
    t16 = *((int *)t2);
    t17 = (1024 - 1);
    t3 = (t16 == t17);
    if (t3 != 0)
        goto LAB33;

LAB34:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 2312);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t7 = (t5 + 32U);
    t10 = *((char **)t7);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(82, ng0);
    t1 = (t0 + 2348);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t7 = (t5 + 32U);
    t10 = *((char **)t7);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB31:    goto LAB8;

LAB10:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1544U);
    t10 = *((char **)t2);
    t16 = *((int *)t10);
    t17 = (1024 - 1);
    t18 = (t16 != t17);
    if (t18 != 0)
        goto LAB16;

LAB18:
LAB17:    goto LAB11;

LAB13:    t2 = (t0 + 1144U);
    t7 = *((char **)t2);
    t14 = *((unsigned char *)t7);
    t15 = (t14 == (unsigned char)2);
    t4 = t15;
    goto LAB15;

LAB16:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 776U);
    t11 = *((char **)t2);
    t2 = (t0 + 1476U);
    t12 = *((char **)t2);
    t2 = (t0 + 1544U);
    t19 = *((char **)t2);
    t20 = *((int *)t19);
    t21 = (t20 - 1023);
    t6 = (t21 * -1);
    xsi_vhdl_check_range_of_index(1023, 0, -1, t20);
    t9 = (8U * t6);
    t22 = (0 + t9);
    t2 = (t12 + t22);
    memcpy(t2, t11, 8U);
    xsi_set_current_line(53, ng0);
    t1 = (t0 + 1476U);
    t2 = *((char **)t1);
    t1 = (t0 + 1544U);
    t5 = *((char **)t1);
    t16 = *((int *)t5);
    t17 = (t16 - 1023);
    t6 = (t17 * -1);
    xsi_vhdl_check_range_of_index(1023, 0, -1, t16);
    t9 = (8U * t6);
    t22 = (0 + t9);
    t1 = (t2 + t22);
    t7 = (t0 + 2384);
    t10 = (t7 + 32U);
    t11 = *((char **)t10);
    t12 = (t11 + 32U);
    t19 = *((char **)t12);
    memcpy(t19, t1, 8U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(54, ng0);
    t1 = (t0 + 1544U);
    t2 = *((char **)t1);
    t16 = *((int *)t2);
    t17 = (t16 + 1);
    t1 = (t0 + 1544U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    *((int *)t1) = t17;
    goto LAB17;

LAB19:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 1544U);
    t7 = *((char **)t1);
    t16 = *((int *)t7);
    t15 = (t16 > 1);
    if (t15 != 0)
        goto LAB25;

LAB27:    t1 = (t0 + 1544U);
    t2 = *((char **)t1);
    t16 = *((int *)t2);
    t3 = (t16 == 1);
    if (t3 != 0)
        goto LAB28;

LAB29:
LAB26:    goto LAB20;

LAB22:    t1 = (t0 + 1236U);
    t5 = *((char **)t1);
    t13 = *((unsigned char *)t5);
    t14 = (t13 == (unsigned char)2);
    t3 = t14;
    goto LAB24;

LAB25:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 1544U);
    t10 = *((char **)t1);
    t17 = *((int *)t10);
    t20 = (t17 - 1);
    t1 = (t0 + 1544U);
    t11 = *((char **)t1);
    t1 = (t11 + 0);
    *((int *)t1) = t20;
    xsi_set_current_line(63, ng0);
    t1 = (t0 + 1476U);
    t2 = *((char **)t1);
    t1 = (t0 + 1544U);
    t5 = *((char **)t1);
    t16 = *((int *)t5);
    t17 = (t16 - 1);
    t20 = (t17 - 1023);
    t6 = (t20 * -1);
    xsi_vhdl_check_range_of_index(1023, 0, -1, t17);
    t9 = (8U * t6);
    t22 = (0 + t9);
    t1 = (t2 + t22);
    t7 = (t0 + 2384);
    t10 = (t7 + 32U);
    t11 = *((char **)t10);
    t12 = (t11 + 32U);
    t19 = *((char **)t12);
    memcpy(t19, t1, 8U);
    xsi_driver_first_trans_fast_port(t7);
    xsi_set_current_line(64, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t2 = t1;
    memset(t2, (unsigned char)2, 8U);
    t5 = (t0 + 1476U);
    t7 = *((char **)t5);
    t5 = (t0 + 1544U);
    t10 = *((char **)t5);
    t16 = *((int *)t10);
    t17 = (t16 - 1023);
    t6 = (t17 * -1);
    xsi_vhdl_check_range_of_index(1023, 0, -1, t16);
    t9 = (8U * t6);
    t22 = (0 + t9);
    t5 = (t7 + t22);
    memcpy(t5, t1, 8U);
    goto LAB26;

LAB28:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 1544U);
    t5 = *((char **)t1);
    t17 = *((int *)t5);
    t20 = (t17 - 1);
    t1 = (t0 + 1544U);
    t7 = *((char **)t1);
    t1 = (t7 + 0);
    *((int *)t1) = t20;
    xsi_set_current_line(67, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t2 = t1;
    memset(t2, (unsigned char)2, 8U);
    t5 = (t0 + 1476U);
    t7 = *((char **)t5);
    t5 = (t0 + 1544U);
    t10 = *((char **)t5);
    t16 = *((int *)t10);
    t17 = (t16 - 1023);
    t6 = (t17 * -1);
    xsi_vhdl_check_range_of_index(1023, 0, -1, t16);
    t9 = (8U * t6);
    t22 = (0 + t9);
    t5 = (t7 + t22);
    memcpy(t5, t1, 8U);
    xsi_set_current_line(68, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t2 = t1;
    memset(t2, (unsigned char)2, 8U);
    t5 = (t0 + 2384);
    t7 = (t5 + 32U);
    t10 = *((char **)t7);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB26;

LAB30:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 2312);
    t5 = (t1 + 32U);
    t7 = *((char **)t5);
    t10 = (t7 + 32U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(76, ng0);
    t1 = (t0 + 2348);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t7 = (t5 + 32U);
    t10 = *((char **)t7);
    *((unsigned char *)t10) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB31;

LAB33:    xsi_set_current_line(78, ng0);
    t1 = (t0 + 2312);
    t5 = (t1 + 32U);
    t7 = *((char **)t5);
    t10 = (t7 + 32U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(79, ng0);
    t1 = (t0 + 2348);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t7 = (t5 + 32U);
    t10 = *((char **)t7);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB31;

}


extern void work_a_3539408484_1878664202_init()
{
	static char *pe[] = {(void *)work_a_3539408484_1878664202_p_0};
	xsi_register_didat("work_a_3539408484_1878664202", "isim/stack_tb_isim_beh.exe.sim/work/a_3539408484_1878664202.didat");
	xsi_register_executes(pe);
}
