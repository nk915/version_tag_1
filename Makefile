# Makefile
CC = gcc
CFLAGS = -Wall
TARGET = program
SRC = main.c


include make-config.mk


# 빌드 규칙
all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -DVERSION="\"$(VERSION)"\" $(SRC) -o $(TARGET)

clean:
	rm -f $(TARGET)

.PHONY: all clean


include make-print.mk