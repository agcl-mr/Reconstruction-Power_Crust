#	type "make".

CC	= gcc
CPLUS  = g++
AR	= ar
CFLAGS	= -g -Wall 
OBJS	= hull.o ch.o io.o crust.o power.o rand.o pointops.o fg.o math.o predicates.o heap.o label.o
HDRS	= hull.h points.h pointsites.h stormacs.h 
SRC	= hull.c ch.c io.c crust.c power.c rand.c pointops.c fg.c math.c predicates.c heap.c label.c 
PROG	= powercrust
LIB	= lib$(PROG).a



all	: $(PROG) simplify orient

$(OBJS) : $(HDRS)

hullmain.o	: $(HDRS)

$(PROG)	: $(OBJS) hullmain.o
	$(CC) $(CFLAGS) $(OBJS) hullmain.o -o $(PROG) -lm
	$(AR) rcv $(LIB) $(OBJS)

simplify: powershape.C sdefs.h
	$(CPLUS) -o simplify powershape.C -lm

orient: setNormals.C ndefs.h
	$(CPLUS) -o orient setNormals.C -lm

distrib:
	tar cvf powercrust.tar DOC LICENSE README VERSION Makefile *.h *.c *.C *.pts

clean	:
	-rm -f $(OBJS) hullmain.o core a.out $(PROG) simplify orient

