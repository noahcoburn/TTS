#!/bin/bash

# Define source and target directories
source_dir="./mp3_files"
target_dir="./wav_files"

# Create target_dir if it doesn't exist
mkdir -p "$target_dir"

# Loop over all .mp3 files in source_dir
for src_file in "$source_dir"/*.mp3; do
  # Skip if no matches (e.g. no .mp3 files)
  [ -e "$src_file" ] || continue
  
  # Get base filename without extension
  filename=$(basename "$src_file" .mp3)

  # Define the output .wav file path
  target_file="$target_dir/$filename.wav"

  # Convert with ffmpeg
  ffmpeg -i "$src_file" -ar 22050 -ac 1 "$target_file"
done