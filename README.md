# tl;dr
Quick & dirty script to transcribe voice memos via Whisper AI

# Prerequisites:
1. You must have Whisper AI installed.  Instructions:

```
git clone https://github.com/ggerganov/whisper.cpp.git
make
bash ./models/download-ggml-model.sh base.en
bash ./models/download-ggml-model.sh medium.en
ffmpeg -i audio.m4a -ar 16000 -ac 1 -c:a pcm_s16le audio.wav
```

2. You must edit the folder names in your script and make it executable.

3. Ensure all folders actually exist on your system before running.

# Example usage:
```
./transcribe.sh 2023-10-20 # Transcribe voice memos after 2023-10-20
```

MIT License / feel free to modify / make better as you wish