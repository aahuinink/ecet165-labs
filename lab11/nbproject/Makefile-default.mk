#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/lab11.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/lab11.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED="C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6/lcd18f.c" "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11/analog18f.c" "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11/analogTest.c" "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab9/RealTimeClock.c" "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/matrixkeypad/keypad18f.c" "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab8/timer0.c"

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/54345759/lcd18f.p1 ${OBJECTDIR}/_ext/1684718423/analog18f.p1 ${OBJECTDIR}/_ext/1684718423/analogTest.p1 ${OBJECTDIR}/_ext/54345762/RealTimeClock.p1 ${OBJECTDIR}/_ext/1630404949/keypad18f.p1 ${OBJECTDIR}/_ext/54345761/timer0.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/54345759/lcd18f.p1.d ${OBJECTDIR}/_ext/1684718423/analog18f.p1.d ${OBJECTDIR}/_ext/1684718423/analogTest.p1.d ${OBJECTDIR}/_ext/54345762/RealTimeClock.p1.d ${OBJECTDIR}/_ext/1630404949/keypad18f.p1.d ${OBJECTDIR}/_ext/54345761/timer0.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/54345759/lcd18f.p1 ${OBJECTDIR}/_ext/1684718423/analog18f.p1 ${OBJECTDIR}/_ext/1684718423/analogTest.p1 ${OBJECTDIR}/_ext/54345762/RealTimeClock.p1 ${OBJECTDIR}/_ext/1630404949/keypad18f.p1 ${OBJECTDIR}/_ext/54345761/timer0.p1

