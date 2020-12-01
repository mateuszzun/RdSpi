CXX = g++
CFLAGS = -Wall -Wextra -Werror
CFLAGS += -g
#CFLAGS += -O3
#CFLAGS += -std=gnu99
LIBS    = 

CORE = rdspi
CORE_LIB := lib$(CORE).a
MAIN = main.o
LIB_IFCE = rdspi.o
OBJS = cmd.o pi2c.o rpi_pin.o si4703.o rds.o cio.o cli.o
#SRC =  cmd.c main.c pi2c.c rpi_pin.c si4703.c rds.c cio.c cli.c
#HFILES = Makefile pi2c.h rpi_pin.h si4703.h rds.h cmd.h cli.h

all: $(CORE)

$(CORE): $(MAIN) $(OBJS) Makefile
	$(CXX) $(CFLAGS) -o $(CORE) $(OBJS) $(LIBS)

$(CORE_LIB): $(LIB_IFCE) $(OBJS) Makefile
	ar cr $(CORE_LIB) $(LIB_IFCE) $(OBJS) 
clean:
	rm -f $(CORE)
	rm -f *.o *.a

#%.o: %.c $(HFILES)
%.o: %.c
	$(CXX) -c $(CFLAGS) $< -o $@


