CC = gcc
CLIENT_OBJ = client.o
ECHOCLIENT_OBJ = echoclient.o
MUL_P_OBJ = mul_p.o
MUL_T_OBJ = mul_t.o
MUL_P_SERVER = mul_p_server.o
MUL_T_SERVER = mul_t_server.o

%.o: %.c
	$(CC) -c -o $@ $<

all: echoclient mul_p_server mul_t_server

echoclient: $(ECHOCLIENT_OBJ) $(CLIENT_OBJ)
	$(CC) -o client $(ECHOCLIENT_OBJ) $(CLIENT_OBJ)
mul_p_server: $(MUL_P_SERVER) $(MUL_P_OBJ)
	$(CC) -o mul_p_server $(MUL_P_SERVER) $(MUL_P_OBJ)
mul_t_server: $(MUL_T_SERVER) $(MUL_T_OBJ)
	$(CC) -o mul_t_server $(MUL_T_SERVER) $(MUL_T_OBJ) -lpthread

.PHONY: clean
clean:
	-rm *.o client mul_p_server mul_t_server
