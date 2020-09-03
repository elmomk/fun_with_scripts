#!/bin/bash
sleep 2
/usr/bin/xdotool type --clearmodifiers --delay 3 "$(cat $HOME/.file_with_base64encrypted_content| base64 -d)"
sleep .5
/usr/bin/xdotool key Return
