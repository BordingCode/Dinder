#!/bin/bash
# Downloads flagged recipe images from cloud storage
# Run this whenever you want to update the local flagged list

BLOB_URL="https://jsonblob.com/api/jsonBlob/019d14d2-4a6b-7407-8112-6f5b8f1a6fd9"
OUTPUT="/home/mathias/CC/Dinder/flagged-images.txt"

echo "Fetching flagged images..."
DATA=$(curl -s "$BLOB_URL")

if [ -z "$DATA" ] || echo "$DATA" | grep -q '"flagged":\[\]'; then
  echo "No flagged images found."
  exit 0
fi

echo "Flagged Recipe Images - $(date '+%Y-%m-%d %H:%M')" > "$OUTPUT"
echo "" >> "$OUTPUT"

echo "$DATA" | python3 -c "
import sys, json
data = json.load(sys.stdin)
for item in data.get('flagged', []):
    print(f\"ID: {item.get('id','?')} | {item.get('name','Unknown')} | {item.get('img','no url')}\")
" >> "$OUTPUT"

COUNT=$(echo "$DATA" | python3 -c "import sys,json; print(len(json.load(sys.stdin).get('flagged',[])))")
echo "Done. $COUNT flagged image(s) saved to $OUTPUT"
