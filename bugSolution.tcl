proc get_data {filename} {
  if {[catch {open $filename r} fp]} {
    return -code error "Could not open file: $filename"
  }
  set data {}
  while {[gets $fp line] != -1} {
    lappend data $line
  }
  close $fp
  return $data
}

set data [get_data non_existent_file.txt]
if {[string length $data] > 0} {
    puts $data
} else {
    puts "No data found"
}

# More robust way to check for errors
if {[catch {set data [get_data non_existent_file.txt]} msg]} {
  puts "Error: $msg"
} else {
  puts $data
}