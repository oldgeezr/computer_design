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
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2391112489_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(60, ng0);

LAB3:    t1 = (t0 + 1420U);
    t2 = *((char **)t1);
    t1 = (t0 + 868U);
    t3 = *((char **)t1);
    t1 = (t0 + 5012U);
    t4 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t3, t1);
    t5 = (t4 - 31);
    t6 = (t5 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, t4);
    t7 = (32U * t6);
    t8 = (0 + t7);
    t9 = (t2 + t8);
    t10 = (t0 + 2716);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    memcpy(t14, t9, 32U);
    xsi_driver_first_trans_fast_port(t10);

LAB2:    t15 = (t0 + 2656);
    *((int *)t15) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2391112489_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(61, ng0);

LAB3:    t1 = (t0 + 1420U);
    t2 = *((char **)t1);
    t1 = (t0 + 960U);
    t3 = *((char **)t1);
    t1 = (t0 + 5028U);
    t4 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t3, t1);
    t5 = (t4 - 31);
    t6 = (t5 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, t4);
    t7 = (32U * t6);
    t8 = (0 + t7);
    t9 = (t2 + t8);
    t10 = (t0 + 2752);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    memcpy(t14, t9, 32U);
    xsi_driver_first_trans_fast_port(t10);

LAB2:    t15 = (t0 + 2664);
    *((int *)t15) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2391112489_3212880686_p_2(char *t0)
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
    char *t18;

LAB0:    xsi_set_current_line(65, ng0);
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
LAB3:    t1 = (t0 + 2672);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(66, ng0);
    t1 = xsi_get_transient_memory(1024U);
    memset(t1, 0, 1024U);
    t5 = t1;
    t6 = (32U * 1U);
    t7 = t5;
    memset(t7, (unsigned char)2, t6);
    t8 = (t6 != 0);
    if (t8 == 1)
        goto LAB5;

LAB6:    t10 = (t0 + 2788);
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

LAB7:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 776U);
    t5 = *((char **)t2);
    t4 = *((unsigned char *)t5);
    t8 = (t4 == (unsigned char)3);
    if (t8 != 0)
        goto LAB9;

LAB11:
LAB10:    xsi_set_current_line(72, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t5 = (t0 + 2788);
    t7 = (t5 + 32U);
    t10 = *((char **)t7);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    memcpy(t12, t1, 32U);
    xsi_driver_first_trans_delta(t5, 992U, 32U, 0LL);
    goto LAB3;

LAB9:    xsi_set_current_line(69, ng0);
    t2 = (t0 + 1144U);
    t7 = *((char **)t2);
    t2 = (t0 + 1052U);
    t10 = *((char **)t2);
    t2 = (t0 + 5044U);
    t15 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t10, t2);
    t16 = (t15 - 31);
    t6 = (t16 * -1);
    t9 = (32U * t6);
    t17 = (0U + t9);
    t11 = (t0 + 2788);
    t12 = (t11 + 32U);
    t13 = *((char **)t12);
    t14 = (t13 + 32U);
    t18 = *((char **)t14);
    memcpy(t18, t7, 32U);
    xsi_driver_first_trans_delta(t11, t17, 32U, 0LL);
    goto LAB10;

}


extern void work_a_2391112489_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2391112489_3212880686_p_0,(void *)work_a_2391112489_3212880686_p_1,(void *)work_a_2391112489_3212880686_p_2};
	xsi_register_didat("work_a_2391112489_3212880686", "isim/registerfile_tb_isim_beh.exe.sim/work/a_2391112489_3212880686.didat");
	xsi_register_executes(pe);
}
