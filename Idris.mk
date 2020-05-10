IDRIS_INCLUDES += -I$(IDRIS_RTS_PATH) -I$(IDRIS_RTS_PATH)/arduino
CFLAGS   += $(IDRIS_INCLUDES)

IDRIS_RTS_CFLAGS = -DFORCE_ALIGNMENT -DIDRIS_TARGET_OS=\"none\" -DIDRIS_TARGET_TRIPLE=\"arduino\"

NO_CORE_MAIN_CPP := "true"

RTS_OBJS = \
	$(OBJDIR)/rts/arduino/idris_main.o \
	$(OBJDIR)/rts/idris_gc.o \
	$(OBJDIR)/rts/idris_rts.o \
	$(OBJDIR)/rts/idris_bitstring.o \
	$(OBJDIR)/rts/idris_gmp.o \
	$(OBJDIR)/rts/idris_heap.o \
	$(OBJDIR)/rts/mini-gmp.o

LOCAL_C_SRCS += $(IDRIS_MAIN:.idr=.c)
OTHER_OBJS += $(RTS_OBJS)

include $(ARDUINO_MAKEFILE_PATH)

%.c: %.idr
	idris -S --codegen C $< -o $@

# Idris rts files
$(OBJDIR)/rts/%.o: $(IDRIS_RTS_PATH)/%.c $(COMMON_DEPS) | $(OBJDIR)
	@$(MKDIR) $(dir $@)
	$(CC) -MMD -c $(CPPFLAGS) $(CFLAGS) $(IDRIS_RTS_CFLAGS) $< -o $@
