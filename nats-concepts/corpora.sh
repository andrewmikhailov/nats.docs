#!/bin/bash

# Define the output file
output_file=".nats.corpora.md"

# Clear the output file if it already exists
> "$output_file"

# Find all .md files recursively and append their content to the output file
find . -type f -name "*.md" | while read -r md_file; do
  echo "Processing $md_file ..."
  echo -e "\n\n---\n\n" >> "$output_file"
  cat "$md_file" >> "$output_file"
done

echo "All .md files have been appended to $output_file."

zip .nats.corpora.zip .nats.corpora.md
rm .nats.corpora.md
