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
static const char *ng0 = "/opt/dmlab/home/victoriv/computer_design/ex1/control.vhd";



static void work_a_3222946569_2030911003_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    t1 = (t0 + 2620U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 776U);
    t3 = *((char **)t2);
    t2 = (t0 + 6030);
    t5 = xsi_mem_cmp(t2, t3, 6U);
    if (t5 == 1)
        goto LAB5;

LAB8:    t6 = (t0 + 6036);
    t8 = xsi_mem_cmp(t6, t3, 6U);
    if (t8 == 1)
        goto LAB6;

LAB9:
LAB7:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 6046);
    t4 = (t0 + 3132);
    t6 = (t4 + 32U);
    t7 = *((char **)t6);
    t9 = (t7 + 32U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 2U);
    xsi_driver_first_trans_fast_port(t4);

LAB4:    xsi_set_current_line(40, ng0);

LAB13:    t2 = (t0 + 3072);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB14;

LAB1:    return;
LAB5:    xsi_set_current_line(41, ng0);
    t9 = (t0 + 6042);
    t11 = (t0 + 3132);
    t12 = (t11 + 32U);
    t13 = *((char **)t12);
    t14 = (t13 + 32U);
    t15 = *((char **)t14);
    memcpy(t15, t9, 2U);
    xsi_driver_first_trans_fast_port(t11);
    goto LAB4;

LAB6:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 6044);
    t4 = (t0 + 3132);
    t6 = (t4 + 32U);
    t7 = *((char **)t6);
    t9 = (t7 + 32U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 2U);
    xsi_driver_first_trans_fast_port(t4);
    goto LAB4;

LAB10:;
LAB11:    t3 = (t0 + 3072);
    *((int *)t3) = 0;
    goto LAB2;

LAB12:    goto LAB11;

LAB14:    goto LAB12;

}

static void work_a_3222946569_2030911003_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    int t12;
    char *t13;
    int t15;
    char *t16;
    int t18;
    char *t19;
    int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    static char *nl0[] = {&&LAB6, &&LAB7, &&LAB8, &&LAB9};

LAB0:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1880U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 != (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 1880U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t3);
    goto **((char **)t1);

LAB2:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 3168);
    t5 = (t1 + 32U);
    t6 = *((char **)t5);
    t7 = (t6 + 32U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(51, ng0);
    t1 = (t0 + 3204);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(52, ng0);
    t1 = (t0 + 3240);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(53, ng0);
    t1 = (t0 + 3276);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(54, ng0);
    t1 = (t0 + 3312);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(55, ng0);
    t1 = (t0 + 3348);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(56, ng0);
    t1 = (t0 + 3384);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(57, ng0);
    t1 = (t0 + 3420);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(58, ng0);
    t1 = (t0 + 3456);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB5:    t1 = (t0 + 3080);
    *((int *)t1) = 1;

LAB1:    return;
LAB6:    xsi_set_current_line(63, ng0);
    t5 = (t0 + 3492);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)1;
    xsi_driver_first_trans_fast(t5);
    goto LAB5;

LAB7:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 3492);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB5;

LAB8:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 3492);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(73, ng0);
    t1 = (t0 + 776U);
    t2 = *((char **)t1);
    t1 = (t0 + 6048);
    t10 = xsi_mem_cmp(t1, t2, 6U);
    if (t10 == 1)
        goto LAB12;

LAB19:    t6 = (t0 + 6054);
    t11 = xsi_mem_cmp(t6, t2, 6U);
    if (t11 == 1)
        goto LAB13;

LAB20:    t8 = (t0 + 6060);
    t12 = xsi_mem_cmp(t8, t2, 6U);
    if (t12 == 1)
        goto LAB14;

LAB21:    t13 = (t0 + 6066);
    t15 = xsi_mem_cmp(t13, t2, 6U);
    if (t15 == 1)
        goto LAB15;

LAB22:    t16 = (t0 + 6072);
    t18 = xsi_mem_cmp(t16, t2, 6U);
    if (t18 == 1)
        goto LAB16;

LAB23:    t19 = (t0 + 6078);
    t21 = xsi_mem_cmp(t19, t2, 6U);
    if (t21 == 1)
        goto LAB17;

LAB24:
LAB18:    xsi_set_current_line(108, ng0);

LAB11:    goto LAB5;

LAB9:    xsi_set_current_line(113, ng0);
    t1 = (t0 + 3492);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(114, ng0);
    t1 = (t0 + 3420);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB5;

LAB10:    xsi_set_current_line(117, ng0);
    goto LAB5;

LAB12:    xsi_set_current_line(76, ng0);
    t22 = (t0 + 3240);
    t23 = (t22 + 32U);
    t24 = *((char **)t23);
    t25 = (t24 + 32U);
    t26 = *((char **)t25);
    *((unsigned char *)t26) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t22);
    xsi_set_current_line(77, ng0);
    t1 = (t0 + 3276);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(78, ng0);
    t1 = (t0 + 3420);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB11;

LAB13:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 3204);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(82, ng0);
    t1 = (t0 + 3312);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(83, ng0);
    t1 = (t0 + 3276);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(84, ng0);
    t1 = (t0 + 3528);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(86, ng0);
    t1 = (t0 + 3492);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB11;

LAB14:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 3312);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(90, ng0);
    t1 = (t0 + 3276);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(91, ng0);
    t1 = (t0 + 3456);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(92, ng0);
    t1 = (t0 + 3420);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB11;

LAB15:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 3312);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(96, ng0);
    t1 = (t0 + 3168);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(98, ng0);
    t1 = (t0 + 3492);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB11;

LAB16:    xsi_set_current_line(100, ng0);
    t1 = (t0 + 3348);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(101, ng0);
    t1 = (t0 + 3420);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB11;

LAB17:    xsi_set_current_line(104, ng0);
    t1 = (t0 + 3384);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(105, ng0);
    t1 = (t0 + 3420);
    t2 = (t1 + 32U);
    t5 = *((char **)t2);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB11;

LAB25:;
}

static void work_a_3222946569_2030911003_p_2(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(124, ng0);
    t2 = (t0 + 568U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 3088);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(126, ng0);
    t4 = (t0 + 3564);
    t8 = (t4 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)0;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 684U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)3);
    if (t3 != 0)
        goto LAB8;

LAB10:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 592U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(129, ng0);
    t2 = (t0 + 1972U);
    t5 = *((char **)t2);
    t6 = *((unsigned char *)t5);
    t2 = (t0 + 3564);
    t8 = (t2 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = t6;
    xsi_driver_first_trans_fast(t2);
    goto LAB9;

}


extern void work_a_3222946569_2030911003_init()
{
	static char *pe[] = {(void *)work_a_3222946569_2030911003_p_0,(void *)work_a_3222946569_2030911003_p_1,(void *)work_a_3222946569_2030911003_p_2};
	xsi_register_didat("work_a_3222946569_2030911003", "isim/tb_MIPSProcessor_isim_beh.exe.sim/work/a_3222946569_2030911003.didat");
	xsi_register_executes(pe);
}
