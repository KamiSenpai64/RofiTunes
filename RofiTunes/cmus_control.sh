#!/bin/bash

# Functions for controlling cmus while it's running

# Pause/Resume cmus
toggle_pause() {
    cmus-remote -u
    notify-send "🎶 CMUS" "Toggled Pause/Resume"
}

# Stop cmus
stop_cmus() {
    cmus-remote -s
    notify-send "🛑 CMUS" "Music Stopped"
}

# Play next song
next_song() {
    cmus-remote -n
    notify-send "⏭ CMUS" "Playing Next Song"
}

# Add song to queue (with optional directory selection)
add_to_queue() {
    SONG_PATH="$1"
    cmus-remote -C "add $SONG_PATH"
    notify-send "🎵 CMUS" "Added to Queue: $(basename "$SONG_PATH")"
}

# Select a song to play using Rofi/FZF and play it next in cmus
select_song_and_queue() {
    SONG=$(find "$MUSIC_DIR" -type f -iname "*.mp3" -o -iname "*.flac" | fzf --preview "mpv --no-audio-display {}")
    
    if [ -n "$SONG" ]; then
        add_to_queue "$SONG"
    fi
}

# Show cmus control menu
cmus_control_menu() {
    OPTIONS="▶ Pause/Play\n🛑 Stop\n⏭ Next Song\n➕ Add to Queue\n🎵 Select Song"
    
    if [ "$USE_FZF" = true ]; then
        CHOICE=$(echo -e "$OPTIONS" | fzf)
    else
        CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -p "🎶 CMUS Controls")
    fi

    case "$CHOICE" in
        "▶ Pause/Play") toggle_pause ;;
        "🛑 Stop") stop_cmus ;;
        "⏭ Next Song") next_song ;;
        "➕ Add to Queue") select_song_and_queue ;;
        "🎵 Select Song") select_song_and_queue ;;
    esac
}
