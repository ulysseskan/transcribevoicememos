#!/bin/bash

# transcribe voice memos AFTER A CERTAIN DATE
# via Whisper AI medium model

# Check if the date parameter is provided
if [ -z "$1" ]; then
    echo "Error: Please provide a date parameter (./transcribe.sh 2023-10-20)"
    exit 1
fi

# Source directory and destination directory
source_dir="/Users/USERNAME/Library/Group Containers/group.com.apple.VoiceMemos.shared/Recordings"
destination_dir="/Users/USERNAME/transcriptions"

# Date parameter provided by the user
cutoff_date="$1"

# Find .m4a files modified after the cutoff date
find "$source_dir" -name '*.m4a' -newermt "$cutoff_date" -print0 | while IFS= read -r -d $'\0' file
do
    # Extracting the file name without extension
    filename=$(basename -- "$file")
    filename_noext="${filename%.*}"

    # Copy the file to the destination directory
    cp "$file" "$destination_dir"

    # Convert .m4a to .wav using ffmpeg
    ffmpeg -i "$destination_dir/$filename" -ar 16000 -ac 1 -c:a pcm_s16le "$destination_dir/$filename_noext.wav"

    # Run the whisper-c command and save output to FILENAME.txt
    /Users/USERNAME/whisper-c/main -m /Users/USERNAME/whisper-c/models/ggml-medium.en.bin -f "$destination_dir/$filename_noext.wav" > "$destination_dir/$filename_noext.txt"

    # Optional: Delete non .txt files from the destination directory - not always reliable
    # find "$destination_dir" -type f ! -name '*.txt' ! -name '*.sh' -delete

done

echo "Processing completed."
