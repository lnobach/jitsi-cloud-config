#!/usr/bin/with-contenv bash

: "${CUSTOMIZE_BASE:?Shall invoke customization script, but CUSTOMIZE_BASE not set. Exiting.}"

function getCustomResource() {
    source=$1
    target=$2
    if ! wget -O "$target" "$CUSTOMIZE_BASE/$source"; then
      echo "ERROR: Could not load customization resource "$source" to "$target", ignoring..."
    fi
}


getCustomResource favicon.ico /usr/share/jitsi-meet/images/favicon.ico
getCustomResource watermark.png /usr/share/jitsi-meet/images/watermark.png
