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
static const char *ng0 = "/opt/dmlab/home/chriram/Documents/computer_design/ex1/registerfile_tb.vhd";



static void work_a_1276964694_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 1952U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 2304);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(89, ng0);
    t2 = (t0 + 1408U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 1852);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 2304);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(91, ng0);
    t2 = (t0 + 1408U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 1852);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1276964694_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int64 t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;
    unsigned int t11;
    unsigned char t12;
    unsigned char t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 2088U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(98, ng0);
    t2 = (t0 + 4956);
    xsi_report(t2, 20U, 0);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 1408U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 1988);
    xsi_process_wait(t2, t4);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(101, ng0);
    t2 = (t0 + 4976);
    t5 = (t0 + 2340);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 5008);
    t5 = (t0 + 2376);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(103, ng0);
    t2 = (t0 + 2412);
    t3 = (t2 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(104, ng0);
    t2 = (t0 + 5013);
    t5 = (t0 + 2448);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(105, ng0);
    t2 = (t0 + 1408U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 1988);
    xsi_process_wait(t2, t4);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 1144U);
    t3 = *((char **)t2);
    t2 = (t0 + 5018);
    t10 = 1;
    if (32U == 32U)
        goto LAB14;

LAB15:    t10 = 0;

LAB16:    if (t10 == 0)
        goto LAB12;

LAB13:    xsi_set_current_line(107, ng0);
    t2 = (t0 + 5074);
    xsi_report(t2, 24U, (unsigned char)0);
    xsi_set_current_line(109, ng0);
    t2 = (t0 + 1408U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 1988);
    xsi_process_wait(t2, t4);

LAB22:    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    t8 = (t0 + 5050);
    xsi_report(t8, 24U, (unsigned char)0);
    goto LAB13;

LAB14:    t11 = 0;

LAB17:    if (t11 < 32U)
        goto LAB18;
    else
        goto LAB16;

LAB18:    t6 = (t3 + t11);
    t7 = (t2 + t11);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB15;

LAB19:    t11 = (t11 + 1);
    goto LAB17;

LAB20:    xsi_set_current_line(110, ng0);
    t2 = (t0 + 5098);
    t5 = (t0 + 2340);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(111, ng0);
    t2 = (t0 + 5130);
    t5 = (t0 + 2376);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(112, ng0);
    t2 = (t0 + 2412);
    t3 = (t2 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 5135);
    t5 = (t0 + 2484);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 1408U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 1988);
    xsi_process_wait(t2, t4);

LAB26:    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

LAB24:    xsi_set_current_line(115, ng0);
    t2 = (t0 + 1236U);
    t3 = *((char **)t2);
    t2 = (t0 + 5140);
    t10 = 1;
    if (32U == 32U)
        goto LAB30;

LAB31:    t10 = 0;

LAB32:    if (t10 == 0)
        goto LAB28;

LAB29:    xsi_set_current_line(116, ng0);
    t2 = (t0 + 5196);
    xsi_report(t2, 24U, (unsigned char)0);
    xsi_set_current_line(118, ng0);
    t2 = (t0 + 1408U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 1988);
    xsi_process_wait(t2, t4);

LAB38:    *((char **)t1) = &&LAB39;
    goto LAB1;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB28:    t8 = (t0 + 5172);
    xsi_report(t8, 24U, (unsigned char)0);
    goto LAB29;

LAB30:    t11 = 0;

LAB33:    if (t11 < 32U)
        goto LAB34;
    else
        goto LAB32;

LAB34:    t6 = (t3 + t11);
    t7 = (t2 + t11);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB31;

LAB35:    t11 = (t11 + 1);
    goto LAB33;

