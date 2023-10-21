# tl;dr
Quick & dirty script to transcribe voice memos via Whisper AI

# Prerequisites:
1. You must have Whisper AI installed.  Instructions:

```
git clone https://github.com/ggerganov/whisper.cpp.git
make
bash ./models/download-ggml-model.sh base.en
bash ./models/download-ggml-model.sh medium.en
```

You must also have the free ffmpeg installed.  Web search for how to do that - it's easy.

2. Replace USERNAME (appears 4 times) with your actual username

3. Ensure all folders actually exist on your system before running.  And of course, make the script
   executable.  (chmod +x transcribe.sh)

# Example usage:
```
./transcribe.sh 2023-10-20 # Transcribe voice memos after 2023-10-20
```

MIT License / feel free to modify / make better as you wish