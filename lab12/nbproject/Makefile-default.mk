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
FINAL_IMAGE=${DISTDIR}/lab12.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/lab12.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED="C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab12/serial18f.c" "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab12/ADCwithSerial.c" "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11/analog18f.c" "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6/lcd18f.c"

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1684718424/serial18f.p1 ${OBJECTDIR}/_ext/1684718424/ADCwithSerial.p1 ${OBJECTDIR}/_ext/1684718423/analog18f.p1 ${OBJECTDIR}/_ext/54345759/lcd18f.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1684718424/serial18f.p1.d ${OBJECTDIR}/_ext/1684718424/ADCwithSerial.p1.d ${OBJECTDIR}/_ext/1684718423/analog18f.p1.d ${OBJECTDIR}/_ext/54345759/lcd18f.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1684718424/serial18f.p1 ${OBJECTDIR}/_ext/1684718424/ADCwithSerial.p1 ${OBJECTDIR}/_ext/1684718423/analog18f.p1 ${OBJECTDIR}/_ext/54345759/lcd18f.p1

# Source Files
SOURCEFILES=C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab12/serial18f.c C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab12/ADCwithSerial.c C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11/analog18f.c C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6/lcd18f.c



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
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/lab12.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F57Q43
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1684718424/serial18f.p1: C:/Users/a_hui/OneDrive\ -\ Camosun\ College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab12/serial18f.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1684718424" 
	@${RM} ${OBJECTDIR}/_ext/1684718424/serial18f.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1684718424/serial18f.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1684718424/serial18f.p1 "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab12/serial18f.c" 
	@-${MV} ${OBJECTDIR}/_ext/1684718424/serial18f.d ${OBJECTDIR}/_ext/1684718424/serial18f.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1684718424/serial18f.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1684718424/ADCwithSerial.p1: C:/Users/a_hui/OneDrive\ -\ Camosun\ College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab12/ADCwithSerial.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1684718424" 
	@${RM} ${OBJECTDIR}/_ext/1684718424/ADCwithSerial.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1684718424/ADCwithSerial.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1684718424/ADCwithSerial.p1 "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab12/ADCwithSerial.c" 
	@-${MV} ${OBJECTDIR}/_ext/1684718424/ADCwithSerial.d ${OBJECTDIR}/_ext/1684718424/ADCwithSerial.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1684718424/ADCwithSerial.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1684718423/analog18f.p1: C:/Users/a_hui/OneDrive\ -\ Camosun\ College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11/analog18f.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1684718423" 
	@${RM} ${OBJECTDIR}/_ext/1684718423/analog18f.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1684718423/analog18f.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1684718423/analog18f.p1 "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11/analog18f.c" 
	@-${MV} ${OBJECTDIR}/_ext/1684718423/analog18f.d ${OBJECTDIR}/_ext/1684718423/analog18f.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1684718423/analog18f.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/54345759/lcd18f.p1: C:/Users/a_hui/OneDrive\ -\ Camosun\ College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6/lcd18f.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/54345759" 
	@${RM} ${OBJECTDIR}/_ext/54345759/lcd18f.p1.d 
	@${RM} ${OBJECTDIR}/_ext/54345759/lcd18f.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/54345759/lcd18f.p1 "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6/lcd18f.c" 
	@-${MV} ${OBJECTDIR}/_ext/54345759/lcd18f.d ${OBJECTDIR}/_ext/54345759/lcd18f.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/54345759/lcd18f.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/1684718424/serial18f.p1: C:/Users/a_hui/OneDrive\ -\ Camosun\ College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab12/serial18f.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1684718424" 
	@${RM} ${OBJECTDIR}/_ext/1684718424/serial18f.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1684718424/serial18f.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1684718424/serial18f.p1 "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab12/serial18f.c" 
	@-${MV} ${OBJECTDIR}/_ext/1684718424/serial18f.d ${OBJECTDIR}/_ext/1684718424/serial18f.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1684718424/serial18f.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1684718424/ADCwithSerial.p1: C:/Users/a_hui/OneDrive\ -\ Camosun\ College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab12/ADCwithSerial.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1684718424" 
	@${RM} ${OBJECTDIR}/_ext/1684718424/ADCwithSerial.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1684718424/ADCwithSerial.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1684718424/ADCwithSerial.p1 "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab12/ADCwithSerial.c" 
	@-${MV} ${OBJECTDIR}/_ext/1684718424/ADCwithSerial.d ${OBJECTDIR}/_ext/1684718424/ADCwithSerial.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1684718424/ADCwithSerial.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1684718423/analog18f.p1: C:/Users/a_hui/OneDrive\ -\ Camosun\ College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11/analog18f.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1684718423" 
	@${RM} ${OBJECTDIR}/_ext/1684718423/analog18f.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1684718423/analog18f.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1684718423/analog18f.p1 "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11/analog18f.c" 
	@-${MV} ${OBJECTDIR}/_ext/1684718423/analog18f.d ${OBJECTDIR}/_ext/1684718423/analog18f.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1684718423/analog18f.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/54345759/lcd18f.p1: C:/Users/a_hui/OneDrive\ -\ Camosun\ College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6/lcd18f.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/54345759" 
	@${RM} ${OBJECTDIR}/_ext/54345759/lcd18f.p1.d 
	@${RM} ${OBJECTDIR}/_ext/54345759/lcd18f.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab11" -I"C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6" -mwarn=-3 -Wa,-a -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/54345759/lcd18f.p1 "C:/Users/a_hui/OneDrive - Camosun College/term2/ecet165_embedded_mc/labs/ecet165-labs/lab6/lcd18f.c" 
	@-${MV} ${OBJECTDIR}/_ext/54345759/lcd18f.d ${OBJECTDIR}/_ext/54345759/lcd18f.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/54345759/lcd18f.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

