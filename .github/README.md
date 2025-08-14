# A list of KDE components that will make your user experience even better

![preview](./header-image.png)

KDE, like all of Linux, is modular, and sometimes you need to install additional packages to get certain functionalities. Are you a long-time Arch user and think you know everything? Did you know that you can backup your important files directly from the system settings?

This repository contains a list of official Arch Linux / AUR packages (developed by KDE team) as well as third-party applications and plugins that add or enhance KDE’s functionality. You can also check out the repository’s Wiki page, where you might find useful information.

The list will be divided into several parts. The first part will list both the GUI applications that come out of the box in many distributions and the applications that are officially supported by KDE Plasma developers (see apps.kde.org). The second part will contain components, libraries, extensions, and other stuff that works under the hood but is very important for the environment to function (for example, some packages can add certain functionality to the standard set of applications; i.e., Dolphin can natively mount ISO images). The third part will be dedicated to community work - GUI applications, compositor effects, theme engines, and so on.

If you don’t want to worry about selecting the right components and want a complete, ready-to-use desktop environment immediately, you can run this command to get every KDE package group ([`jq`](https://github.com/jqlang/jq) is required):

```bash
curl -s https://archlinux.org/groups/ | grep -oP 'kde-[^/"]+|kf[5,6]|kdevelop' | sed 's/<$//' | jq -R . | sed 's/\"//g' | uniq
```

Running this command will give you a list of all KDE Plasma package groups you want to install.

#### Contributing

If you’d like to contribute to the development of this repository, feel free to open an issue or pull request.

### Plasma Mobile

#### System

- [qmlkonsole](https://apps.kde.org/qmlkonsole/) - [konsole](https://apps.kde.org/konsole/), but designed for Plasma Mobile
- [index-fm](https://apps.kde.org/index-fm/) - file manager

#### Utilities

- [krecorder](https://apps.kde.org/krecorder/) - simple voice recorder for KDE Plasma & Plasma Mobile
- [keysmith](https://apps.kde.org/keysmith/) - 2FA code generator for KDE Plasma & Plasma Mobile
- [nota](https://apps.kde.org/nota/)<sup>`AUR`</sup> - simple text editor designed for KDE Plasma & Plasma Mobile

#### KDE PIM / Quality Of Life

- [itinerary](https://apps.kde.org/itinerary/) - personal digital travel assistant for KDE Plasma & Plasma Mobile
- [klevernotes](https://apps.kde.org/klevernotes/) - note taking app for KDE Plasma & Plasma Mobile
- [calindori](https://apps.kde.org/calindori/) - calendar app designed for KDE Plasma & Plasma Mobile

### GUI Applications

#### System

- [dolphin](https://apps.kde.org/dolphin/) - the best file manager in the world
- [konsole](https://apps.kde.org/konsole/) - the best terminal emulator in the world
- [yakuake](https://apps.kde.org/yakuake/) - drop-down terminal
- [systemmonitor](https://apps.kde.org/plasma-systemmonitor/) - Plasma's built-in system / resources monitor
- [discvoer](https://apps.kde.org/discover/) - Plasma's built-in app store. Useless on Arch, unless you use Flatpaks
- [kwalletmanager](https://apps.kde.org/kwalletmanager5/) - password & secrets manager. It also stores WiFi passwords, which is convenient and secure
- [kdf](https://apps.kde.org/kdf/) (kdiskfree) - disk usage statistics. Also provides KCM module for System Settings
- [ksystemlog](https://apps.kde.org/ksystemlog/) - system log viewer
- [khelpcenter](https://apps.kde.org/khelpcenter/) - basically the whole non-existent Plasma wiki pages, but onffline
- [systemdgenie](https://apps.kde.org/systemdgenie/) - [systemd](https://en.wikipedia.org/wiki/Systemd) management tool
- [kjournald](https://apps.kde.org/kjournaldbrowser/) - system journal management tool
- [spectacle](https://github.com/KDE/spectacle) - built-in screenshot / video capture utility

#### Utilities

- [ark](https://apps.kde.org/ark/) - archive manager
- [filelight](https://apps.kde.org/filelight/) - disk usage statistics
- [kcalc](https://apps.kde.org/kcalc/) - a simple but powerful calculator
- [kfind](https://apps.kde.org/kfind/) - the best file search tool out there
- [kcharselect](https://apps.kde.org/kcharselect/) - unicode character selector
- [kgpg](https://apps.kde.org/kgpg/) - GPG management tool
- [kleopatra](https://apps.kde.org/kleopatra/) - certificate, cryptography & GPG management tool. Author finds it pretty useful
- [sweeper](https://apps.kde.org/sweeper/) - system cleaner
- [kmag](https://apps.kde.org/kmag/) - screen magnifier. **NOTE!** Install this only if you use X11 sessions, since Plasma Wayland has this feature built directly in compositor
- [kweather](https://apps.kde.org/kweather/) - weather app
- [kclock](https://apps.kde.org/kclock/) - clock, stopwatch, timers and alarms
- [kmousetool](https://apps.kde.org/kmousetool/) - mouse clicker
- [krecorder](https://apps.kde.org/krecorder/) - simple voice recorder for KDE Plasma & Plasma Mobile
- [keysmith](https://apps.kde.org/keysmith/) - 2FA code generator for KDE Plasma & Plasma Mobile
- [partitionmanager](https://apps.kde.org/partitionmanager/) - GParted on steroids
- [isoimagewriter](https://apps.kde.org/isoimagewriter/) - ISO burning tool
- [kate](https://apps.kde.org/kate/) - advanced *code* editor. Ships with **[KWrite](https://apps.kde.org/kwrite/)**, which is excellent for basic text editing tasks
- [okteta](https://apps.kde.org/okteta/) - advanced HEX editor
- [krename](https://apps.kde.org/krename/) - batch file renamer
- [krusader](https://apps.kde.org/krusader/) - file manager
- [smb4k](https://apps.kde.org/smb4k/) <sup>`development state`</sup> - advanced SAMBA explorer
- [kfloppy](https://apps.kde.org/kfloppy/) - floppy disk formatter <sup>(man that's crazy)</sup>
- [nota-git](https://apps.kde.org/nota/) </sup>`AUR`</sup> - simple text editor designed for KDE Plasma & Plasma Mobile
- [karp-git](https://apps.kde.org/karp/) <sup>`AUR`</sup> <sup>`development state`</sup> - PDF arranger
- [Hash-o-matic](https://apps.kde.org/hashomatic/) <sup>`no packages avaiable`<sup> - file hash verifier
- [alpaka-git](https://apps.kde.org/alpaka/) <sup>`AUR`</sup> <sup>`development state`</sup> - [Ollama](https://github.com/ollama/ollama) client
- [k3b](https://apps.kde.org/k3b/) - disc burning tool
- [qrca](https://apps.kde.org/qrca/) - barcode scanner
- [kdeconnect](https://apps.kde.org/kdeconnect/) - Apple-like magic in terms of phone integration / synchronization
- [krdc](https://apps.kde.org/krdc/) - remote desktop client
- [krfb](https://apps.kde.org/krfb/) - remote desktop client (VNC)
- [kontrast](https://apps.kde.org/kontrast/) - color contrast checker
- [kdialog](https://develop.kde.org/docs/administration/kdialog/) - YAD & Zenity alternative

#### Development

- [kompare](https://apps.kde.org/kompare/) - `diff` & `patch` frontend
- [kcachegrind](https://apps.kde.org/kcachegrind/) - profile data visualization
- [heaptrack](https://apps.kde.org/heaptrack/) - one more profiler
- [kdevelop](https://apps.kde.org/kdevelop/) <sup>`package group`</sup> - IDE
- [kommit](https://apps.kde.org/kommit/) - git client
- [codevis](https://apps.kde.org/codevis/) <sup>`development state`</sup> - code architecture visualizer

#### Multimedia / Graphics

- [gwenview](https://apps.kde.org/gwenview/) - image viewer
- [haruna](https://apps.kde.org/haruna/) - media player
- [dragon](https://apps.kde.org/dragonplayer/) - media player
- [elisa](https://apps.kde.org/elisa/) - music player
- [juk](https://apps.kde.org/juk/) - music player
- [vvave](https://apps.kde.org/vvave/) - music player
- [amarok](https://apps.kde.org/amarok/) - audio / music player
- [kaffeine](https://apps.kde.org/kaffeine/) - media player
- [kdenlive](https://apps.kde.org/kdenlive/) - video editor
- [kamoso](https://apps.kde.org/kamoso/) - camera app
- [kwave](https://apps.kde.org/kwave/) - sound editor
- [audiotube](https://apps.kde.org/audiotube/) - YouTube Music client
- [plasmatube](https://apps.kde.org/plasmatube/) - YouTube client
- [audex](https://apps.kde.org/audex/) - CD ripper. Provides KCM module
- [kid3](https://apps.kde.org/kid3/) - audio tagger
- [subtitlecomposer](https://apps.kde.org/subtitlecomposer/) <sup>`AUR`</sup> - subtitle composer
- [krita](https://apps.kde.org/krita/) - no expanation needed
- [kcolorchooser](https://apps.kde.org/kcolorchooser/) - simple color picker
- [kolourpaint](https://apps.kde.org/kolourpaint/) - MS Paint alternative
- [digikam](https://apps.kde.org/digikam/) - photo management tool
- [koko](https://apps.kde.org/koko/) - image gallery
- [kphotoalbum](https://apps.kde.org/kphotoalbum/) - photo collection tagger & manager
- [glaxnimate](https://apps.kde.org/glaxnimate/) <sup>`AUR`</sup> - vector animation & motion design
- [kgeotag](https://apps.kde.org/kgeotag/) - photo geotagger
- [optiimage](https://apps.kde.org/optiimage/) - image compressor
- [Peruse](https://apps.kde.org/peruse/) <sup>`no packages avaiable`</sup> - comic reader
- [Showfoto](https://apps.kde.org/showfoto/) <sup>`no packages avaiable`</sup> - photo viewer & editor

#### Office

- [okular](https://apps.kde.org/okular/) - PDF / ebook / document viewer
- [ghostwriter](https://apps.kde.org/ghostwriter/) - note taking app
- [arianna](https://apps.kde.org/arianna/) - ebook reader
- [kile](https://apps.kde.org/kile/) - LaTex editor
- [calligra](https://apps.kde.org/calligra/) - all in one office solution
- [tellico](https://apps.kde.org/tellico/) - personal media collection. Supports DVD, books, music, games, comic books and much more
- [keurocalc](https://apps.kde.org/keurocalc/) <sup>`AUR`</sup> - currency converter. **Note**: deprecated; *KRunner* has this feature built-in
- [skanlite](https://apps.kde.org/skanlite/) - image scanner
- [skanpage](https://apps.kde.org/skanpage/) - image scanner

#### Internet

- [ktorrent](https://apps.kde.org/ktorrent/) - torrent client
- [konversation](https://apps.kde.org/konversation/) - IRC client
- [kget](https://apps.kde.org/kget/) - download manager
- [neochat](https://apps.kde.org/neochat/) - [Matrix](https://matrix.org/) client
- [tokodon](https://apps.kde.org/tokodon/) - [Mastodon](https://github.com/mastodon/mastodon) client
- [kasts](https://apps.kde.org/kasts/) - podcasts client
- [ruqola](https://apps.kde.org/ruqola/) <sup>`AUR`</sup> - [rocket.chat](https://www.rocket.chat/) - client

#### KDE PIM

- [korganizer](https://apps.kde.org/korganizer/) - calendar & task scheduler
- [kmail](https://apps.kde.org/kmail2/) - email client
- [zanshin](https://apps.kde.org/zanshin/) - To-Do management
- [kontact](https://apps.kde.org/kontact/) - personal information manager
- [kaddressbook](https://apps.kde.org/kaddressbook/) - contact manager
- [merkuro](https://apps.kde.org/merkuro/) - calendar app
- [kongress](https://apps.kde.org/kongress/) - conferences manager
- [akregator](https://apps.kde.org/akregator/) - feed / RSS reader

#### Quality Of Life

- [itinerary](https://apps.kde.org/itinerary/) - personal digital travel assistant for KDE Plasma & Plasma Mobile
- [ktrip](https://apps.kde.org/ktrip/) - public transport navigator
- [francis](https://apps.kde.org/francis/) - [Pomodoro](https://en.wikipedia.org/wiki/Pomodoro_Technique) timer
- [marknote](https://apps.kde.org/marknote/) - note taking app
- [klevernotes](https://apps.kde.org/klevernotes/) - note taking app designed for KDE Plasma & Plasma Mobile
- [calindori](https://apps.kde.org/calindori/) - calendar app designed for KDE Plasma & Plasma Mobile
- [Public Alerts](https://apps.kde.org/publicalerts/) <sup>`not released yet`</sup> - emergency & weather alerts
- [komodo](https://apps.kde.org/komodo/) <sup>`AUR`</sup> - todo manager

### Core Components

- `svgpart` - native svg integration / rendering across KDE apps
- `markdownpart` - native markdown integration / rendering across KDE apps
- `kde-inotify-survey` - tooling for monitoring inotify limits
- `flatpak-kcm` - KCM module for Flatpaks management. Installed by default with `plasma` package group
- `kio-{extras,fuse,admin,gdrive}` - KIO addons
- `xwaylandvideobridge` - utility to mirror Wayland screen to X applications. Useful for applications like Zoom
- `iio-sensor-proxy` - automatic screen rotation
- `maliit-keyboard` - virtual keyboard
- `power-profiles-daemon` - power management in Plasma. Requires enabled `power-profiles-daemon.service`. If Doesn't work, use `tuned{-ppd}` with `tuned{-ppd}.service` instead
- `orca` - screen reader
- `cryfs`, `gocryptfs` - vrtual filesystems for Plasma's Vault
- `ripgrep{-all}` - file search backend, if built-in file indexer is disabled
- `hunspell-<language_code>` - spell checking / dictionary
- `symmy-git` <sup>`AUR`</sup> - encrypt / decrypt local files; Dolphin integration. `kf6` requred for building
- `sshfs` - kdeconnect backend for browsing remote device's filesystem
- `qt6-tools` - used by many KDE apps, including kdeconnect
- `kcm-grub2-git` <sup>`AUR`</sup> - GRUB bootloader KCM module. `packagegit-qt6` required for building
- `kcron` - cron tasks management & KCM module
- `kup`, `bup`, `rsync` - built-in backups & KCM module
- `dolphin-plugins` - VCS integration, Dropbox integration, disk & ISO mount / umount options
- `cups`, `system-config-printer` - CUPS & its configuration tool
- `keditbookmarks` - bookmarks editor
- `colord-kde` - color management & KCM module
- `ffmpegthumbs` - video thumbnails
- `qt6-imageformats` - TIFF, MNG, TGA, WBMP image formats support (QT6)
- `qt5-imageformats` - TIFF, MNG, TGA, WBMP image formats support (QT5)
- `kdegraphics-thumbnailers` - PostScript, RAW, Mobipocket & Blender previews. Extends Dolphin, Gwenview, Krusader
- `kdegraphics-mobipocket` - no clear description
- `kimageformats` - previews & support for many image formats
    - `imath` - EXR format support
    - `jxrlib` - JXR format support
    - `karchive` - plugin for Krita and OpenRaster images
    - `libavif` - AVIF format support
    - `libheif` - HEIF format support
    - `libjxl` - JPEG-XL format support
    - `libraw` - RAAW format support
    - `openjpeg2` - JPEG 2000 foramt support
    - `openext` - EXR format support
- `icoutils` - MS Windows executables thumbnails
- `kdenetwork-filesharing` - SAMBA integration for Dolphin
- `purpose` - \*share\* context menu for Dolphin
- `arj`, `lrzip`, `lzop`, `7zip`, `unarchiver`, `unrar`, `zip`, `cpio`, `unarj`, `unace` - additional compression formats for Ark & Krusader
- `faac`, `flac`, `lame`, `vorbis-tools` - additional audio formats for Audex
- `fwupd` - update motherboard firmware directly from Discover (if supported)
- `plocate` - alternative search indexer for KFind
- `dosfstools`, `jfsutils`, `f2fs-tools`, `btrfs-progs`, `exfatprogs`, `ntfs-3g`, `udftools`, `xfsprogs`, `nilfs-utils`, `gpart`, `mtools` - filesystem support for PartitionManager
- `pandoc`, `mathjax`, `cmark` - additional formats for Ghostwriter
- `clang`, `git`, `python-lsp-server`, `qt6-declararive`, `qtkeychain-qt6`, `rust`, `texlab` - a set of plugins & LSP servers for Kate
- `konsolepart` - adds konsole panel in some KDE apps (e.g. Okteta, Krusader)
- `cdparanoia`, `cdrdao`, `cdrtools`, `dvd+rw-tools`, `emovix`, `vcdimager` - additional formats & extensions for K3b
- `libvncserver`, `libssh`, `freerdp` - necessary libraries for remote desktop
- `yt-dlp` - YouTube, Twitch, <you name it> streaming support for Haruna
- `mediainfo` - extra file metadata
- `bigsh0t`, `noise-suppression-for-voice`, `opencv`, `python-openai-whisper`, `python-srt_equalizer` - a set of plugins for Kdenlive
- `krita-plugin-gmic`, `kseexpr`, `libheif`, `libjxl`, `libmypaint`, `poppler-qt5`, `python-pyqt5` - a set of plugins & extensions for Krita
- `darktable`, `hugin`, `rawtherapee` - a set of plugins & extensions for Digikam
- `kirigami-addons`, `libetonyek`, `libvisio`, `libwpg`, `libwps`, `poppler`, `pstoedit`, `qqc2-desktop-style`, `qt6-webengine` - a set of plugins & extensions for Calligra
- `kdnssd`, `kplotting`, `syndication`, `taglib` - a set of plugins & extensions for KTorrent
- `kdepim-addons` - additional plugins & extensions for KDE PIM apps

### Third Party

#### GUI Applications

- [koi](https://github.com/baduhai/Koi) <sup>`AUR`</sup> - auto light / dark mode switcher
- [yin-yang](https://github.com/oskarsh/Yin-Yang) <sup>`AUR`</sup> - another one auto light / dark mode switcher
- [media-downloader](github.com/mhogomchungu/media-downloader) <sup>`AUR`</sup> - a feature-rich frontend for yt-dlp
- [protonup-qt](https://github.com/DavidoTek/ProtonUp-Qt) <sup>`AUR`</sup> - install and manage [GE-Proton](https://github.com/GloriousEggroll/proton-ge-custom), [Steam Proton](<https://en.wikipedia.org/wiki/Proton_(software)>), [Lutris](https://github.com/lutris/lutris) runners and much more
- [qownnotes](https://www.qownnotes.org/) <sup>`AUR`</sup> - plain-text file markdown note-taking with Nextcloud / ownCloud integration
- [keepassxc](https://keepassxc.org/) - a cross-platform password manager
- [qtpass](https://github.com/IJHack/QtPass) - multi-platform GUI for pass, the standard unix password manager
- [kdiskmark](https://github.com/JonMagon/KDiskMark) - [CrystalDiskMark](https://sourceforge.net/projects/crystaldiskmark) alternative for Linux
- [qpwgraph](https://gitlab.freedesktop.org/rncbc/qpwgraph) - PipeWire Graph Qt GUI Interface
- [jamesdsp](https://github.com/Audio4Linux/JDSP4Linux) <sup>`AUR`</sup> - audio post-processing tool, like EasyEffects
- [qbittorrent](https://github.com/qbittorrent/qBittorrent) - you know what is this!

#### Compositor Scripts / Effects / Animations

- [kwin-effect-rounded-corners-git](https://github.com/matinlotfali/KDE-Rounded-Corners) <sup>`AUR`</sup> - rounded window corners with outlines and shadow interpolation
- [kwin-effects-forceblur](https://github.com/taj-ny/kwin-effects-forceblur) <sup>`AUR`</sup> - self-explanatory
- [kwin-effects-kinetic](https://github.com/gurrgur/kwin-effects-kinetic) <sup>`AUR`</sup> - kinetic animations for open/close & maximize/minimize actions
- [kwin-scripts-krohnkite-git](https://github.com/anametologin/krohnkite) <sup>`AUR`</sup> - a dynamic tiling extension for KWin 
- [kwin-scripts-mudeer](https://github.com/darkstego/Mudeer) <sup>`AUR`</sup> - virtual screen splitting. Useful on wide screens
- [kwin-polonium](https://github.com/zeroxoneafour/polonium) <sup>`AUR`</sup> - a tiling window manager for Plasma 6
- [kwin-gestures](https://github.com/taj-ny/kwin-gestures) <sup>`AUR`</sup> - custom kwin touchpad gestures for Plasma 6
- [kde-shader-wallaper](https://github.com/y4my4my4m/kde-shader-wallpaper/tree/plasma6) <sup>`no packages avaiable`</sup> - self-explanatory. This is worth your look

#### Themes

- [klassy](https://github.com/paulmcauley/klassy) <sup>`AUR`</sup> - custom window decoration, application style and global theme
- [darkly](https://github.com/Bali10050/Darkly) <sup>`AUR`</sup> - a modern style for qt applications 
- [arc-kde](https://github.com/PapirusDevelopmentTeam/arc-kde) <sup>`AUR`</sup> - port of Arc theme for KDE
- [utterly-nord-plasma](https://github.com/HimDek/Utterly-Nord-Plasma) <sup>`AUR`</sup> - a modern and sleek Nord theme for Plasma

#### Applets / Widgets / Plasmoids

- [plasma6-applets-arch-update-notifier](https://github.com/bouteillerAlan/archupdate) <sup>`AUR`</sup> - plasmoid that lets you know when arch updates are required
- [plasma6-applets-fokus]( https://gitlab.com/divinae/focus-plasmoid) <sup>`AUR`</sup> - a simple pomodoro plasmoid
- [plasma6-applets-panel-colorizer](https://github.com/luisbocanegra/plasma-panel-colorizer) <sup>`AUR`</sup> - customize your panel however you want
- [plasma6-applets-wallpaper-effects](https://github.com/luisbocanegra/plasma-wallpaper-effects) <sup>`AUR`</sup> - various wallpaper effects
- [plasma6-applets-panon](https://github.com/rbn42/panon) <sup>`AUR`</sup> - an audio visualizer widget
- [plasma6-wallpapers-blurredwallpaper](https://github.com/bouteillerAlan/blurredwallpaper) <sup>`AUR`</sup> - blurs wallpaper when active window is present
- [plasma6-wallpapers-wallpaper-engine-git](https://github.com/catsout/wallpaper-engine-kde-plugin) <sup>`AUR`</sup> - Wallpaper Engine plugin for KDE Plasma
- [plasma6-applets-weather-widget-3-git](https://github.com/blackadderkate/weather-widget-2) <sup>`AUR`</sup> - simple weather widget that live in the taskbar / tray
- [plasma6-kde_controlcentre](https://github.com/Prayag2/kde_controlcentre) <sup>`AUR`</sup> - MacOS-like control center for KDE

- [ollama-control](https://github.com/imoize/plasmoid-ollamacontrol) <sup>`no packages avaiable`</sup> - control ollama models from the taskbar
- [plasmoid-dockio](https://github.com/imoize/plasmoid-dockio) <sup>`no packages avaiable`</sup> - manage docker containters directly from taskbar
- [kde-material-you-colors](https://github.com/luisbocanegra/kde-material-you-colors) <sup>`AUR`</sup> - Material Design 3 color palette generator for KDE
- [ditto-menu](https://github.com/adhec/dittoMenuKDE) <sup>`no packages avaiable`</sup> - Windows 11-like application launcher
- [chat-qt](https://github.com/DenysMb/ChatQT-Plasmoid) <sup>`no packages avaiable`</sup> - chat with ollama models directly from taskbar

- [apdatifier](https://github.com/exequtic/apdatifier) <sup>`no packages avaiable`</sup> - applet for managing Arch Linux updates (including AUR)
    - *Depends on*: `pacman-contrib` `curl` `jq` `unzip` `tar` `fzf`

#### Misc

- [mpris-discord-rpc-bin](https://github.com/patryk-ku/mpris-discord-rpc) <sup>`AUR`</sup> - self-explanatory. Not a KDE component nor made for KDE, but can integrate well with Haruna, Dragon, mpv and more, providing functional Discord RPC interface
- [konsave](https://github.com/Prayag2/konsave) <sup>`AUR`</sup> - a backup tool designed for KDE Plasma
- [kando-bin](https://github.com/kando-menu/kando) <sup>`AUR`</sup> - a nice looking cross-platform pie menu
- [krunner-translator](https://github.com/rizutazu/krunner-translator) <sup>`no packages avaiable`</sup> — Google Translate plugin for KRunner
- [kde-thumbnailer-apk](https://github.com/z3ntu/kde-thumbnailer-apk) <sup>`AUR`</sup> — you got it right; Android's `.apk` thumbnails

