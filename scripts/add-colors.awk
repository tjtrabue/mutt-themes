#!/usr/sbin/awk -f

BEGIN {
  FS = "="
  template_file = "template.muttrc"

  if (! color_file) {
    print "ERROR: No color file"
    exit
  }
}

END {
}
