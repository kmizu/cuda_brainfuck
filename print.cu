#include "print.h"

const char *usage = "USAGE: gpubf [-chlmntv] [-d character] [-b number of blocks] [file ...]";

__host__ void error(char *format, ...){
    va_list args;

    va_start(args, format);
    vfprintf(stderr, format, args);
    va_end(args);
    exit(EXIT_FAILURE);
}

__host__ void help(void){
    puts(usage);
    puts("\nOPTIONS:");
    puts("\t-c\tExecute the same program on CPU(1 core, 1 thread).");
    puts("\t-h\tDisplay available options and exit.");
    puts("\t-l\tDisplay execution time and number of processor for logging.");
    puts("\t-m\tDisplay execution time includes copying memory among host and device.");
    puts("\t\tThis option turns on the -t option.");
    puts("\t-n\tDisplay the result of execution with a number.");
    puts("\t-t\tDisplay execution time with the result.");
    puts("\t-v\tDisplay product version and exit.");
    puts("\t-b decimal");
    puts("\t\tSet the block size of kernel function");
    puts("\t\t(default block size is 1).");
    puts("\t-d character");
    puts("\t\tSet the delimiter of the source code");
    puts("\t\t(default delimiter is LF, and EOF is always taken as the delimiter).");
    exit(EXIT_SUCCESS);
}

__host__ void version(void){
    puts("Brainfuck interpreter on GPGPU version 1.1");
    exit(EXIT_SUCCESS);
}
