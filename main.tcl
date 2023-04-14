#!/usr/bin/tclsh

source bitswapper.tcl;
source parser.tcl;

proc read_lines_from_file {filename conv} {
    set file [open $filename r]
    while {[gets $file line] != -1} {
        puts "__________"
        if {$conv eq "bitswap"} {
            biswapper_fn $line;
        } elseif {$conv eq "gps_parse"} {
            parser_fn "$line\r\n\ "
        }
        
    }
    close $file
}

read_lines_from_file sample_gps.txt gps_parse
read_lines_from_file sample_bitfields.txt bitswap
