#ifndef TRANSMIT_H_INCLUDED
#define TRANSMIT_H_INCLUDED
#include <stdio.h>
#include <stdlib.h>

#define CODE_LENGTH 64

typedef struct Code_tag Code;
struct Code_tag{
    char code[CODE_LENGTH];
    Code *next;
};

typedef struct Source_tag Source;
struct Source_tag{
    Code *codes;
    int codes_len;
    Source *next;
};

__host__ Source *get_strings(FILE *in, char delimiter);
__host__ int pack_strings(int **data, Source *source);
__host__ void transmit_data(int **data_d, int *data, int len);

#endif // TRANSMIT_H_INCLUDED
