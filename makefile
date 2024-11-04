CC = gcc
CFLAGS = -Wall -fPIC
LDFLAGS = -L./lib

# 디렉토리 설정
LIBDIR = lib

# 타겟 파일들
STATIC_LIB = $(LIBDIR)/libarithmetics.a
SHARED_LIB = $(LIBDIR)/libarithmetics.so
MAIN_PROG_STATIC = main_static
MAIN_PROG_SHARED = main_shared

# 소스 및 오브젝트 파일
MAIN_SRC = main.c
MAIN_OBJ = main.o
LIB_SRC = $(LIBDIR)/arithmetics.c
LIB_OBJ = $(LIBDIR)/arithmetics.o

all: $(MAIN_PROG_STATIC) $(MAIN_PROG_SHARED)

# 정적 라이브러리 생성 및 링킹
$(STATIC_LIB): $(LIB_OBJ)
	ar rcs $@ $<

$(MAIN_PROG_STATIC): $(MAIN_OBJ) $(STATIC_LIB)
	$(CC) $(CFLAGS) -o $@ $(MAIN_OBJ) $(LDFLAGS) -larithmetics

# 공유 라이브러리 생성 및 링킹
$(SHARED_LIB): $(LIB_OBJ)
	$(CC) -shared -o $@ $<

$(MAIN_PROG_SHARED): $(MAIN_OBJ) $(SHARED_LIB)
	$(CC) $(CFLAGS) -o $@ $(MAIN_OBJ) $(LDFLAGS) -larithmetics

# 오브젝트 파일 생성
$(MAIN_OBJ): $(MAIN_SRC)
	$(CC) $(CFLAGS) -c $< -o $@

$(LIB_OBJ): $(LIB_SRC)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(MAIN_PROG_STATIC) $(MAIN_PROG_SHARED)
	rm -f $(MAIN_OBJ) $(LIB_OBJ)
	rm -f $(STATIC_LIB) $(SHARED_LIB)

.PHONY: all clean
