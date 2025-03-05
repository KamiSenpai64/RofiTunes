#!/bin/bash

# Functions for controlling MPV

# Play or pause the song
toggle_mpv() {
    mpv --input-ipc-server=/tmp/mpvsocket --msg-level=all=error command pause
    notify-send "🎶 MPV" "Toggled Pause/Play"
}

# Stop MPV playback
stop_mpv() {
    mpv --input-ipc-server=/tmp/mpvsocket --msg-level=all=error command stop
    notify-send "🛑 MPV" "Music Stopped"
}

# Play next song in MPV
next_mpv() {
    mpv --input-ipc-server=/tmp/mpvsocket --msg-level=all=error command next
    notify-send "⏭ MPV" "Playing Next Song"
}

# Add song to queue in MPV
add_to_mpv_queue() {
    SONG_PATH="$1"
    mpv --input-ipc-server=/tmp/mpvsocket --msg-level=all=error command loadfile "$SONG_PATH" append
    notify-send "🎵 MPV" "Added to Queue: $(basename "$SONG_PATH")"
}

# Select a song and add to MPV queue
select_song_and_mpv_queue() {
    SONG=$(find "$MUSIC_DIR" -type f -iname "*.mp3" -o -iname "*.flac" | fzf --preview "mpv --no-audio-display {}")
    
    if [ -n "$SONG" ]; then
        add_to_mpv_queue "$SONG"
    fi
}

# Show MPV control menu
mpv_control_menu() {
    OPTIONS="▶ Pause/Play\n🛑 Stop\n⏭ Next Song\n➕ Add to Queue\n🎵 Select Song"
    
    if [ "$USE_FZF" = true ]; then
        CHOICE=$(echo -e "$OPTIONS" | fzf)
    else
        CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -p "🎶 MPV Controls")
    fi

    case "$CHOICE" in
        "▶ Pause/Play") toggle_mpv ;;
        "🛑 Stop") stop_mpv ;;
        "⏭ Next Song") next_mpv ;;
        "➕ Add to Queue") select_song_and_mpv_queue ;;
        "🎵 Select Song") select_song_and_mpv_queue ;;
    esac
}
