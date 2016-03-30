# Makefile for TinyScheme
# Time-stamp: <2002-06-24 14:13:27 gildea>
# Unix, generally
ifeq ($(CC),)
    CC=gcc
endif

CFLAGS = -fpic -pedantic
DEBUG=-g -Wall -Wno-char-subscripts -O
Osuf=o
SOsuf=so
LIBsuf=a
EXE_EXT=
LIBPREFIX=lib
OUT = -o $@
RM= -rm -f
#AR= ar crs

# Linux
LD = $(CC)
LDFLAGS = -shared
DEBUG=-g -Wno-char-subscripts -O
#SYS_LIBS= -ldl -lm
PLATFORM_FEATURES= -DSUN_DL=1

FEATURES = $(PLATFORM_FEATURES) -DUSE_DL=1  -DUSE_ASCII_NAMES=0 -DUSE_MATH=1

OBJS = scheme.$(Osuf) dynload.$(Osuf)

LIBTARGET = $(LIBPREFIX)tinyscheme.$(SOsuf)
STATICLIBTARGET = $(LIBPREFIX)tinyscheme.$(LIBsuf)

all: $(LIBTARGET)

%.$(Osuf): %.c
	$(CC) -I. -c $(DEBUG) $(FEATURES) $(DL_FLAGS) $(CFLAGS) $<

$(LIBTARGET): $(OBJS)
	$(LD) $(LDFLAGS) $(OUT) $(OBJS) $(SYS_LIBS)

scheme$(EXE_EXT): $(OBJS)
	$(CC) -o $@ $(DEBUG) $(OBJS) $(SYS_LIBS) $(CFLAGS)

$(OBJS): scheme.h scheme-private.h opdefines.h
dynload.$(Osuf): dynload.h

clean:
	$(RM) $(OBJS) $(LIBTARGET)  scheme$(EXE_EXT)
	$(RM) tinyscheme.ilk tinyscheme.map tinyscheme.pdb tinyscheme.exp
	$(RM) scheme.ilk scheme.map scheme.pdb scheme.lib scheme.exp
	$(RM) *~

TAGS_SRCS = scheme.h scheme.c dynload.h dynload.c

tags: TAGS
TAGS: $(TAGS_SRCS)
	etags $(TAGS_SRCS)
