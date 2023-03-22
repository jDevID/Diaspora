#!/bin/bash

SOURCE_DIR="/home/devid/project/Diaspora/bash"
TARGET_DIR="/home/devid/script"

if [ ! -d "$SOURCE_DIR" ] || [ ! -d "$TARGET_DIR" ]; then
  echo "ERROR: Source or target directory does not exist."
  exit 1
fi

# Function to create a hard link for a file in the source directory
create_hard_link() {
  local file="$1"
  local target_file

  target_file="$TARGET_DIR/$(basename "$file")"

  if [ ! -e "$target_file" ]; then
    ln "$file" "$target_file"
    echo "Hard link created for $file at $target_file"
  fi
}

# Function to check and create hard links for all .sh files in the source directory
check_and_link_sh_files() {
  local file

  find "$SOURCE_DIR" -maxdepth 1 -type f -name "*.sh" | while read -r file; do
    create_hard_link "$file"
  done
}

# Check and create hard links for all .sh files in the source directory
check_and_link_sh_files

# Monitor the source directory for new .sh files and create hard links
while true; do
  inotifywait -q -e create,moved_to --format '%f' "$SOURCE_DIR" | while read -r NEW_FILE; do
    if [[ "$NEW_FILE" == *.sh ]]; then
      create_hard_link "$SOURCE_DIR/$NEW_FILE"
    fi
  done
done


# REQUIREMENTS #

# inotify-tools
#
# $ chmod +x autoHardlink.sh