# Source Files
SOURCEFILES=C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6/lcd18f.c C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11/analog18f.c C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11/analogTest.c C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab9/RealTimeClock.c C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/matrixkeypad/keypad18f.c C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab8/timer0.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/lab11.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F57Q43
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/54345759/lcd18f.p1: C:/Users/a_hui/OneDrive\ -\ Camosun\ College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6/lcd18f.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/54345759" 
	@${RM} ${OBJECTDIR}/_ext/54345759/lcd18f.p1.d 
	@${RM} ${OBJECTDIR}/_ext/54345759/lcd18f.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/matrixkeypad" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab9" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab8" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab10" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/54345759/lcd18f.p1 "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6/lcd18f.c" 
	@-${MV} ${OBJECTDIR}/_ext/54345759/lcd18f.d ${OBJECTDIR}/_ext/54345759/lcd18f.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/54345759/lcd18f.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1684718423/analog18f.p1: C:/Users/a_hui/OneDrive\ -\ Camosun\ College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11/analog18f.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1684718423" 
	@${RM} ${OBJECTDIR}/_ext/1684718423/analog18f.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1684718423/analog18f.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/matrixkeypad" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab9" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab8" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab10" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1684718423/analog18f.p1 "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11/analog18f.c" 
	@-${MV} ${OBJECTDIR}/_ext/1684718423/analog18f.d ${OBJECTDIR}/_ext/1684718423/analog18f.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1684718423/analog18f.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1684718423/analogTest.p1: C:/Users/a_hui/OneDrive\ -\ Camosun\ College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11/analogTest.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1684718423" 
	@${RM} ${OBJECTDIR}/_ext/1684718423/analogTest.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1684718423/analogTest.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/matrixkeypad" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab9" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab8" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab10" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1684718423/analogTest.p1 "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11/analogTest.c" 
	@-${MV} ${OBJECTDIR}/_ext/1684718423/analogTest.d ${OBJECTDIR}/_ext/1684718423/analogTest.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1684718423/analogTest.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/54345762/RealTimeClock.p1: C:/Users/a_hui/OneDrive\ -\ Camosun\ College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab9/RealTimeClock.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/54345762" 
	@${RM} ${OBJECTDIR}/_ext/54345762/RealTimeClock.p1.d 
	@${RM} ${OBJECTDIR}/_ext/54345762/RealTimeClock.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/matrixkeypad" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab9" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab8" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab10" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/54345762/RealTimeClock.p1 "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab9/RealTimeClock.c" 
	@-${MV} ${OBJECTDIR}/_ext/54345762/RealTimeClock.d ${OBJECTDIR}/_ext/54345762/RealTimeClock.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/54345762/RealTimeClock.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1630404949/keypad18f.p1: C:/Users/a_hui/OneDrive\ -\ Camosun\ College/term2/ecet165_embedded_mc/labs/ecet165-labs/matrixkeypad/keypad18f.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1630404949" 
	@${RM} ${OBJECTDIR}/_ext/1630404949/keypad18f.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1630404949/keypad18f.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/matrixkeypad" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab9" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab8" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab10" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1630404949/keypad18f.p1 "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/matrixkeypad/keypad18f.c" 
	@-${MV} ${OBJECTDIR}/_ext/1630404949/keypad18f.d ${OBJECTDIR}/_ext/1630404949/keypad18f.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1630404949/keypad18f.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/54345761/timer0.p1: C:/Users/a_hui/OneDrive\ -\ Camosun\ College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab8/timer0.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/54345761" 
	@${RM} ${OBJECTDIR}/_ext/54345761/timer0.p1.d 
	@${RM} ${OBJECTDIR}/_ext/54345761/timer0.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/matrixkeypad" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab9" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab8" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab10" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/54345761/timer0.p1 "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab8/timer0.c" 
	@-${MV} ${OBJECTDIR}/_ext/54345761/timer0.d ${OBJECTDIR}/_ext/54345761/timer0.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/54345761/timer0.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/54345759/lcd18f.p1: C:/Users/a_hui/OneDrive\ -\ Camosun\ College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6/lcd18f.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/54345759" 
	@${RM} ${OBJECTDIR}/_ext/54345759/lcd18f.p1.d 
	@${RM} ${OBJECTDIR}/_ext/54345759/lcd18f.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/matrixkeypad" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab9" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab8" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab10" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/54345759/lcd18f.p1 "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6/lcd18f.c" 
	@-${MV} ${OBJECTDIR}/_ext/54345759/lcd18f.d ${OBJECTDIR}/_ext/54345759/lcd18f.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/54345759/lcd18f.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1684718423/analog18f.p1: C:/Users/a_hui/OneDrive\ -\ Camosun\ College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11/analog18f.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1684718423" 
	@${RM} ${OBJECTDIR}/_ext/1684718423/analog18f.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1684718423/analog18f.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/matrixkeypad" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab9" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab8" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab10" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1684718423/analog18f.p1 "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11/analog18f.c" 
	@-${MV} ${OBJECTDIR}/_ext/1684718423/analog18f.d ${OBJECTDIR}/_ext/1684718423/analog18f.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1684718423/analog18f.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1684718423/analogTest.p1: C:/Users/a_hui/OneDrive\ -\ Camosun\ College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11/analogTest.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1684718423" 
	@${RM} ${OBJECTDIR}/_ext/1684718423/analogTest.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1684718423/analogTest.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/matrixkeypad" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab9" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab8" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab10" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1684718423/analogTest.p1 "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11/analogTest.c" 
	@-${MV} ${OBJECTDIR}/_ext/1684718423/analogTest.d ${OBJECTDIR}/_ext/1684718423/analogTest.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1684718423/analogTest.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/54345762/RealTimeClock.p1: C:/Users/a_hui/OneDrive\ -\ Camosun\ College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab9/RealTimeClock.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/54345762" 
	@${RM} ${OBJECTDIR}/_ext/54345762/RealTimeClock.p1.d 
	@${RM} ${OBJECTDIR}/_ext/54345762/RealTimeClock.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/matrixkeypad" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab9" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab8" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab10" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/54345762/RealTimeClock.p1 "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab9/RealTimeClock.c" 
	@-${MV} ${OBJECTDIR}/_ext/54345762/RealTimeClock.d ${OBJECTDIR}/_ext/54345762/RealTimeClock.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/54345762/RealTimeClock.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1630404949/keypad18f.p1: C:/Users/a_hui/OneDrive\ -\ Camosun\ College/term2/ecet165_embedded_mc/labs/ecet165-labs/matrixkeypad/keypad18f.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1630404949" 
	@${RM} ${OBJECTDIR}/_ext/1630404949/keypad18f.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1630404949/keypad18f.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/matrixkeypad" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab9" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab8" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab10" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1630404949/keypad18f.p1 "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/matrixkeypad/keypad18f.c" 
	@-${MV} ${OBJECTDIR}/_ext/1630404949/keypad18f.d ${OBJECTDIR}/_ext/1630404949/keypad18f.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1630404949/keypad18f.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/54345761/timer0.p1: C:/Users/a_hui/OneDrive\ -\ Camosun\ College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab8/timer0.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/54345761" 
	@${RM} ${OBJECTDIR}/_ext/54345761/timer0.p1.d 
	@${RM} ${OBJECTDIR}/_ext/54345761/timer0.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/matrixkeypad" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab9" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab8" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab10" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/54345761/timer0.p1 "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab8/timer0.c" 
	@-${MV} ${OBJECTDIR}/_ext/54345761/timer0.d ${OBJECTDIR}/_ext/54345761/timer0.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/54345761/timer0.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/lab11.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/lab11.${IMAGE_TYPE}.map  -D__DEBUG=1  -mdebugger=none  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/matrixkeypad" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab9" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab8" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab10" -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto        $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/lab11.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} ${DISTDIR}/lab11.${IMAGE_TYPE}.hex 
	
else
${DISTDIR}/lab11.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/lab11.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/matrixkeypad" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab9" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab8" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab10" -mwarn=-3 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/lab11.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
