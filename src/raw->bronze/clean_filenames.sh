#!/bin/bash

# Loop through files with spaces in the name
for f in *\ *; do
  # Skip if no matches (prevents error if no files have spaces)
  [ -e "$f" ] || continue
  # Replace spaces with underscores
  new_name="${f// /_}"
  mv "$f" "$new_name"
done

