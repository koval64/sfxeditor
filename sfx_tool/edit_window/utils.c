
char find_note( unsigned hex_freq ) {

    /* char len = sizeof( notes_pal_table ) / sizeof( notes_pal_table[0] ); */
    char len = sizeof( notes_pal_table ) / sizeof( unsigned );

    for(int i=0; i<len; i++)
        if( notes_pal_table[i] == hex_freq ) {
            return i;
        }

    return 0;

}

