#!/bin/sh
ffmpeg \
  -timeout 5000000 \
  -i tcp://localhost:2021?listen \
  -c:a aac -b:a 64k -ac 1 \
  -c:v libx264 -profile:v main \
  -level 3.0 -pix_fmt yuv420p \
  -crf 17 -preset veryfast -g 15 -sc_threshold 0 \
  -async 1 \
  -use_template 1 \
  -seg_duration 1 \
  -frag_duration 1 \
  -streaming 1 \
  -master_pl_name stream.m3u8 \
  -hls_playlist 1 \
  -master_m3u8_publish_rate 1 \
  -f dash \
  "$1/stream.mpd"

