#!/usr/bin/env bash

# Set safety options to keep this script from producing unintended side-effects.
set -euo pipefail

# This script is used to generate a new Mutt theme based on an input color file
# and a given theme name.

# The contents of the color file should be as follows:
#
# background=color<1-256>
# current_line=color<1-256>
# selection=color<1-256>
# foreground=color<1-256>
# comment=color<1-256>
# red=color<1-256>
# orange=color<1-256>
# yellow=color<1-256>
# green=color<1-256>
# aqua=color<1-256>
# blue=color<1-256>
# purple=color<1-256>
#
# Where the <1-256> is the number for your chosen color in the 256 terminal
# color system.

main() {
  local color_file="$1"
  local template_muttrc_file="template.muttrc"
  local output_theme_file="${color_file//.*/}.muttrc"

  if [ ! -f "$color_file" ]; then
    printf "%s\n" "ERROR: No color file provided"
    exit 1
  fi

  printf "%s\n" "Generating color theme file: ${color_file}"
  ./add-colors.awk "${template_muttrc_file}" "${color_file}" \
    >"${output_theme_file}"
}

main "${@}"
