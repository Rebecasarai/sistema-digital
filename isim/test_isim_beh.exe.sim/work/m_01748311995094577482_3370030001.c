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

/* This file is designed for use with ISim build 0x9ca8bed6 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/alberto/Documentos/ownCloud/EDC/Aula/tema2/Ejercicios/EjericiciosCasa/SistemaDigital19/SistemaDigital/SistemaDigital.v";
static unsigned int ng1[] = {1U, 0U};
static unsigned int ng2[] = {2U, 0U};
static int ng3[] = {0, 0};



static void Always_94_0(char *t0)
{
    char t4[8];
    char t12[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    t1 = (t0 + 2976U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 3296);
    *((int *)t2) = 1;
    t3 = (t0 + 3008);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(95, ng0);
    t5 = (t0 + 1664U);
    t6 = *((char **)t5);
    t5 = (t0 + 1504U);
    t7 = *((char **)t5);
    xsi_vlogtype_concat(t4, 2, 2, 2U, t7, 1, t6, 1);

LAB5:    t5 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t5, 2);
    if (t8 == 1)
        goto LAB6;

LAB7:    t2 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t8 == 1)
        goto LAB8;

LAB9:
LAB11:
LAB10:    xsi_set_current_line(98, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2064);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 8);

LAB12:    goto LAB2;

LAB6:    xsi_set_current_line(96, ng0);
    t9 = (t0 + 1184U);
    t10 = *((char **)t9);
    t9 = (t0 + 1344U);
    t11 = *((char **)t9);
    memset(t12, 0, 8);
    xsi_vlog_unsigned_minus(t12, 8, t10, 8, t11, 8);
    t9 = (t0 + 2064);
    xsi_vlogvar_assign_value(t9, t12, 0, 0, 8);
    goto LAB12;

LAB8:    xsi_set_current_line(97, ng0);
    t3 = (t0 + 1184U);
    t5 = *((char **)t3);
    t3 = (t0 + 1344U);
    t6 = *((char **)t3);
    memset(t12, 0, 8);
    xsi_vlog_unsigned_add(t12, 8, t5, 8, t6, 8);
    t3 = (t0 + 2064);
    xsi_vlogvar_assign_value(t3, t12, 0, 0, 8);
    goto LAB12;

}


extern void work_m_01748311995094577482_3370030001_init()
{
	static char *pe[] = {(void *)Always_94_0};
	xsi_register_didat("work_m_01748311995094577482_3370030001", "isim/test_isim_beh.exe.sim/work/m_01748311995094577482_3370030001.didat");
	xsi_register_executes(pe);
}
