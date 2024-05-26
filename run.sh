#!/bin/sh
echo "Starting camera proxy."
echo " URL: $APP_CAM_URL"
echo " OUT: $APP_RTSP_URL"

curl "$APP_CAM_URL"  -k --ignore-content-length \
       --output - | \
	ffmpeg -y -i - \
	-s $APP_FFMPEG_PARAM_S \
	-c:v copy -c:a copy \
	-f rtsp -rtsp_transport tcp $APP_RTSP_URL

