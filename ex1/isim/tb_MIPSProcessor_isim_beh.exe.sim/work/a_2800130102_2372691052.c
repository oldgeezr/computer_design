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
static const char *ng0 = "/opt/dmlab/home/chriram/Documents/computer_design/ex1/testbench/tb_MIPSProcessor.vhd";
extern char *IEEE_P_2592010699;
extern char *STD_STANDARD;
static const char *ng3 = "_instrdata2DummyElemSubtype";
static const char *ng4 = "_instrdata2Base";
static const char *ng5 = "_instrdata2";
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2800130102_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3652U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(87, ng0);
    t2 = (t0 + 4580);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(88, ng0);
    t2 = (t0 + 3108U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3552);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(89, ng0);
    t2 = (t0 + 4580);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(90, ng0);
    t2 = (t0 + 3108U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3552);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_2800130102_2372691052_p_1(char *t0)
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
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(93, ng0);
    t1 = (t0 + 776U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t10 = (t0 + 1972U);
    t11 = *((char **)t10);
    t10 = (t0 + 4616);
    t12 = (t10 + 32U);
    t13 = *((char **)t12);
    t14 = (t13 + 32U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 8U);
    xsi_driver_first_trans_fast(t10);

LAB2:    t16 = (t0 + 4512);
    *((int *)t16) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 1420U);
    t5 = *((char **)t1);
    t1 = (t0 + 4616);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 8U);
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_2800130102_2372691052_p_2(char *t0)
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
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(94, ng0);
    t1 = (t0 + 776U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t10 = (t0 + 2248U);
    t11 = *((char **)t10);
    t10 = (t0 + 4652);
    t12 = (t10 + 32U);
    t13 = *((char **)t12);
    t14 = (t13 + 32U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 8U);
    xsi_driver_first_trans_fast(t10);

LAB2:    t16 = (t0 + 4520);
    *((int *)t16) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 1696U);
    t5 = *((char **)t1);
    t1 = (t0 + 4652);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 8U);
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_2800130102_2372691052_p_3(char *t0)
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
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 776U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t10 = (t0 + 2064U);
    t11 = *((char **)t10);
    t10 = (t0 + 4688);
    t12 = (t10 + 32U);
    t13 = *((char **)t12);
    t14 = (t13 + 32U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 32U);
    xsi_driver_first_trans_fast(t10);

LAB2:    t16 = (t0 + 4528);
    *((int *)t16) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 1512U);
    t5 = *((char **)t1);
    t1 = (t0 + 4688);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 32U);
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_2800130102_2372691052_p_4(char *t0)
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
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(96, ng0);
    t1 = (t0 + 776U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t10 = (t0 + 2156U);
    t11 = *((char **)t10);
    t10 = (t0 + 4724);
    t12 = (t10 + 32U);
    t13 = *((char **)t12);
    t14 = (t13 + 32U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 1U);
    xsi_driver_first_trans_fast(t10);

LAB2:    t16 = (t0 + 4536);
    *((int *)t16) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 1604U);
    t5 = *((char **)t1);
    t1 = (t0 + 4724);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 1U);
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB6:    goto LAB2;

}

