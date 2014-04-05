#include <stdlib.h>
#include <stdio.h>

/*
   
SYNOPSIS 

    when inspecting a file

    * you're spotting offsets
    * programs need sizes

    this program takes a list of offsets (and optionnal keys) and outputs the
    list of sizes and keys suffixed with :a (with write a Data::FixedFormat
    specs in mind)

EXAMPLES

    > ./a.out 10 30 60 
    10 20 30 

    > ./a.out header 10 sender 30 signature 60 
    header:a10 sender:a20 signature:a30 

*/

#define A argv[i]
#define A_IN_ARGV int i=1; i < argc; i++

int
main (int argc, char **argv) {

    /* * from is the current offset
         (starts at 0)
       * to is the next offset read from argv */

    int from = 0
        , to;

    for (A_IN_ARGV) {
        // int found? next offset ... 
        if ( sscanf(A, "%d", &to) ) {
            // compute step
            printf("%d ", to - from);
            from = to;
        }
        else {
            // print key
            printf("%s:a",A);
        }
    }

    return(0);
}
