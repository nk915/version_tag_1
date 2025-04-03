# Makefile
CC = gcc
CFLAGS = -Wall
TARGET = program
SRC = main.c

# Git 버전 정보를 가져오는 변수
GIT_TAG = $(shell git describe --tags --exact-match 2>/dev/null || echo "")
GIT_COMMIT = $(shell git rev-parse --short HEAD)
GIT_BRANCH = $(shell git rev-parse --abbrev-ref HEAD)

# 태그가 없으면 이전 태그를 기반으로 버전 생성
ifeq ($(GIT_TAG),)
    LAST_TAG = $(shell git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")
    VERSION_SUFFIX = $(if $(filter main,$(GIT_BRANCH)),m,d)
    VERSION = $(LAST_TAG)-$(GIT_COMMIT)-$(VERSION_SUFFIX)
else
    VERSION = $(GIT_TAG)-$(GIT_COMMIT)
endif

# 빌드 규칙
all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -DVERSION=\"$(VERSION)\" $(SRC) -o $(TARGET)

clean:
	rm -f $(TARGET)

.PHONY: all clean