LAB36:    xsi_set_current_line(119, ng0);
    t2 = (t0 + 5220);
    t5 = (t0 + 2340);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 5252);
    t5 = (t0 + 2376);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(121, ng0);
    t2 = (t0 + 2412);
    t3 = (t2 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(122, ng0);
    t2 = (t0 + 5257);
    t5 = (t0 + 2484);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(123, ng0);
    t2 = (t0 + 1408U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 1988);
    xsi_process_wait(t2, t4);

LAB42:    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB37:    goto LAB36;

LAB39:    goto LAB37;

LAB40:    xsi_set_current_line(124, ng0);
    t2 = (t0 + 1236U);
    t3 = *((char **)t2);
    t2 = (t0 + 5262);
    t10 = 1;
    if (32U == 32U)
        goto LAB46;

LAB47:    t10 = 0;

LAB48:    if (t10 == 0)
        goto LAB44;

LAB45:    xsi_set_current_line(125, ng0);
    t2 = (t0 + 5317);
    xsi_report(t2, 23U, (unsigned char)0);
    xsi_set_current_line(127, ng0);
    t2 = (t0 + 1408U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 1988);
    xsi_process_wait(t2, t4);

LAB54:    *((char **)t1) = &&LAB55;
    goto LAB1;

LAB41:    goto LAB40;

LAB43:    goto LAB41;

LAB44:    t8 = (t0 + 5294);
    xsi_report(t8, 23U, (unsigned char)0);
    goto LAB45;

LAB46:    t11 = 0;

LAB49:    if (t11 < 32U)
        goto LAB50;
    else
        goto LAB48;

LAB50:    t6 = (t3 + t11);
    t7 = (t2 + t11);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB47;

LAB51:    t11 = (t11 + 1);
    goto LAB49;

LAB52:    xsi_set_current_line(128, ng0);
    t2 = (t0 + 5340);
    t5 = (t0 + 2340);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(129, ng0);
    t2 = (t0 + 5372);
    t5 = (t0 + 2376);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(130, ng0);
    t2 = (t0 + 2412);
    t3 = (t2 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(131, ng0);
    t2 = (t0 + 5377);
    t5 = (t0 + 2448);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(132, ng0);
    t2 = (t0 + 5382);
    t5 = (t0 + 2484);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 1408U);
    t3 = *((char **)t2);
    t4 = *((int64 *)t3);
    t2 = (t0 + 1988);
    xsi_process_wait(t2, t4);

LAB58:    *((char **)t1) = &&LAB59;
    goto LAB1;

LAB53:    goto LAB52;

LAB55:    goto LAB53;

LAB56:    xsi_set_current_line(134, ng0);
    t2 = (t0 + 1144U);
    t3 = *((char **)t2);
    t2 = (t0 + 5387);
    t12 = 1;
    if (32U == 32U)
        goto LAB65;

LAB66:    t12 = 0;

LAB67:    if (t12 == 1)
        goto LAB62;

LAB63:    t10 = (unsigned char)0;

LAB64:    if (t10 == 0)
        goto LAB60;

LAB61:    xsi_set_current_line(135, ng0);
    t2 = (t0 + 5474);
    xsi_report(t2, 23U, (unsigned char)0);
    xsi_set_current_line(137, ng0);
    if ((unsigned char)0 == 0)
        goto LAB77;

LAB78:    xsi_set_current_line(140, ng0);

LAB81:    *((char **)t1) = &&LAB82;
    goto LAB1;

LAB57:    goto LAB56;

LAB59:    goto LAB57;

LAB60:    t18 = (t0 + 5451);
    xsi_report(t18, 23U, (unsigned char)0);
    goto LAB61;

LAB62:    t8 = (t0 + 1236U);
    t9 = *((char **)t8);
    t8 = (t0 + 5419);
    t14 = 1;
    if (32U == 32U)
        goto LAB71;

LAB72:    t14 = 0;

LAB73:    t10 = t14;
    goto LAB64;

LAB65:    t11 = 0;

LAB68:    if (t11 < 32U)
        goto LAB69;
    else
        goto LAB67;

LAB69:    t6 = (t3 + t11);
    t7 = (t2 + t11);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB66;

LAB70:    t11 = (t11 + 1);
    goto LAB68;

LAB71:    t15 = 0;

LAB74:    if (t15 < 32U)
        goto LAB75;
    else
        goto LAB73;

LAB75:    t16 = (t9 + t15);
    t17 = (t8 + t15);
    if (*((unsigned char *)t16) != *((unsigned char *)t17))
        goto LAB72;

LAB76:    t15 = (t15 + 1);
    goto LAB74;

LAB77:    t2 = (t0 + 5497);
    xsi_report(t2, 18U, (unsigned char)3);
    goto LAB78;

LAB79:    goto LAB2;

LAB80:    goto LAB79;

LAB82:    goto LAB80;

}


extern void work_a_1276964694_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1276964694_2372691052_p_0,(void *)work_a_1276964694_2372691052_p_1};
	xsi_register_didat("work_a_1276964694_2372691052", "isim/registerfile_tb_isim_beh.exe.sim/work/a_1276964694_2372691052.didat");
	xsi_register_executes(pe);
}
