#!/bin/bash

# Functions for controlling playback

# Play selected song
play_song() {
    SONG_PATH="$1"
    notify-send "🎶 Playing" "$(basename "$SONG_PATH")"
    $MUSIC_PLAYER "$SONG_PATH" >/dev/null 2>&1 &
    echo $! > /tmp/rofitunes_pid  # Save PID for controls
}

# Stop music playback
stop_song() {
    if [ -f /tmp/rofitunes_pid ]; then
        kill "$(cat /tmp/rofitunes_pid)" 2>/dev/null
        rm /tmp/rofitunes_pid
        notify-send "🛑 Music Stopped"
    fi
}
