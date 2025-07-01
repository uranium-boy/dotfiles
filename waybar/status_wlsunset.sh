#!/bin/bash

if pgrep -x wlsunset > /dev/null; then
    echo '{"alt": "on", "text": "wlsunset on"}'
else
    echo '{"alt": "off", "text": "wlsunset off"}'
fi
