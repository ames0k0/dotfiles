#!/bin/bash
# SRC: https://superuser.com/a/1394709
# ffmpeg -i input.mkv -filter_complex "[0:v]setpts=0.5*PTS[v];[0:a]atempo=2.0[a]" -map "[v]" -map "[a]" output.mkv
# TODO: Use an argument to control speed
ffmpeg -i $2 -filter_complex "[0:v]setpts=0.5*PTS[v];[0:a]atempo=2.0[a]" -map "[v]" -map "[a]" "out--$2"
