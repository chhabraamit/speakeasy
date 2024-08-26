#!/bin/bash

# Function to record audio
record_audio() {
    echo "Recording... Press Enter to stop."
    sox -q -d /tmp/recording.wav &
    SOX_PID=$!
    read -r
    kill $SOX_PID 2>/dev/null
}

# Record audio
record_audio

# Convert to mp3 silently
ffmpeg -i /tmp/recording.wav -acodec libmp3lame /tmp/recording.mp3 -y -loglevel error

# Send to OpenAI API
response=$(curl --silent --show-error --request POST \
  --url https://api.openai.com/v1/audio/transcriptions \
  --header "Authorization: Bearer $OPENAI_API_KEY" \
  --header "Content-Type: multipart/form-data" \
  --form file=@/tmp/recording.mp3 \
  --form model=whisper-1)

# Extract transcription from response
transcription=$(echo "$response" | jq -r '.text // empty')

if [ -z "$transcription" ]; then
    echo "Error: Transcription failed."
    exit 1
fi

# Copy to clipboard
echo -n "$transcription" | pbcopy

# Output result
echo "$transcription"

# Clean up silently
rm /tmp/recording.wav /tmp/recording.mp3 2>/dev/null
