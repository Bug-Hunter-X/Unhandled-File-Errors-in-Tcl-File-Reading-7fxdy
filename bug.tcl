proc get_data {filename} {
  set fp [open $filename r]
  if {$fp == -1} {
    error "Could not open file: $filename"
  }
  set data {}
  while {[gets $fp line] != -1} {
    lappend data $line
  }
  close $fp
  return $data
}

set data [get_data non_existent_file.txt]
puts $data