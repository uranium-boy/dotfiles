#!/bin/bash

if pgrep -x wlsunset > /dev/null; then
    pkill wlsunset
else
    wlsunset -T 4500 &
fi

pkill -RTMIN+5 waybar
