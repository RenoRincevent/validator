#include "interface_code.h"

reg_t reg_infos[NUM_REG + 1];

reg_data_t size_data[NUM_REG + 1] = {
	/* Definition of register zero */
	{"zero", 32, "R[0]", 0},
	/* Definition of register ra */
	{"ra", 32, "R[1]", 0},
	/* Definition of register sp */
	{"sp", 32, "R[2]", 0},
	/* Definition of register gp */
	{"gp", 32, "R[3]", 0},
	/* Definition of register tp */
	{"tp", 32, "R[4]", 0},
	/* Definition of register t0 */
	{"t0", 32, "R[5]", 0},
	/* Definition of register t1 */
	{"t1", 32, "R[6]", 0},
	/* Definition of register t2 */
	{"t2", 32, "R[7]", 0},
	/* Definition of register fp */
	{"fp", 32, "R[8]", 0},
	/* Definition of register s1 */
	{"s1", 32, "R[9]", 0},
	/* Definition of register a0 */
	{"a0", 32, "R[10]", 0},
	/* Definition of register a1 */
	{"a1", 32, "R[11]", 0},
	/* Definition of register a2 */
	{"a2", 32, "R[12]", 0},
	/* Definition of register a3 */
	{"a3", 32, "R[13]", 0},
	/* Definition of register a4 */
	{"a4", 32, "R[14]", 0},
	/* Definition of register a5 */
	{"a5", 32, "R[15]", 0},
	/* Definition of register a6 */
	{"a6", 32, "R[16]", 0},
	/* Definition of register a7 */
	{"a7", 32, "R[17]", 0},
	/* Definition of register s2 */
	{"s2", 32, "R[18]", 0},
	/* Definition of register s3 */
	{"s3", 32, "R[19]", 0},
	/* Definition of register s4 */
	{"s4", 32, "R[20]", 0},
	/* Definition of register s5 */
	{"s5", 32, "R[21]", 0},
	/* Definition of register s6 */
	{"s6", 32, "R[22]", 0},
	/* Definition of register s7 */
	{"s7", 32, "R[23]", 0},
	/* Definition of register s8 */
	{"s8", 32, "R[24]", 0},
	/* Definition of register s9 */
	{"s9", 32, "R[25]", 0},
	/* Definition of register s10 */
	{"s10", 32, "R[26]", 0},
	/* Definition of register s11 */
	{"s11", 32, "R[27]", 0},
	/* Definition of register t3 */
	{"t3", 32, "R[28]", 0},
	/* Definition of register t4 */
	{"t4", 32, "R[29]", 0},
	/* Definition of register t5 */
	{"t5", 32, "R[30]", 0},
	/* Definition of register t6 */
	{"t6", 32, "R[31]", 0},
	/* Definition of register pc */
	{"pc", 32, "PC", 0},
	/* Definition of register ft0 */
	{"ft0", 32, "F[0]", 0},
	/* Definition of register ft1 */
	{"ft1", 32, "F[1]", 0},
	/* Definition of register ft2 */
	{"ft2", 32, "F[2]", 0},
	/* Definition of register ft3 */
	{"ft3", 32, "F[3]", 0},
	/* Definition of register ft4 */
	{"ft4", 32, "F[4]", 0},
	/* Definition of register ft5 */
	{"ft5", 32, "F[5]", 0},
	/* Definition of register ft6 */
	{"ft6", 32, "F[6]", 0},
	/* Definition of register ft7 */
	{"ft7", 32, "F[7]", 0},
	/* Definition of register fs0 */
	{"fs0", 32, "F[8]", 0},
	/* Definition of register fs1 */
	{"fs1", 32, "F[9]", 0},
	/* Definition of register fa0 */
	{"fa0", 32, "F[10]", 0},
	/* Definition of register fa1 */
	{"fa1", 32, "F[11]", 0},
	/* Definition of register fa2 */
	{"fa2", 32, "F[12]", 0},
	/* Definition of register fa3 */
	{"fa3", 32, "F[13]", 0},
	/* Definition of register fa4 */
	{"fa4", 32, "F[14]", 0},
	/* Definition of register fa5 */
	{"fa5", 32, "F[15]", 0},
	/* Definition of register fa6 */
	{"fa6", 32, "F[16]", 0},
	/* Definition of register fa7 */
	{"fa7", 32, "F[17]", 0},
	/* Definition of register fs2 */
	{"fs2", 32, "F[18]", 0},
	/* Definition of register fs3 */
	{"fs3", 32, "F[19]", 0},
	/* Definition of register fs4 */
	{"fs4", 32, "F[20]", 0},
	/* Definition of register fs5 */
	{"fs5", 32, "F[21]", 0},
	/* Definition of register fs6 */
	{"fs6", 32, "F[22]", 0},
	/* Definition of register fs7 */
	{"fs7", 32, "F[23]", 0},
	/* Definition of register fs8 */
	{"fs8", 32, "F[24]", 0},
	/* Definition of register fs9 */
	{"fs9", 32, "F[25]", 0},
	/* Definition of register fs10 */
	{"fs10", 32, "F[26]", 0},
	/* Definition of register fs11 */
	{"fs11", 32, "F[27]", 0},
	/* Definition of register ft8 */
	{"ft8", 32, "F[28]", 0},
	/* Definition of register ft9 */
	{"ft9", 32, "F[29]", 0},
	/* Definition of register ft10 */
	{"ft10", 32, "F[30]", 0},
	/* Definition of register ft11 */
	{"ft11", 32, "F[31]", 0},
	/* Definition of register fcsr */
	{"fcsr", 32, "FCSR", 0},
	/* Definition of register fflags */
	{"fflags", 32, "FFLAGS", 0},
	/* Definition of register frm */
	{"frm", 32, "FRM", 0},
	/* end of list */
	{"", 0, "", 0}
};