void work_a_2800130102_2372691052_sub_1170970459_2855802964(char *t0, char *t1, char *t2, char *t3)
{
    char t5[24];
    char t6[16];
    char t11[16];
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    char *t12;
    int t13;
    unsigned char t14;
    char *t15;
    char *t16;
    unsigned char t17;
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
    char *t28;
    char *t29;
    char *t30;
    char *t31;

LAB0:    t7 = (t6 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 31;
    t8 = (t7 + 4U);
    *((int *)t8) = 0;
    t8 = (t7 + 8U);
    *((int *)t8) = -1;
    t9 = (0 - 31);
    t10 = (t9 * -1);
    t10 = (t10 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t10;
    t8 = (t11 + 0U);
    t12 = (t8 + 0U);
    *((int *)t12) = 7;
    t12 = (t8 + 4U);
    *((int *)t12) = 0;
    t12 = (t8 + 8U);
    *((int *)t12) = -1;
    t13 = (0 - 7);
    t10 = (t13 * -1);
    t10 = (t10 + 1);
    t12 = (t8 + 12U);
    *((unsigned int *)t12) = t10;
    t12 = (t5 + 4U);
    t14 = (t2 != 0);
    if (t14 == 1)
        goto LAB3;

LAB2:    t15 = (t5 + 8U);
    *((char **)t15) = t6;
    t16 = (t5 + 12U);
    t17 = (t3 != 0);
    if (t17 == 1)
        goto LAB5;

LAB4:    t18 = (t5 + 16U);
    *((char **)t18) = t11;
    t19 = (t0 + 4832);
    t20 = (t19 + 32U);
    t21 = *((char **)t20);
    t22 = (t21 + 32U);
    t23 = *((char **)t22);
    t24 = (t0 + 10348U);
    t25 = (t24 + 12U);
    t10 = *((unsigned int *)t25);
    t10 = (t10 * 1U);
    memcpy(t23, t3, t10);
    xsi_driver_first_trans_fast(t19);
    t7 = (t0 + 4868);
    t8 = (t7 + 32U);
    t19 = *((char **)t8);
    t20 = (t19 + 32U);
    t21 = *((char **)t20);
    t22 = (t0 + 10316U);
    t23 = (t22 + 12U);
    t10 = *((unsigned int *)t23);
    t10 = (t10 * 1U);
    memcpy(t21, t2, t10);
    xsi_driver_first_trans_fast(t7);
    t7 = (t0 + 10818);
    t19 = (t0 + 4904);
    t20 = (t19 + 32U);
    t21 = *((char **)t20);
    t22 = (t21 + 32U);
    t23 = *((char **)t22);
    t24 = (t0 + 10332U);
    t25 = (t24 + 12U);
    t10 = *((unsigned int *)t25);
    t10 = (t10 * 1U);
    memcpy(t23, t7, t10);
    xsi_driver_first_trans_fast(t19);
    t7 = (t0 + 568U);
    xsi_add_dynamic_wait(t1, t7, -1, -1);

LAB9:    t8 = (t1 + 124U);
    t8 = *((char **)t8);
    xsi_wp_set_status(t8, 1);
    t19 = (t1 + 48U);
    t20 = *((char **)t19);
    t21 = (t20 + 704U);
    *((unsigned int *)t21) = 1U;
    t22 = (t1 + 48U);
    t23 = *((char **)t22);
    t24 = (t23 + 0U);
    getcontext(t24);
    t25 = (t1 + 48U);
    t26 = *((char **)t25);
    t27 = (t26 + 704U);
    t10 = *((unsigned int *)t27);
    if (t10 == 1)
        goto LAB10;

LAB11:    t28 = (t1 + 48U);
    t29 = *((char **)t28);
    t30 = (t29 + 704U);
    *((unsigned int *)t30) = 3U;

LAB7:
LAB8:    t31 = (t0 + 568U);
    t14 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t31, 0U, 0U);
    if (t14 == 1)
        goto LAB6;
    else
        goto LAB9;

LAB3:    *((char **)t12) = t2;
    goto LAB2;

LAB5:    *((char **)t16) = t3;
    goto LAB4;

LAB6:    xsi_remove_dynamic_wait(t1, t7);
    t7 = (t0 + 10819);
    t19 = (t0 + 4904);
    t20 = (t19 + 32U);
    t21 = *((char **)t20);
    t22 = (t21 + 32U);
    t23 = *((char **)t22);
    t24 = (t0 + 10332U);
    t25 = (t24 + 12U);
    t10 = *((unsigned int *)t25);
    t10 = (t10 * 1U);
    memcpy(t23, t7, t10);
    xsi_driver_first_trans_fast(t19);

LAB1:    return;
LAB10:    xsi_saveStackAndSuspend(t1);
    goto LAB11;

}

void work_a_2800130102_2372691052_sub_1364728734_2855802964(char *t0, char *t1)
{
    char t2[320];
    char t7[8];
    char t11[16];
    char t23[16];
    char t91[32];
    char t99[992];
    char t121[32];
    char t122[16];
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    char *t10;
    char *t12;
    char *t13;
    int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    int t20;
    int t21;
    char *t22;
    char *t24;
    char *t25;
    int t26;
    char *t27;
    char *t28;
    char *t29;
    char *t31;
    char *t33;
    char *t35;
    char *t37;
    char *t39;
    char *t41;
    char *t43;
    char *t45;
    char *t47;
    char *t49;
    char *t51;
    char *t53;
    char *t55;
    char *t57;
    char *t59;
    char *t61;
    char *t63;
    char *t65;
    char *t67;
    char *t69;
    char *t71;
    char *t73;
    char *t75;
    char *t77;
    char *t79;
    char *t81;
    char *t83;
    char *t85;
    char *t87;
    char *t89;
    char *t92;
    char *t93;
    int t94;
    char *t95;
    int t96;
    char *t97;
    char *t98;
    char *t100;
    char *t101;
    char *t102;
    char *t103;
    char *t104;
    char *t105;
    char *t106;
    int t107;
    int t108;
    int t109;
    int t110;
    char *t111;
    int t112;
    char *t113;
    int t114;
    int t115;
    char *t116;
    int t117;
    unsigned int t118;
    unsigned int t119;
    char *t120;
    char *t123;
    char *t124;
    int t125;
    char *t126;
    unsigned int t127;
    char *t128;

LAB0:    t4 = (t2 + 4U);
    t5 = ((STD_STANDARD) + 240);
    t6 = (t4 + 52U);
    *((char **)t6) = t5;
    t8 = (t4 + 36U);
    *((char **)t8) = t7;
    *((int *)t7) = 31;
    t9 = (t4 + 48U);
    *((unsigned int *)t9) = 4U;
    t10 = ((IEEE_P_2592010699) + 2312);
    t12 = (t11 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 31;
    t13 = (t12 + 4U);
    *((int *)t13) = 0;
    t13 = (t12 + 8U);
    *((int *)t13) = -1;
    t14 = (0 - 31);
    t15 = (t14 * -1);
    t15 = (t15 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t15;
    t13 = (t2 + 72U);
    xsi_create_subtype(t13, ng3, t10, t11, 2);
    t16 = (t2 + 72U);
    t17 = ((STD_STANDARD) + 240);
    t18 = (t4 + 36U);
    t19 = *((char **)t18);
    t20 = *((int *)t19);
    t21 = (t20 - 1);
    t18 = (t2 + 132U);
    xsi_create_unconstr_array_type(t18, ng4, t16, 1, t17);
    t22 = (t2 + 132U);
    t24 = (t23 + 0U);
    t25 = (t24 + 0U);
    *((int *)t25) = 0;
    t25 = (t24 + 4U);
    *((int *)t25) = t21;
    t25 = (t24 + 8U);
    *((int *)t25) = 1;
    t26 = (t21 - 0);
    t15 = (t26 * 1);
    t15 = (t15 + 1);
    t25 = (t24 + 12U);
    *((unsigned int *)t25) = t15;
    t25 = (t2 + 192U);
    xsi_create_subtype(t25, ng5, t22, t23, 2);
    t27 = xsi_get_transient_memory(992U);
    memset(t27, 0, 992U);
    t28 = t27;
    t29 = (t0 + 10820);
    memcpy(t28, t29, 32U);
    t28 = (t28 + 32U);
    t31 = (t0 + 10852);
    memcpy(t28, t31, 32U);
    t28 = (t28 + 32U);
    t33 = (t0 + 10884);
    memcpy(t28, t33, 32U);
    t28 = (t28 + 32U);
    t35 = (t0 + 10916);
    memcpy(t28, t35, 32U);
    t28 = (t28 + 32U);
    t37 = (t0 + 10948);
    memcpy(t28, t37, 32U);
    t28 = (t28 + 32U);
    t39 = (t0 + 10980);
    memcpy(t28, t39, 32U);
    t28 = (t28 + 32U);
    t41 = (t0 + 11012);
    memcpy(t28, t41, 32U);
    t28 = (t28 + 32U);
    t43 = (t0 + 11044);
    memcpy(t28, t43, 32U);
    t28 = (t28 + 32U);
    t45 = (t0 + 11076);
    memcpy(t28, t45, 32U);
    t28 = (t28 + 32U);
    t47 = (t0 + 11108);
    memcpy(t28, t47, 32U);
    t28 = (t28 + 32U);
    t49 = (t0 + 11140);
    memcpy(t28, t49, 32U);
    t28 = (t28 + 32U);
    t51 = (t0 + 11172);
    memcpy(t28, t51, 32U);
    t28 = (t28 + 32U);
    t53 = (t0 + 11204);
    memcpy(t28, t53, 32U);
    t28 = (t28 + 32U);
    t55 = (t0 + 11236);
    memcpy(t28, t55, 32U);
    t28 = (t28 + 32U);
    t57 = (t0 + 11268);
    memcpy(t28, t57, 32U);
    t28 = (t28 + 32U);
    t59 = (t0 + 11300);
    memcpy(t28, t59, 32U);
    t28 = (t28 + 32U);
    t61 = (t0 + 11332);
    memcpy(t28, t61, 32U);
    t28 = (t28 + 32U);
    t63 = (t0 + 11364);
    memcpy(t28, t63, 32U);
    t28 = (t28 + 32U);
    t65 = (t0 + 11396);
    memcpy(t28, t65, 32U);
    t28 = (t28 + 32U);
    t67 = (t0 + 11428);
    memcpy(t28, t67, 32U);
    t28 = (t28 + 32U);
    t69 = (t0 + 11460);
    memcpy(t28, t69, 32U);
    t28 = (t28 + 32U);
    t71 = (t0 + 11492);
    memcpy(t28, t71, 32U);
    t28 = (t28 + 32U);
    t73 = (t0 + 11524);
    memcpy(t28, t73, 32U);
    t28 = (t28 + 32U);
    t75 = (t0 + 11556);
    memcpy(t28, t75, 32U);
    t28 = (t28 + 32U);
    t77 = (t0 + 11588);
    memcpy(t28, t77, 32U);
    t28 = (t28 + 32U);
    t79 = (t0 + 11620);
    memcpy(t28, t79, 32U);
    t28 = (t28 + 32U);
    t81 = (t0 + 11652);
    memcpy(t28, t81, 32U);
    t28 = (t28 + 32U);
    t83 = (t0 + 11684);
    memcpy(t28, t83, 32U);
    t28 = (t28 + 32U);
    t85 = (t0 + 11716);
    memcpy(t28, t85, 32U);
    t28 = (t28 + 32U);
    t87 = (t0 + 11748);
    memcpy(t28, t87, 32U);
    t28 = (t28 + 32U);
    t89 = (t0 + 11780);
    memcpy(t28, t89, 32U);
    t92 = (t91 + 0U);
    t93 = (t92 + 0U);
    *((int *)t93) = 0;
    t93 = (t92 + 4U);
    *((int *)t93) = 30;
    t93 = (t92 + 8U);
    *((int *)t93) = 1;
    t94 = (30 - 0);
    t15 = (t94 * 1);
    t15 = (t15 + 1);
    t93 = (t92 + 12U);
    *((unsigned int *)t93) = t15;
    t93 = (t91 + 16U);
    t95 = (t93 + 0U);
    *((int *)t95) = 31;
    t95 = (t93 + 4U);
    *((int *)t95) = 0;
    t95 = (t93 + 8U);
    *((int *)t95) = -1;
    t96 = (0 - 31);
    t15 = (t96 * -1);
    t15 = (t15 + 1);
    t95 = (t93 + 12U);
    *((unsigned int *)t95) = t15;
    t95 = (t2 + 252U);
    t97 = (t2 + 192U);
    t98 = (t95 + 52U);
    *((char **)t98) = t97;
    t100 = (t95 + 36U);
    *((char **)t100) = t99;
    memcpy(t99, t27, 992U);
    t101 = (t95 + 40U);
    t102 = (t97 + 44U);
    t103 = *((char **)t102);
    *((char **)t101) = t103;
    t104 = (t95 + 48U);
    *((unsigned int *)t104) = 992U;
    t105 = (t4 + 36U);
    t106 = *((char **)t105);
    t107 = *((int *)t106);
    t108 = (t107 - 1);
    t109 = 0;
    t110 = t108;

LAB2:    if (t109 <= t110)
        goto LAB3;

LAB5:
LAB1:    t5 = (t2 + 192U);
    xsi_delete_type(t5, 2);
    return;
LAB3:    t105 = (t95 + 36U);
    t111 = *((char **)t105);
    t105 = (t91 + 0U);
    t112 = *((int *)t105);
    t113 = (t91 + 8U);
    t114 = *((int *)t113);
    t115 = (t109 - t112);
    t15 = (t115 * t114);
    t116 = (t91 + 4U);
    t117 = *((int *)t116);
    xsi_vhdl_check_range_of_index(t112, t117, t114, t109);
    t118 = (32U * t15);
    t119 = (0 + t118);
    t120 = (t111 + t119);
    memcpy(t121, t120, 32U);
    t123 = (t0 + 2972U);
    t124 = *((char **)t123);
    t125 = *((int *)t124);
    t123 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t122, t109, t125);
    t126 = (t122 + 12U);
    t127 = *((unsigned int *)t126);
    t127 = (t127 * 1U);
    t128 = (char *)alloca(t127);
    memcpy(t128, t123, t127);
    work_a_2800130102_2372691052_sub_1170970459_2855802964(t0, t1, t121, t128);

LAB4:    if (t109 == t110)
        goto LAB5;

LAB6:    t14 = (t109 + 1);
    t109 = t14;
    goto LAB2;

}

void work_a_2800130102_2372691052_sub_3756890973_2855802964(char *t0, char *t1, char *t2, int t3)
{
    char t5[16];
    char t6[16];
    char t14[16];
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t15;
    char *t16;
    int t17;
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
    char *t28;
    char *t29;

LAB0:    t7 = (t6 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 31;
    t8 = (t7 + 4U);
    *((int *)t8) = 0;
    t8 = (t7 + 8U);
    *((int *)t8) = -1;
    t9 = (0 - 31);
    t10 = (t9 * -1);
    t10 = (t10 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t10;
    t8 = (t5 + 4U);
    t11 = (t2 != 0);
    if (t11 == 1)
        goto LAB3;

LAB2:    t12 = (t5 + 8U);
    *((char **)t12) = t6;
    t13 = (t5 + 12U);
    *((int *)t13) = t3;
    t15 = (t0 + 2972U);
    t16 = *((char **)t15);
    t17 = *((int *)t16);
    t15 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t14, t3, t17);
    t18 = (t0 + 4940);
    t19 = (t18 + 32U);
    t20 = *((char **)t19);
    t21 = (t20 + 32U);
    t22 = *((char **)t21);
    t23 = (t0 + 10396U);
    t24 = (t23 + 12U);
    t10 = *((unsigned int *)t24);
    t10 = (t10 * 1U);
    memcpy(t22, t15, t10);
    xsi_driver_first_trans_fast(t18);
    t7 = (t0 + 4976);
    t15 = (t7 + 32U);
    t16 = *((char **)t15);
    t18 = (t16 + 32U);
    t19 = *((char **)t18);
    t20 = (t0 + 10364U);
    t21 = (t20 + 12U);
    t10 = *((unsigned int *)t21);
    t10 = (t10 * 1U);
    memcpy(t19, t2, t10);
    xsi_driver_first_trans_fast(t7);
    t7 = (t0 + 11812);
    t16 = (t0 + 5012);
    t18 = (t16 + 32U);
    t19 = *((char **)t18);
    t20 = (t19 + 32U);
    t21 = *((char **)t20);
    t22 = (t0 + 10380U);
    t23 = (t22 + 12U);
    t10 = *((unsigned int *)t23);
    t10 = (t10 * 1U);
    memcpy(t21, t7, t10);
    xsi_driver_first_trans_fast(t16);
    t7 = (t0 + 568U);
    xsi_add_dynamic_wait(t1, t7, -1, -1);

LAB7:    t15 = (t1 + 124U);
    t15 = *((char **)t15);
    xsi_wp_set_status(t15, 1);
    t16 = (t1 + 48U);
    t18 = *((char **)t16);
    t19 = (t18 + 704U);
    *((unsigned int *)t19) = 1U;
    t20 = (t1 + 48U);
    t21 = *((char **)t20);
    t22 = (t21 + 0U);
    getcontext(t22);
    t23 = (t1 + 48U);
    t24 = *((char **)t23);
    t25 = (t24 + 704U);
    t10 = *((unsigned int *)t25);
    if (t10 == 1)
        goto LAB8;

LAB9:    t26 = (t1 + 48U);
    t27 = *((char **)t26);
    t28 = (t27 + 704U);
    *((unsigned int *)t28) = 3U;

LAB5:
LAB6:    t29 = (t0 + 568U);
    t11 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t29, 0U, 0U);
    if (t11 == 1)
        goto LAB4;
    else
        goto LAB7;

LAB3:    *((char **)t8) = t2;
    goto LAB2;

LAB4:    xsi_remove_dynamic_wait(t1, t7);
    t7 = (t0 + 11813);
    t16 = (t0 + 5012);
    t18 = (t16 + 32U);
    t19 = *((char **)t18);
    t20 = (t19 + 32U);
    t21 = *((char **)t20);
    t22 = (t0 + 10380U);
    t23 = (t22 + 12U);
    t10 = *((unsigned int *)t23);
    t10 = (t10 * 1U);
    memcpy(t21, t7, t10);
    xsi_driver_first_trans_fast(t16);

LAB1:    return;
LAB8:    xsi_saveStackAndSuspend(t1);
    goto LAB9;

}

void work_a_2800130102_2372691052_sub_97371478_2855802964(char *t0, char *t1)
{
    char *t4;

LAB0:    t4 = (t0 + 11814);
    work_a_2800130102_2372691052_sub_3756890973_2855802964(t0, t1, t4, 1);
    t4 = (t0 + 11846);
    work_a_2800130102_2372691052_sub_3756890973_2855802964(t0, t1, t4, 2);

LAB1:    return;
}

void work_a_2800130102_2372691052_sub_1885187600_2855802964(char *t0, char *t1, char *t2, int t3)
{
    char t5[16];
    char t6[16];
    char t14[16];
    char t34[16];
    char t35[16];
    char t39[16];
    char t41[16];
    char t44[16];
    char t51[16];
    char t56[16];
    char t58[16];
    char t62[16];
    char t67[16];
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t15;
    char *t16;
    int t17;
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
    char *t28;
    char *t29;
    int64 t30;
    int64 t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t36;
    char *t38;
    char *t40;
    char *t42;
    char *t43;
    char *t45;
    char *t46;
    int t47;
    char *t48;
    char *t49;
    char *t50;
    char *t52;
    char *t53;
    char *t55;
    char *t57;
    char *t59;
    char *t60;
    int t61;
    int t63;
    char *t64;
    char *t65;
    char *t66;
    char *t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    char *t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    char *t76;
    unsigned int t77;
    unsigned int t78;

LAB0:    t7 = (t6 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 31;
    t8 = (t7 + 4U);
    *((int *)t8) = 0;
    t8 = (t7 + 8U);
    *((int *)t8) = -1;
    t9 = (0 - 31);
    t10 = (t9 * -1);
    t10 = (t10 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t10;
    t8 = (t5 + 4U);
    t11 = (t2 != 0);
    if (t11 == 1)
        goto LAB3;

LAB2:    t12 = (t5 + 8U);
    *((char **)t12) = t6;
    t13 = (t5 + 12U);
    *((int *)t13) = t3;
    t15 = (t0 + 2972U);
    t16 = *((char **)t15);
    t17 = *((int *)t16);
    t15 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t14, t3, t17);
    t18 = (t0 + 4940);
    t19 = (t18 + 32U);
    t20 = *((char **)t19);
    t21 = (t20 + 32U);
    t22 = *((char **)t21);
    t23 = (t0 + 10396U);
    t24 = (t23 + 12U);
    t10 = *((unsigned int *)t24);
    t10 = (t10 * 1U);
    memcpy(t22, t15, t10);
    xsi_driver_first_trans_fast(t18);
    t7 = (t0 + 11878);
    t16 = (t0 + 5012);
    t18 = (t16 + 32U);
    t19 = *((char **)t18);
    t20 = (t19 + 32U);
    t21 = *((char **)t20);
    t22 = (t0 + 10380U);
    t23 = (t22 + 12U);
    t10 = *((unsigned int *)t23);
    t10 = (t10 * 1U);
    memcpy(t21, t7, t10);
    xsi_driver_first_trans_fast(t16);
    t7 = (t0 + 568U);
    xsi_add_dynamic_wait(t1, t7, -1, -1);

LAB7:    t15 = (t1 + 124U);
    t15 = *((char **)t15);
    xsi_wp_set_status(t15, 1);
    t16 = (t1 + 48U);
    t18 = *((char **)t16);
    t19 = (t18 + 704U);
    *((unsigned int *)t19) = 1U;
    t20 = (t1 + 48U);
    t21 = *((char **)t20);
    t22 = (t21 + 0U);
    getcontext(t22);
    t23 = (t1 + 48U);
    t24 = *((char **)t23);
    t25 = (t24 + 704U);
    t10 = *((unsigned int *)t25);
    if (t10 == 1)
        goto LAB8;

LAB9:    t26 = (t1 + 48U);
    t27 = *((char **)t26);
    t28 = (t27 + 704U);
    *((unsigned int *)t28) = 3U;

LAB5:
LAB6:    t29 = (t0 + 568U);
    t11 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t29, 0U, 0U);
    if (t11 == 1)
        goto LAB4;
    else
        goto LAB7;

LAB3:    *((char **)t8) = t2;
    goto LAB2;

LAB4:    xsi_remove_dynamic_wait(t1, t7);
    t7 = (t0 + 3108U);
    t15 = *((char **)t7);
    t30 = *((int64 *)t15);
    t31 = (0.50000000000000000 * t30);
    xsi_process_wait(t1, t31);

LAB13:    t7 = (t1 + 48U);
    t16 = *((char **)t7);
    t18 = (t16 + 704U);
    *((unsigned int *)t18) = 1U;
    t19 = (t1 + 48U);
    t20 = *((char **)t19);
    t21 = (t20 + 0U);
    getcontext(t21);
    t22 = (t1 + 48U);
    t23 = *((char **)t22);
    t24 = (t23 + 704U);
    t10 = *((unsigned int *)t24);
    if (t10 == 1)
        goto LAB14;

LAB15:    t25 = (t1 + 48U);
    t26 = *((char **)t25);
    t27 = (t26 + 704U);
    *((unsigned int *)t27) = 3U;

LAB11:
LAB12:
LAB10:    t7 = (t6 + 12U);
    t10 = *((unsigned int *)t7);
    t10 = (t10 * 1U);
    t15 = (t0 + 960U);
    t16 = *((char **)t15);
    t15 = (t0 + 10172U);
    t18 = (t15 + 12U);
    t32 = *((unsigned int *)t18);
    t32 = (t32 * 1U);
    t11 = 1;
    if (t10 == t32)
        goto LAB18;

LAB19:    t11 = 0;

LAB20:    if (t11 == 0)
        goto LAB16;

LAB17:    t7 = (t6 + 12U);
    t10 = *((unsigned int *)t7);
    t10 = (t10 * 1U);
    t15 = (t0 + 960U);
    t16 = *((char **)t15);
    t15 = (t0 + 10172U);
    t18 = (t15 + 12U);
    t32 = *((unsigned int *)t18);
    t32 = (t32 * 1U);
    t11 = 1;
    if (t10 == t32)
        goto LAB26;

LAB27:    t11 = 0;

LAB28:    if ((!(t11)) == 0)
        goto LAB24;

LAB25:
LAB1:    return;
LAB8:    xsi_saveStackAndSuspend(t1);
    goto LAB9;

LAB14:    xsi_saveStackAndSuspend(t1);
    goto LAB15;

LAB16:    t21 = (t0 + 11879);
    t23 = ((STD_STANDARD) + 240);
    t24 = xsi_int_to_mem(t3);
    t25 = xsi_string_variable_get_image(t14, t23, t24);
    t27 = ((STD_STANDARD) + 656);
    t28 = (t35 + 0U);
    t29 = (t28 + 0U);
    *((int *)t29) = 1;
    t29 = (t28 + 4U);
    *((int *)t29) = 40;
    t29 = (t28 + 8U);
    *((int *)t29) = 1;
    t9 = (40 - 1);
    t36 = (t9 * 1);
    t36 = (t36 + 1);
    t29 = (t28 + 12U);
    *((unsigned int *)t29) = t36;
    t26 = xsi_base_array_concat(t26, t34, t27, (char)97, t21, t35, (char)97, t25, t14, (char)101);
    t29 = (t0 + 11919);
    t40 = ((STD_STANDARD) + 656);
    t42 = (t41 + 0U);
    t43 = (t42 + 0U);
    *((int *)t43) = 1;
    t43 = (t42 + 4U);
    *((int *)t43) = 9;
    t43 = (t42 + 8U);
    *((int *)t43) = 1;
    t17 = (9 - 1);
    t36 = (t17 * 1);
    t36 = (t36 + 1);
    t43 = (t42 + 12U);
    *((unsigned int *)t43) = t36;
    t38 = xsi_base_array_concat(t38, t39, t40, (char)97, t26, t34, (char)97, t29, t41, (char)101);
    t43 = ((STD_STANDARD) + 240);
    t45 = (t0 + 960U);
    t46 = *((char **)t45);
    t45 = (t0 + 10172U);
    t47 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t46, t45);
    t48 = xsi_int_to_mem(t47);
    t49 = xsi_string_variable_get_image(t44, t43, t48);
    t52 = ((STD_STANDARD) + 656);
    t50 = xsi_base_array_concat(t50, t51, t52, (char)97, t38, t39, (char)97, t49, t44, (char)101);
    t53 = (t0 + 11928);
    t57 = ((STD_STANDARD) + 656);
    t59 = (t58 + 0U);
    t60 = (t59 + 0U);
    *((int *)t60) = 1;
    t60 = (t59 + 4U);
    *((int *)t60) = 10;
    t60 = (t59 + 8U);
    *((int *)t60) = 1;
    t61 = (10 - 1);
    t36 = (t61 * 1);
    t36 = (t36 + 1);
    t60 = (t59 + 12U);
    *((unsigned int *)t60) = t36;
    t55 = xsi_base_array_concat(t55, t56, t57, (char)97, t50, t51, (char)97, t53, t58, (char)101);
    t60 = ((STD_STANDARD) + 240);
    t63 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t6);
    t64 = xsi_int_to_mem(t63);
    t65 = xsi_string_variable_get_image(t62, t60, t64);
    t68 = ((STD_STANDARD) + 656);
    t66 = xsi_base_array_concat(t66, t67, t68, (char)97, t55, t56, (char)97, t65, t62, (char)101);
    t69 = (t14 + 12U);
    t36 = *((unsigned int *)t69);
    t70 = (40U + t36);
    t71 = (t70 + 9U);
    t72 = (t44 + 12U);
    t73 = *((unsigned int *)t72);
    t74 = (t71 + t73);
    t75 = (t74 + 10U);
    t76 = (t62 + 12U);
    t77 = *((unsigned int *)t76);
    t78 = (t75 + t77);
    xsi_report(t66, t78, (unsigned char)0);
    goto LAB17;

LAB18:    t33 = 0;

LAB21:    if (t33 < t10)
        goto LAB22;
    else
        goto LAB20;

LAB22:    t19 = (t2 + t33);
    t20 = (t16 + t33);
    if (*((unsigned char *)t19) != *((unsigned char *)t20))
        goto LAB19;

LAB23:    t33 = (t33 + 1);
    goto LAB21;

LAB24:    t21 = (t0 + 11938);
    t23 = ((STD_STANDARD) + 240);
    t24 = xsi_int_to_mem(t3);
    t25 = xsi_string_variable_get_image(t14, t23, t24);
    t27 = ((STD_STANDARD) + 656);
    t28 = (t35 + 0U);
    t29 = (t28 + 0U);
    *((int *)t29) = 1;
    t29 = (t28 + 4U);
    *((int *)t29) = 36;
    t29 = (t28 + 8U);
    *((int *)t29) = 1;
    t9 = (36 - 1);
    t36 = (t9 * 1);
    t36 = (t36 + 1);
    t29 = (t28 + 12U);
    *((unsigned int *)t29) = t36;
    t26 = xsi_base_array_concat(t26, t34, t27, (char)97, t21, t35, (char)97, t25, t14, (char)101);
    t29 = (t14 + 12U);
    t36 = *((unsigned int *)t29);
    t70 = (36U + t36);
    xsi_report(t26, t70, (unsigned char)0);
    goto LAB25;

LAB26:    t33 = 0;

LAB29:    if (t33 < t10)
        goto LAB30;
    else
        goto LAB28;

LAB30:    t19 = (t2 + t33);
    t20 = (t16 + t33);
    if (*((unsigned char *)t19) != *((unsigned char *)t20))
        goto LAB27;

LAB31:    t33 = (t33 + 1);
    goto LAB29;

}

