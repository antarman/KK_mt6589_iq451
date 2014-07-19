LOCAL_DIR := $(GET_LOCAL_DIR)

DUMMY_AP := no
ifeq ($(DUMMY_AP), yes)
DEFINES += DUMMY_AP
MEMBASE := 0x8A000000 # SDRAM
else
MEMBASE := 0x81E00000 # SDRAM
endif
MEMSIZE := 0x00900000 # 1MB

SCRATCH_ADDR     := 0x85000000
HAVE_CACHE_PL310 := no
LK_PROFILING := yes
MTK_FASTBOOT_SUPPORT := yes

MACH_TYPE := 6589
# choose one of following value -> 1: disabled/ 2: permissive /3: enforcing 
SELINUX_STATUS := 3

DEFINES += \
        MEMBASE=$(MEMBASE)\
	SCRATCH_ADDR=$(SCRATCH_ADDR)\
	MACH_TYPE=$(MACH_TYPE)\
	ENABLE_L2_SHARING\
	SELINUX_STATUS=$(SELINUX_STATUS)

ifeq ($(HAVE_CACHE_PL310), yes)
DEFINES += HAVE_CACHE_PL310
endif

ifeq ($(MTK_FASTBOOT_SUPPORT), yes)
DEFINES += MTK_FASTBOOT_SUPPORT
endif

ifeq ($(LK_PROFILING), yes)
DEFINES += LK_PROFILING
endif



ifneq ($(filter user userdebug, $(TARGET_BUILD_VARIANT)),)
DEFINES += USER_BUILD
endif
