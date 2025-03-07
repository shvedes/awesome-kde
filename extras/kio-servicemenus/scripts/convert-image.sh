#!/usr/bin/env bash

# Check if the 'convert' command from ImageMagick is available on the system.
# This command is necessary for image conversion.
if ! command -v convert &> /dev/null; then
  # If 'convert' is not found, show a graphical error message using KDE's kdialog.
  # This message informs the user to install ImageMagick.
  kdialog --error "ImageMagick is not installed. Please install it to proceed."
  # Exit the script with an error code (1) to indicate failure.
  exit 1
fi

# Store the first command-line argument as the target file format for conversion.
# Example: If the user runs the script with "jpg", this will be the target format.
target_format="$1"
# Shift the command-line arguments to remove the target format from the list.
# Now, $@ will only contain the file paths to process.
shift

# Loop through all remaining command-line arguments (the files to convert).
for file in "$@"; do
  # Extract the file extension from the current file.
  # Example: For "image.png", this will be "png".
  extension="${file##*.}"
  # Convert the extension to lowercase to handle case-insensitive comparisons.
  # Example: "PNG" becomes "png".
  extension="${extension,,}"

  # Check if the file's extension matches the target format.
  if [[ "$extension" == "$target_format" ]]; then
    # If the file is already in the target format, skip it and notify the user.
    echo "Skipping '$file', already in the target format."
    continue  # Jump to the next file in the loop.
  fi

  # Create the output filename by replacing the original extension with the target format.
  # Example: "image.png" becomes "image.jpg" if the target is "jpg".
  output_file="${file%.*}.$target_format"
  
  # Convert the file using ImageMagick's 'convert' command.
  convert "$file" "$output_file"
  # Notify the user about the successful conversion.
  echo "Converted '$file' to '$output_file'."
done

# After processing all files, ask the user if they want to delete the original files.
# This uses a KDE kdialog yes/no prompt with a graphical interface.
if kdialog --yesno "Do you want to delete the original files?"; then
  # If the user clicks "Yes", loop through the original files again.
  for file_to_delete in "$@"; do
    # Delete the original file (CAUTION: This is irreversible!).
    rm "$file_to_delete"
    # Notify the user about the deletion.
    echo "Deleted '$file_to_delete'."
  done
fi
