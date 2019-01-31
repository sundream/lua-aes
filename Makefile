default : linux
.PHONY: linux clean test

CC = gcc
LUA_INC=/usr/local/include
LUA_LIB=/usr/local/lib
CFLAGS = -Wall -O2 -I$(LUA_INC) -L$(LUA_LIB)
SHARED := -fPIC --shared

linux: aes128.so aes192.so aes256.so

aes128.so: aes.c laes.c
	$(CC) $(CFLAGS) $(SHARED) -DAES128=1 -o $@ $^

aes192.so: aes.c laes.c
	$(CC) $(CFLAGS) $(SHARED) -DAES192=1 -o $@ $^

aes256.so: aes.c laes.c
	$(CC) $(CFLAGS) $(SHARED) -DAES256=1 -o $@ $^

test:
	lua test.lua

clean:
	rm -f *.so
