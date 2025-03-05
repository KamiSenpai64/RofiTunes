# RofiTunes - Modular Music Manager

RofiTunes is a **Bash-based, modular music manager** that uses `rofi` and `fzf` for an interactive selection menu. It supports multiple music players and offers a smooth, customizable experience with features like queue management, playlist creation, and lyrics integration.

## Features
- 🎵 **Supports multiple music players** (CMUS, MPD, MPV, etc.)
- 🛠 **Modular Design** - Easily extendable to support more players.
- 🎚 **Custom keybinds** - Includes Vim-style navigation.
- 📂 **Custom music & lyrics directories**
- 🎶 **Playlist & queue management**
- 🔔 **Notifications via `notify-send`**
- 🔍 **Search function with Rofi/FZF**
- 🎛 **Equalizer support** (for MPV users)
- 📊 **Scrobbling support** (Last.fm or local history)
- 🎨 **Theming support for Rofi/FZF**
- 🔊 **Volume control using `pactl` or `amixer`**
- 🎧 **Visualizer support** (MPV or Cava)
- ✅ **Resume playback support**

## Installation
### Prerequisites
Ensure you have the following dependencies installed:
```bash
sudo apt update && sudo apt install -y rofi fzf cmus mpd mpv notify-send
```
If using **MPD**, ensure you have `mpc` installed:
```bash
sudo apt install mpc
```

### Clone the Repository
```bash
git clone https://github.com/yourusername/RofiTunes.git
cd RofiTunes
```

### Set Execution Permissions
```bash
chmod +x rofitunes.sh *.sh
```

### Configure the Music Player
Edit the `config.sh` file to select your preferred music player:
```bash
nano config.sh
```
Set `MUSIC_PLAYER` to one of the supported players (`cmus`, `mpd`, `mpv`):
```bash
MUSIC_PLAYER="mpd"
```

## Usage
Run RofiTunes:
```bash
./rofitunes.sh
```
### Controls
- **Play Music** - Browse and select a song.
- **Stop Music** - Stop playback.
- **Music Controls** - Manage playback (play, pause, next, queue, etc.).
- **Search Music** - Find a specific track.
- **Playlist Management** - Create and manage playlists.
- **Lyrics Support** - Load `.lrc` files from the lyrics directory.

## Adding Support for More Players
To add a new player, create a new script `playername_control.sh`, similar to `mpd_control.sh` or `mpv_control.sh`, and update `rofitunes.sh` accordingly.

## Testing in Windows
RofiTunes can run in **WSL (Windows Subsystem for Linux)**, but requires additional setup for audio and GUI support.

1. Install WSL and dependencies:
```powershell
wsl --install
```
```bash
sudo apt install rofi fzf mpd cmus mpv
```
2. Configure **PulseAudio** for sound support.
3. Launch the script inside WSL:
```bash
./rofitunes.sh
```

## Contributing
Feel free to fork this repository and submit pull requests for new features or improvements.

## License
MIT License. See `LICENSE` file for details.

