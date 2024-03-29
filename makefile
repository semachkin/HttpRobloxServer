CR := gcc
EXE := server

FLAGS := -std=c99 -Wall
LIBS := -lwsock32 -lws2_32

SRC := ./server/
TMP := ./temp/

NEED := $(TMP)srvmain.o $(TMP)srvencoder.o $(TMP)srvhashlist.o

FOOT = -o $@
HEAD = -c $<

$(EXE): $(NEED)
	$(CR) $(FLAGS) $(NEED) $(FOOT) $(LIBS)
	@echo ====== SUCCESS BUILD ======

$(TMP)%.o: $(SRC)%.c
	$(CR) $(FLAGS) $(HEAD) $(FOOT) $(LIBS)

clean:
	cd $(TMP) & $(foreach obj,$(wildcard $(TMP)*.o),del $(subst $(TMP), ,$(obj));)
	@echo ====== SUCCESS CLEAN ======