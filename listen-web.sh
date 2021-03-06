#!/bin/sh
ffmpeg \
  -f flv -listen 1 -i rtmp://localhost:2021/live/app \
  -c:a aac -b:a 24k -ac 1 \
  -c:v libx264 -profile:v baseline \
  -analyzeduration 0 \
  -probesize 32 \
  -level 3.0 -pix_fmt yuv420p \
  -crf 17 -preset veryfast -g 30 -sc_threshold 0 \
  -use_template 1 \
  -seg_duration 1 \
  -frag_duration 1 \
  -window_size 3600 \
  -extra_window_size 3600 \
  -remove_at_exit 0 \
  -ignore_io_errors  1 \
  -movflags faststart \
  -streaming 1 \
  -master_pl_name stream.m3u8 \
  -hls_playlist 1 \
  -master_m3u8_publish_rate 1 \
  -f dash \
  /www/monitor/video/stream.mpd
