#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// $ getconf PAGESIZE
#define PAGESIZE 4086

/*

SYNOPSIS:

scan the mbsync -a output and tells you what channels have new messages

EXAMPLE:

yes | mbsync -a | new_msg_from_mbsync 


TODO:

what if the line is up to 4084 chars ? 

*/

int
main (void) {

    char line[PAGESIZE];
    char channel[PAGESIZE];
    int  newmsg;

    while ( fgets( line, PAGESIZE, stdin ) ) {

        if (sscanf
            ( line
            , "Channel %s"
            , channel)
        ) continue;

        if (sscanf
            ( line
            , "Pulling new messages..... %d messages"
            , &newmsg )
        ) { printf("%s:%d", channel, newmsg ); }

    }
    return(0);
}

