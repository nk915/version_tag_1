# Git 버전 정보를 가져오는 변수
GIT_TAG = $(shell git describe --tags --exact-match 2>/dev/null || echo "")
GIT_COMMIT = $(shell git rev-parse --short HEAD)
GIT_BRANCH = $(shell git rev-parse --abbrev-ref HEAD)

# release/로 시작하는지 확인
IS_RELEASE = $(findstring release/,$(GIT_BRANCH))


# 태그가 없으면 이전 태그를 기반으로 버전 생성
ifeq ($(GIT_TAG),)
    LAST_TAG = $(shell git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")
    VERSION_SUFFIX = $(if $(IS_RELEASE),m,d)
#    VERSION_SUFFIX = $(if $(filter main,$(GIT_BRANCH)),m,d)
    VERSION = $(LAST_TAG) ($(GIT_COMMIT))$(VERSION_SUFFIX)
else
    VERSION = $(GIT_TAG) ($(GIT_COMMIT))
endif
