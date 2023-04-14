#!/usr/bin/tclsh

proc biswapper_fn { value } {

    puts "Parsing additional parameters from: $value" 
    set param1 [expr {($value & 0x00FF0000) >> 16}]
    puts "Additional param 1: $param1"


    set param2 [expr {($value & 0x00000080) ? 0 : 1}]
    puts "Additional param 2: $param2"


    set bits [expr {($value & 0x000F0000) >> 16}]
    set param3 [expr {(($bits & 0x01) << 3) | (($bits & 0x02) << 1) | (($bits & 0x04) >> 1) | (($bits & 0x08) >> 3)}]
    puts "Additional param 3: $param3"
}