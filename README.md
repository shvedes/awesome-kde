
# Essential Packages For Complete KDE Plasma Experience

![Screenshot_20250124_182446](https://github.com/user-attachments/assets/4d22b92e-5935-468c-8b8b-fdf2ed4ced17)

This list highlights KDE and KDE-adjacent applications likely to enhance your KDE Plasma experience. All package names are specific to Arch-based distributions, but links to each application’s homepage provide further details.

#### But, why?

Switching to KDE from GNOME, XFCE, or other environments? If you’ve fallen in love with KDE Plasma and want applications that seamlessly integrate with it, this list is for you. Instead of sifting through the vast and sometimes confusing repository at [apps.kde.org](https://apps.kde.org), this guide filters out the noise and showcases must-have apps.

**Note**: This guide doesn’t cover themes or cursors. For that, visit [this repository](https://github.com/francoism90/awesome-kde).

#### To Do

- [ ] Readability
- [ ] More small but important details
- [ ] Installation script for different distributions
- [ ] You tell me

#### Contribute

Suggestions for new apps or categories are welcome! Submit a pull request to improve this guide.

## ✨ Components that enhance KDE functionality

If you use for example [KDE Neon](https://neon.kde.org), [Fedora KDE Spin](https://fedoraproject.org/spins/kde), [Kubuntu](https://kubuntu.org) and other systems where everything is ready out of the box, you may not need this section.

- [`svgpart`](https://apps.kde.org/svgpart) - allows [Ark](https://apps.kde.org/ark), [Kate](https://apps.kde.org/kate), [KDevelop](https://apps.kde.org/kdevelop), [Konqueror](https://apps.kde.org/konqueror) and [Krusader](https://apps.kde.org/krusader) to render `.svg` content without opening third-party applications
- [`markdownpart`](https://apps.kde.org/markdownpart) - allows [Ark](https://apps.kde.org/ark), [Kate](https://apps.kde.org/kate), [KDevelop](https://apps.kde.org/kdevelop), [Konqueror](https://apps.kde.org/konqueror) and [Krusader](https://apps.kde.org/krusader) to render markdown content without opening third-party applications
	- **How to enable in Kate**: *Settings > Plugins > Document Preview*
- `baloo-widgets` - provides extra metadata in [Dolphin’s](https://apps.kde.org/dolphin) Information Panel (requires Baloo file indexing)
- `dolphin-plugins` - adds [Git](https://git-scm.com), [Bazaar](https://www.gnu.org/software/bazaar), [Mercurial](https://www.mercurial-scm.org), and ISO mounting support to [Dolphin](https://apps.kde.org/dolphin)
- `kde-inotify-survey` - a diagnostic tool to check the availability and limits of inotify, a Linux kernel feature for monitoring filesystem events. [Explanation](https://github.com/KDE/kde-inotify-survey)
- `kdenetwork-filesharing` - provide easily sharing files and directories over the network
- `kio-extras`, `kio-fuse`, `kio-gdrive,` `kio-admin` - provide seamless access to remote filesystems, cloud storage (e.g., Google Drive), network protocols, and administrative file management in KDE applications and beyond
- `kwalletmanager` - System Settings module for [kwallet](https://en.wikipedia.org/wiki/KWallet)
- `xwaylandvideobridge` -  exposes [Wayland](https://wayland.freedesktop.org) screen into [X11](https://en.wikipedia.org/wiki/X_Window_System) window. Useful for apps that doesn't support [Wayland](https://wayland.freedesktop.org) / [Pipewire](https://pipewire.org) screen sharing
- `iio-sensor-proxy` - automatic screen rotation. Useful for wearable devices
- `libappindicator-gtk3` - Tray icon for [GTK3](https://docs.gtk.org/gtk3) apps
- `maliit-keyboard` - on-screen keyboard
- `power-profiles-daemon` - enables the power profile functionality in Plasma.  **Please** read the note below
- `xdg-desktop-portal-gtk`, `xsettingsd` - sync [GTK](https://en.wikipedia.org/wiki/GTK) font / theme settings with Plasma
- `orca` - screen reader
- `systemd-coredumpd` - crash handler
- `cryfs` & `encfs` & `gocryptfs` - encryption algorithms for Plasma's Vault
- `ufw` **or** `firewalld` - firewall support
- `fwupd` - adds ability to update your device's firmware from [Discover](https://apps.kde.org/discover) or *Info Center*<sup>(installs by default in plasma)</sup>
- `quota-tools` - applet for [Disk Quota](https://en.wikipedia.org/wiki/Disk_quota). You don't really need this
- `ripgrep` & `ripgrep-all` - Dolphin's search backend<sup>([link](https://blogs.kde.org/2024/10/02/use-ripgrep-all-/-ripgrep-to-improve-search-in-dolphin))</sup> when Baloo is disabled
- `hunspell` & `hunspell-$LOCALE` - Plasma's spell cheking system & dictionaries
- [`kdeconnect`](https://kdeconnect.kde.org) - seamlessly integrates your phone with Plasma
    - `sshfs` - allows to browse phone's filesystem
    - `qt6-tools` - runcommand plugin settings
    - `krfb` - use remote device as virtual monitor

> [!WARNING]
> The `power-profiles-daemon` works with the CPPC driver, which adjusts CPU frequencies differently than `acpi-cpufreq`. If your processor does not support CPPC (e.g. zen1 or some zen2 CPUs) you can install `tuned` and `tuned-ppd` as replacements for `power-profiles-daemon`. 
> Remember to enable the systemd service for both packages immediately after installation. Reboot is not needed
> ```bash
> sudo pacman -S tuned tuned-ppd
> sudo systemctl enable --now tuned tuned-ppd
> ```

### 🖼️ Thumbnailing plugins

- `ffmpegthumbs` - generates video thumbnails across KDE apps
- `kdegraphics-thumbnailers` -  a collection of plugins for generating file thumbnails
- `kimageformats` - a KDE library that adds support for various image file formats, enabling viewing and processing in KDE applications. More info [here](https://api.kde.org/frameworks/kimageformats/html/index.html)
- `icoutils` - thumbnails for Windows's executables across KDE apps
- `qt{5,6}-imageformats` - provides support for formats like PNG, JPEG, GIF, and others in Qt6-based applications

### 💼 KDE PIM

KDE PIM helps manage email, calendars, contacts, and more. Install only if you need it.

- [ Info Link 1](https://community.kde.org/KDE_PIM)
- [Info Link 2](https://wiki.archlinux.org/title/KDE#PIM)

To install the entire set of required programs at once, use the `kde-pim` package group, or the `kde-pim-meta` meta package. 

- **Notable Apps**:
	- [`kontact`](https://apps.kde.org/kontact) -  email, calendar, contacts and other personal data. Kontact includes [KMail](https://apps.kde.org/kmail2) <sup>(mail client)</sup>, [KOrganizer](https://apps.kde.org/korganizer) <sup>(calendar, scheduling, tasks app)</sup>, [KAddressBook](https://apps.kde.org/kaddressbook) <sup>(personal details, such as family, friends, phone number and much more)</sup> and [Akregator](https://apps.kde.org/akregator) <sup>(news feed reader)</sup>
	- [`zanshin`](https://apps.kde.org/zanshin) - manage your day to day actions
	- [`ktimetracker`](https://apps.kde.org/ktimetracker) - time tracker / management. Not part of PIM, but I still decided to put it here. The project seems like abandoned
	- [`kleopatra`](https://apps.kde.org/kleopatra) - certificate management
	- [`kmymoney`](https://apps.kde.org/kmymoney) - finance management

Below is a list of packages that complement the KDE PIM environment:

- `kdepim-addons` - a lot of useful addons

For detailed further instructions, please refer to [ArchWiki](https://wiki.archlinux.org/title/KDE#PIM).

## 📦 Apps from the KDE ecosystem

These are mostly applications that have been in the KDE application catalog for a long time, but are not included in DE.

### 📈 Administration / 📊 System monitoring

- [`filelight`](https://apps.kde.org/filelight) - visual representation of filesystem usage
- [`isoimagewriter`](https://apps.kde.org/isoimagewriter) - `.iso` image writer. Also try [`ventoy`](https://github.com/ventoy/Ventoy)
- [`kfind`](https://apps.kde.org/kfind) - simple but fast file searching
    - `mlocate`<sup>(orphaed?)</sup> - search using mlocate index
- [`kgpg`](https://apps.kde.org/kgpg) - GPG keys management
- [`kjournald`](https://invent.kde.org/system/kjournald) - view and manage systemd logs
- [`ksystemlog`](https://apps.kde.org/ksystemlog) - kernel, xorg and other system logs
- [`kwalletmanager`](https://apps.kde.org/kwalletmanager5) - password management
- [`partitionmanager`](https://apps.kde.org/partitionmanager) - *"[GParted](https://gparted.org) by KDE"*
    - `dosfstools`<sup>(optional)</sup> - FAT16 & FAT32 support
    - `jfsutils`<sup>(optional)</sup> - jfs support
    - `btrfs-progs`<sup>(optional)</sup> - BTRFS support
    - `exfatprogs`<sup>(optional)</sup> - exFAT support
    - `ntfs-3g`<sup>(optional)</sup> - NTFS support
    - `xfsprogs`<sup>(optional)</sup> - XFS support
- [`yakuake`](https://apps.kde.org/yakuake) - drop-down terminal

### 📽️ Multimedia / 💾 Downloads

- [`amarok`](https://apps.kde.org/amarok)<sup>[AUR](https://aur.archlinux.org/packages/amarok)</sup> - music player
- [`audiotube`](https://apps.kde.org/audiotube) - YouTube Music player
- [`kaffeine`](https://apps.kde.org/kaffeine) - media player
- [`dragon`](https://apps.kde.org/dragonplayer) - meida player
- [`elisa`](https://apps.kde.org/elisa) - music player. Supports radio streaming
- [`haruna`](https://apps.kde.org/haruna) - I call it [mpv](https://mpv.io) on steroids
    - [`yt-dlp`](https://github.com/yt-dlp/yt-dlp)<sup>(optional)</sup> - YouTube support
- [`juk`](https://apps.kde.org/juk) - yet another one music player
- [`kget`](https://apps.kde.org/kget) - universal download manager
    - `libktorrent`<sup>(optional)</sup> - torrent support
- [`ktorrent`](https://apps.kde.org/ktorrent) - torrent client
	- [`kplotting`](https://community.kde.org/Frameworks)<sup>(optional)</sup> - *"statistics plugin"* for [`ktorrent`](https://apps.kde.org/ktorrent)
- [`plasmatube`](https://apps.kde.org/plasmatube) - frontend for YouTube
- [`vvave`](https://apps.kde.org/vvave) - yet another one music player

### 📚 Office / ⏰ Productivity / 📝 Work

- [`arianna`](https://apps.kde.org/arianna) - ebook reader
- [`calligra`](https://apps.kde.org/calligra) - all in one office suite
    - `libetonyek`<sup>(optional)</sup> - Apple Keynote import filter
    - `libvisio`<sup>(optional)</sup> - Microsoft Visio import filter
    - `libwpg`<sup>(optional)</sup> - Corel WordPerfect Graphics image importer
    - `libwps`<sup>(optional)</sup> - Microsoft Works file word processor format importer
    - `poppler`<sup>(optional)</sup> - PDF to SVG filter
    - `pstoedit`<sup>(optional)</sup> - EPS to SVG filter
    - `qt6-webengine`<sup>(optional)</sup> - Braindump web shape
- [`francis`](https://apps.kde.org/francis) - pomodoro timer
- [`ghostwriter`](https://apps.kde.org/ghostwriter) - markdown note-taking app
    - `cmark`<sup>(optional)</sup> - CommonMark support
    - `mathjax`<sup>(optional)</sup> - formula rendering in live preview
    - `pandoc`<sup>(optional)</sup> - Pandoc support
- [`gwenview`](https://apps.kde.org/gwenview) - fast image viewer with ability to edit images
    - `kamera`<sup>(optional)</sup> - import images from cameras
    - `kimageformats` - mentioned above
    - `qt6-imageformats` - mentioned above
- [`kalk`](https://apps.kde.org/kalk) - calculator
- [`kcalc`](https://apps.kde.org/kcalc) - calculator as well
- [`kcolorchooser`](https://apps.kde.org/kcolorchooser) - simple color picker
- [`kdenlive`](https://apps.kde.org/kdenlive) - powerful video editor
    - `bigsh0t`<sup>(optional)</sup> - VR360 effects
    - `dvgrab`<sup>(optional)</sup> - firewire capture
    - `kimageformats` - mentioned above
    - `mediainfo`<sup>(optional)</sup> - technical clip information
    - `noise-suppression-for-voice`<sup>(optional)</sup> - self-explanatory
    - `opencv`<sup>(optional)</sup> - motion tracking
    - `opentimelineio`<sup>(optional)</sup> - timeline import & export
    - `python-openai-whisper` & `python-srt_equalizer`<sup>(optional)</sup> - OpenAI's stt model
    - `python-vosk`<sup>(optional)</sup> - VOSK stt model
    - `recordmydesktop`<sup>(optional)</sup> - screen capture
- [`kile`](https://apps.kde.org/kile) - [LaTex](https://en.wikipedia.org/wiki/LaTeX) editor
- [`klevernotes`](https://apps.kde.org/klevernotes)<sup>[AUR](https://aur.archlinux.org/packages/klevernotes)</sup> - note taking app
- [`kolourpaint`](https://apps.kde.org/kolourpaint) - paint app, similiar to Windows's one
- [`okular`](https://apps.kde.org/okular) - PDF reader on steroids
     - `ebook-tools`<sup>(optional)</sup> - mobi and epub support
     - `kdegraphics-mobipocket`<sup>(optional)</sup> - mobi support
     - `unarchiver` **or** `unrar`<sup>(optional)</sup> - Comic Book support
- [`subtitlecomposer`](https://apps.kde.org/subtitlecomposer) - subtitle editor
- [`keepassxc`](https://keepassxc.org/) - passwords manager, works with kdbx format

### ⚒️ Development

- [`kate`](https://apps.kde.org/kate) / [`kwrite`](https://apps.kde.org/kwrite)<sup>(installs with kate)</sup> - *"Advanced Text Editor"*. Can be used in development
    - `clang`<sup>(optional)</sup> - C & C++ LSP support
    - `git`<sup>(optional)</sup> - git-blame support
    - `python-lsp-server`<sup>(optional)</sup> - self-explanatory
    - `qt6-declarative`<sup>(optional)</sup> - RBQL plugin
    - `qtkeychain-qt6`<sup>(optional)</sup> - SQL plugin
    - `rust`<sup>(optional)</sup> - rust LSP support
    - `texlab`<sup>(optional)</sup> - LaTex support
- [`kdevelop`](https://apps.kde.org/kdevelop) - IDE
    - `apr` & `apr-util` & `subversion`<sup>(optional)</sup> - SVN support
    - `gdb`<sup>(optional)</sup> - GNU debugger
    - `heaptrack`<sup>(optional)</sup> - memory profiler
    - `cppcheck`<sup>(optional)</sup> - code analizer
    - `meson`<sup>(optional)</sup> - meson integration
    - `purpose`<sup>(optional)</sup> - patch review plugin
    - `qt6-doc`<sup>(optional)</sup> - QT dcumentation integration
- [`kompare`](https://apps.kde.org/kompare) - diff / patch frontend
- [`okteta`](https://apps.kde.org/okteta) - HEX editor

### 💫 Other

- [`alpaka`](https://apps.kde.org/alpaka)<sup>[AUR](https://aur.archlinux.org/packages/alpaka-git)</sup> - GUI frontend for [Ollama](https://ollama.com). **Note**: still in development
- [`kclock`](https://apps.kde.org/kget) - simple clock app for KDE Plasma / Plasma Mobile
- [`kmousetool`](https://apps.kde.org/kmousetool) - mouse auto clicker
- [`kweather`](https://apps.kde.org/kweather) - weather app. Initially designed for [Plasma Mobile](https://plasma-mobile.org), but can be used in Plasma Desktop
- [`nota`](https://apps.kde.org/nota)<sup>[AUR](https://aur.archlinux.org/packages/nota)</sup> - simple text editor for KDE Plasma / [Plasma Mobile](https://plasma-mobile.org)
- [`kdialog`](https://develop.kde.org/docs/administration/kdialog) - [`zenity`](https://en.wikipedia.org/wiki/Zenity) & [`yad`](https://github.com/v1cont/yad) alternative
- [`khelpcenter`](https://apps.kde.org/khelpcenter) - offline (F1) documentation for KDE components

## 🧑‍🤝‍🧑 Third-party applications that were made (not) for KDE 

- [`kde-material-you-colors`](https://github.com/luisbocanegra/kde-material-you-colors)<sup>[AUR](https://aur.archlinux.org/packages/kde-material-you-colors)</sup> - Android's Material You color palette for KDE
    - **How To**: *Open Tray Menu > KDE Material You Colors*
    - **How To**: *Right click on the desktop > Add or Manage Widgets > KDE Material You Colors*
- [`kando`](https://github.com/kando-menu/kando)<sup>[AUR](https://aur.archlinux.org/packages/kando-bin)</sup> - a nice looking cross-platform pie menu
- [`koi`](https://github.com/baduhai/Koi)<sup>[AUR](https://aur.archlinux.org/packages/koi)</sup> - auto light / dark mode switcher. [^1]
- [`media-downloader`](https://github.com/mhogomchungu/media-downloader)<sup>[AUR](https://aur.archlinux.org/packages/media-downloader)  [^2]</sup> - a universal app for downloading media from a popular sites such as YouTube and others
    - `aria2`<sup>(optional)</sup> - aria2 backend
- [`plasma6-applets-panel-colorizer`](https://github.com/luisbocanegra/plasma-panel-colorizer)<sup>[AUR](https://aur.archlinux.org/packages/plasma6-applets-panel-colorizer)</sup> - customize your panel as you want
    - **How To**: *Right Click on the Desktop > Add or Manage Widgets > drag the widget to one of your panels > right click on the widget > configure*
- [`plasma6-applets-wallpaper-effects`](https://github.com/luisbocanegra/plasma-wallpaper-effects)<sup>[AUR](https://aur.archlinux.org/packages/plasma6-applets-wallpaper-effects)</sup> - various wallpaper effects
    - **How To**: *Right Click on the Desktop > Add or Manage Widgets > select the widget and drag it to the desktop*
- [`plasma6-wallpapers-blurredwallpaper`](https://github.com/bouteillerAlan/blurredwallpaper)<sup>[AUR](https://aur.archlinux.org/packages/plasma6-wallpapers-blurredwallpaper)</sup> - blurs wallpaper when active window is present
    - **How To**: *Right Click on the Desktop > Desktop and Wallpaper > \*choose "Blurred Wallpaper"\* wallpaper plugin > Set blur radius and click "Apply"*
- [`plasma6-wallpapers-wallpaper-engine-git`](https://github.com/catsout/wallpaper-engine-kde-plugin)<sup>[AUR](https://aur.archlinux.org/packages/plasma6-wallpapers-wallpaper-engine-git)</sup> - [Wallpaper Engine](https://store.steampowered.com/app/431960/Wallpaper_Engine) plugin for KDE Plasma
    - **How To**: *Install Wallpaper Engine from Steam, open it and download some wallpapers > Right Click on the Desktop > Desktop and Wallpaper > \*choose wallpaper engine plugin\* > Set Default Steam Folder > apply*
- [`protonup-qt`](https://github.com/DavidoTek/ProtonUp-Qt)<sup>[AUR](https://aur.archlinux.org/packages/protonup-qt)  [^2]</sup> - install and manage [GE-Proton](https://github.com/GloriousEggroll/proton-ge-custom), [Steam Proton](<https://en.wikipedia.org/wiki/Proton_(software)>), [Lutris](https://github.com/lutris/lutris) runners and much more
- [`qbittorrent`](https://github.com/qbittorrent/qBittorrent) - cmon man, you know what is this!
- [`qtpass`](https://github.com/IJHack/QtPass) - a QT wrapper for [pass](https://www.passwordstore.org)
- [`yin-yang`](https://github.com/oskarsh/Yin-Yang)<sup>[AUR](https://aur.archlinux.org/packages/yin-yang)</sup> - auto light / dark mode switcher[^1]
- [`qpwgraph`](https://gitlab.freedesktop.org/rncbc/qpwgraph) - [PipeWire](https://gitlab.freedesktop.org/rncbc/qpwgraph) GUI frontend
- [`jamesdsp`](https://github.com/Audio4Linux/JDSP4Linux) - [EasyEffects](https://github.com/wwmm/easyeffects) alternative
- [`qownnotes`](https://www.qownnotes.org) - notes app
- [`kwin-effects-kinetic`](https://github.com/gurrgur/kwin-effects-kinetic) - kinetic kwin effects

## 🛑 Apps you might want to avoid

Apps that you might want to install, but are pointless because Plasma already has this functionality right out of the box.

- [`kcolorchooser`](https://apps.kde.org/kcolorchooser) - color picker. 
    - **Reason**: Plasma has a built-in widget that does the same thing
    - **How To**: *Right Click on the taskbar > Add or Manage Widgets > Color Picker >  \*drag into the taskbar\* right click on the widget (applet) > Open Color Dialog*
- [`kmag`](https://apps.kde.org/kmag) - screen magnifier. 
    - **Reason**: Plasma has a built-in desktop effect that does the same thing in a more convenient way
    - **How To**: *System Settings > Window Management > Desktop Effects > Zoom Effect*

[^1]: The KDE team wanted to implement this as part of KDE, but apparently we won't see it until at least the release of Plasma 7. [Link](https://discuss.kde.org/t/auto-dark-mode-sunrise-sunset/2415/2).
[^2]: Available in the [CachyOS](https://cachyos.org) repositories.