void work_a_2800130102_2372691052_sub_2955645165_2855802964(char *t0, char *t1)
{
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned char t21;
    unsigned char t22;

LAB0:    t4 = (t0 + 752U);
    xsi_add_dynamic_wait(t1, t4, -1, -1);

LAB5:    t5 = (t1 + 124U);
    t5 = *((char **)t5);
    xsi_wp_set_status(t5, 1);
    t6 = (t1 + 48U);
    t7 = *((char **)t6);
    t8 = (t7 + 704U);
    *((unsigned int *)t8) = 1U;
    t9 = (t1 + 48U);
    t10 = *((char **)t9);
    t11 = (t10 + 0U);
    getcontext(t11);
    t12 = (t1 + 48U);
    t13 = *((char **)t12);
    t14 = (t13 + 704U);
    t15 = *((unsigned int *)t14);
    if (t15 == 1)
        goto LAB6;

LAB7:    t16 = (t1 + 48U);
    t17 = *((char **)t16);
    t18 = (t17 + 704U);
    *((unsigned int *)t18) = 3U;

LAB3:
LAB4:    t19 = (t0 + 776U);
    t20 = *((char **)t19);
    t21 = *((unsigned char *)t20);
    t22 = (t21 == (unsigned char)2);
    if (t22 == 1)
        goto LAB2;
    else
        goto LAB5;

LAB2:    xsi_remove_dynamic_wait(t1, t4);
    t4 = (t0 + 11974);
    work_a_2800130102_2372691052_sub_1885187600_2855802964(t0, t1, t4, 5);
    t4 = (t0 + 12006);
    work_a_2800130102_2372691052_sub_1885187600_2855802964(t0, t1, t4, 6);
    t4 = (t0 + 12038);
    work_a_2800130102_2372691052_sub_1885187600_2855802964(t0, t1, t4, 7);
    t4 = (t0 + 12070);
    work_a_2800130102_2372691052_sub_1885187600_2855802964(t0, t1, t4, 8);
    t4 = (t0 + 12102);
    work_a_2800130102_2372691052_sub_1885187600_2855802964(t0, t1, t4, 9);
    t4 = (t0 + 12134);
    work_a_2800130102_2372691052_sub_1885187600_2855802964(t0, t1, t4, 12);
    t4 = (t0 + 12166);
    work_a_2800130102_2372691052_sub_1885187600_2855802964(t0, t1, t4, 13);
    t4 = (t0 + 12198);
    work_a_2800130102_2372691052_sub_1885187600_2855802964(t0, t1, t4, 15);
    t4 = (t0 + 12230);
    work_a_2800130102_2372691052_sub_1885187600_2855802964(t0, t1, t4, 16);

LAB1:    return;
LAB6:    xsi_saveStackAndSuspend(t1);
    goto LAB7;

}

