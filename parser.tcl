#!/usr/bin/tclsh


proc parser_fn { input_string } {
  if {[regexp {#(.*)#(.*)\r\n} $input_string match type data]} {
    set packet_type $type
    set packet_data $data

    if {$packet_type eq "SD"} {
      if {[regexp {(.+);(.+);(.+);(.+);(.+);(.+);(.+);(.+);(.+);(.+)} $packet_data match date time lat1 lat2 lon1 lon2 speed course height sats]} {
        puts "Date: $date"
        puts "Time: $time"
        set lat [expr {$lat1 * ($lat2 eq "N" ? 1 : -1)}]
        set lon [expr {$lon1 * ($lon2 eq "E" ? 1 : -1)}]
  
        puts "Latitude: $lat"
        puts "Longitude: $lon"
        puts "Speed: $speed"
        puts "Course: $course"
        puts "Height: $height"
        puts "Satellites: $sats"
      } else {
        puts "Invalid SD packet data!"
      }
    } elseif {$packet_type eq "M"} {
      puts "Plaintext message $packet_data"
    } else {
      puts "Unknown packet type: $packet_type!"
    }
  } else {
    puts "Invalid packet format!"
  }
}