NVCC = nvcc
CFLAGS = -gencode=arch=compute_30,code=\"sm_30,compute_30\"

TARGET = gpubf
OBJS = print.o stopwatch.o transmit.o brainfuck.o main.o

.SUFFIXES: .cu .o
.PHONY: all run clean clear

all: $(TARGET)

run: $(TARGET)
	./$(TARGET)

$(TARGET): $(OBJS)
	$(NVCC) -o $(TARGET) $(OBJS)

.cu.o:
	$(NVCC) $(CFLAGS) -c $<

clean:
	rm -f $(OBJS)

clear: clean
	rm -f $(TARGET)
