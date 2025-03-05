#!/bin/bash

# Functions for controlling MPD

# Play or pause the song
toggle_mpd() {
    mpc toggle
    notify-send "🎶 MPD" "Toggled Pause/Play"
}

# Stop MPD playback
stop_mpd() {
    mpc stop
    notify-send "🛑 MPD" "Music Stopped"
}

# Play the next song
next_mpd() {
    mpc next
    notify-send "⏭ MPD" "Playing Next Song"
}

# Add song to queue in MPD
add_to_mpd_queue() {
    SONG_PATH="$1"
    mpc add "$SONG_PATH"
    notify-send "🎵 MPD" "Added to Queue: $(basename "$SONG_PATH")"
}

# Select a song and add to MPD queue
select_song_and_mpd_queue() {
    SONG=$(find "$MUSIC_DIR" -type f -iname "*.mp3" -o -iname "*.flac" | fzf --preview "mpv --no-audio-display {}")
    
    if [ -n "$SONG" ]; then
        add_to_mpd_queue "$SONG"
    fi
}

# Show MPD control menu
mpd_control_menu() {
    OPTIONS="▶ Pause/Play\n🛑 Stop\n⏭ Next Song\n➕ Add to Queue\n🎵 Select Song"
    
    if [ "$USE_FZF" = true ]; then
        CHOICE=$(echo -e "$OPTIONS" | fzf)
    else
        CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -p "🎶 MPD Controls")
    fi

    case "$CHOICE" in
        "▶ Pause/Play") toggle_mpd ;;
        "🛑 Stop") stop_mpd ;;
        "⏭ Next Song") next_mpd ;;
        "➕ Add to Queue") select_song_and_mpd_queue ;;
        "🎵 Select Song") select_song_and_mpd_queue ;;
    esac
}
