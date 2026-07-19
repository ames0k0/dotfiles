#!/usr/bin/env bash
# ffmpeg -i input.mkv -vf "setpts=PTS/100,fps=24" -an out--input.mkv
ffmpeg -i $2 -vf "setpts=PTS/$1,fps=24" -an "out--$2"
