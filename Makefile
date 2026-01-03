COMPILER = cc
LIB_OPTS = -lraylib -lGL -lm -lpthread -ldl -lrt -lX11
INCLUDE_PATHS = -Iinclude/
OUT = -o bin/RayRender
CFILES = RayRender/*.c
PLATFORM := $(shell uname)

ifeq ($(PLATFORM), Darwin)
	COMPILER = clang
	LIB_OPTS = -Llib/darwin/ -framework CoreVideo -framework IOKit -framework Cocoa -framework GLUT -framework OpenGL -lraylib
endif

build:
	$(COMPILER) $(INCLUDE_PATHS) $(CFILES) $(OUT) $(LIB_OPTS)

run:
	./bin/RayRender

clean:
	rm -rf ./bin/RayRender
