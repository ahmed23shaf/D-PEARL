LDVERSION= $(shell $(PIC_LD) -v | grep -q 2.30 ;echo $$?)
ifeq ($(LDVERSION), 0)
     LD_NORELAX_FLAG= --no-relax
endif

ARCHIVE_OBJS=
ARCHIVE_OBJS += _1152155_archive_1.so
_1152155_archive_1.so : archive.0/_1152155_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -Bsymbolic $(LD_NORELAX_FLAG)  -o .//../top_tb.daidir//_1152155_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../top_tb.daidir//_1152155_archive_1.so $@


ARCHIVE_OBJS += _1156571_archive_1.so
_1156571_archive_1.so : archive.0/_1156571_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -Bsymbolic $(LD_NORELAX_FLAG)  -o .//../top_tb.daidir//_1156571_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../top_tb.daidir//_1156571_archive_1.so $@




VCS_CU_ARC_OBJS = 


O0_OBJS =

$(O0_OBJS) : %.o: %.c
	$(CC_CG) $(CFLAGS_O0) -c -o $@ $<


%.o: %.c
	$(CC_CG) $(CFLAGS_CG) -c -o $@ $<

CU_UDP_OBJS = \


CU_UDP_OBJS += 
CU_LVL_OBJS = \
SIM_l.o 

MAIN_OBJS = \
objs/amcQw_d.o 

CU_OBJS = $(MAIN_OBJS) $(ARCHIVE_OBJS) $(CU_UDP_OBJS) $(CU_LVL_OBJS)

