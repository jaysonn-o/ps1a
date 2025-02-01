# C++ Compiler
COMPILER = g++

# C++ Flags
CFLAGS = --std=c++17 -Wall -Werror -pedantic -g

# Libraries
LIB = -lboost_unit_test_framework

# Hpp files (dependencies)
DEPS = FibLFSR.hpp

# Cpp files that should be compiled into object files
OBJECTS = FibLFSR.o PhotoMagic.o
OBJECTS_PHOTO_MAGIC = main.o
OBJECTS_TEST = test.o

# Programs
PROGRAM_PHOTO_MAGIC = PhotoMagic
PROGRAM_TEST = test

# Static library
STATIC_LIB = PhotoMagic.a

# Generate `PhotoMagic`, `test`, and `PhotoMagic.a` (static library)
.PHONY: all clean lint

all: $(PROGRAM_TEST) $(PROGRAM_PHOTO_MAGIC)

%.o: %.cpp $(DEPS)
	$(COMPILER) $(CFLAGS) -c $<

$(PROGRAM_PHOTO_MAGIC): $(STATIC_LIB) $(OBJECTS_PHOTO_MAGIC)
	$(COMPILER) $(CFLAGS) -o $@ $(OBJECTS_PHOTO_MAGIC) $(STATIC_LIB) $(LIB)

$(PROGRAM_TEST): $(STATIC_LIB) $(OBJECTS_TEST)
	$(COMPILER) $(CFLAGS) -o $@ $(OBJECTS_TEST) $(STATIC_LIB) $(LIB)

$(STATIC_LIB): $(OBJECTS)
	ar rcs $(STATIC_LIB) $(OBJECTS)

runPhotoMagic: $(PROGRAM_PHOTO_MAGIC)
	./$(PROGRAM_PHOTO_MAGIC) && make clean

runTest: $(PROGRAM_TEST)
	./$(PROGRAM_TEST) && make clean

clean:
	rm -f *.o $(STATIC_LIB) $(PROGRAM_PHOTO_MAGIC) $(PROGRAM_TEST)

lint:
	cpplint *.cpp *.hpp