static void work_a_2800130102_2372691052_p_5(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 4332U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(209, ng0);
    t2 = (t0 + 4760);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(210, ng0);
    t7 = (100 * 1000LL);
    t2 = (t0 + 4232);
    xsi_process_wait(t2, t7);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(211, ng0);
    t2 = (t0 + 4760);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(213, ng0);
    t2 = (t0 + 4796);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(215, ng0);
    t2 = (t0 + 4232);
    work_a_2800130102_2372691052_sub_1364728734_2855802964(t0, t2);
    xsi_set_current_line(216, ng0);
    t2 = (t0 + 4232);
    work_a_2800130102_2372691052_sub_97371478_2855802964(t0, t2);
    xsi_set_current_line(218, ng0);
    t2 = (t0 + 3108U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 * 10);
    t2 = (t0 + 4232);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(221, ng0);
    t2 = (t0 + 4796);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(223, ng0);
    t2 = (t0 + 3108U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 * 200);
    t2 = (t0 + 4232);
    xsi_process_wait(t2, t8);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(225, ng0);
    t2 = (t0 + 4796);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(228, ng0);
    t2 = (t0 + 4232);
    work_a_2800130102_2372691052_sub_2955645165_2855802964(t0, t2);
    xsi_set_current_line(230, ng0);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    goto LAB2;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

}


extern void work_a_2800130102_2372691052_init()
{
	static char *pe[] = {(void *)work_a_2800130102_2372691052_p_0,(void *)work_a_2800130102_2372691052_p_1,(void *)work_a_2800130102_2372691052_p_2,(void *)work_a_2800130102_2372691052_p_3,(void *)work_a_2800130102_2372691052_p_4,(void *)work_a_2800130102_2372691052_p_5};
	static char *se[] = {(void *)work_a_2800130102_2372691052_sub_1170970459_2855802964,(void *)work_a_2800130102_2372691052_sub_1364728734_2855802964,(void *)work_a_2800130102_2372691052_sub_3756890973_2855802964,(void *)work_a_2800130102_2372691052_sub_97371478_2855802964,(void *)work_a_2800130102_2372691052_sub_1885187600_2855802964,(void *)work_a_2800130102_2372691052_sub_2955645165_2855802964};
	xsi_register_didat("work_a_2800130102_2372691052", "isim/tb_MIPSProcessor_isim_beh.exe.sim/work/a_2800130102_2372691052.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
