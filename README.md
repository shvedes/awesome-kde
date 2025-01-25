
# Essential Packages For Complete KDE Plasma Experience

![Screenshot_20250124_182446](https://github.com/user-attachments/assets/4d22b92e-5935-468c-8b8b-fdf2ed4ced17)

This list highlights KDE and KDE-adjacent applications likely to enhance your KDE Plasma experience. All package names are specific to Arch-based distributions, but links to each application’s homepage provide further details.

#### But, why?

Switching to KDE from GNOME, XFCE, or other environments? If you’ve fallen in love with KDE Plasma and want applications that seamlessly integrate with it, this list is for you. Instead of sifting through the vast and sometimes confusing repository at [apps.kde.org](https://apps.kde.org), this guide filters out the noise and showcases must-have apps.

**Note**: This guide doesn’t cover themes or cursors. For that, visit [this repository](https://github.com/francoism90/awesome-kde).

#### To Do

- [ ] Readability
- [ ] More small but important details
- [ ] Install script for different distributions
- [ ] You tell me

#### Contribute

Suggestions for new apps or categories are welcome! Submit a pull request to improve this guide.

#### Formatiing

This list will often include emoji to make it clearer. Here are explanations of each one:
- 👍 - the author uses this program and advises you to install it too
- ✔️ - the application is maintained and was created by the KDE team. It is also available at https://apps.kde.org
- ⚙️ - in Arch Linux, pacman lists optional packages during installation. These add extra functionality but aren’t installed automatically, aligning with Arch's minimalism. The program works fine without them, but installing is often beneficial
- 💡- mini instruction for activating the described function. If a package enhances multiple apps but includes instructions for only a few, it works automatically in the rest

## ✨ Components that enhance KDE functionality

KDE components that mostly work under the hood, but add a ton of functionality to KDE itself and its applications.
If you use for example [KDE Neon](https://neon.kde.org), [Fedora KDE Spin](https://fedoraproject.org/spins/kde), [Kubuntu](https://kubuntu.org) and other systems where everything is ready out of the box, you may not need this section.

- `svgpart` <sup>([link](https://apps.kde.org/svgpart))✔️ </sup> — allows [Ark](https://apps.kde.org/ark), [Kate](https://apps.kde.org/kate), [KDevelop](https://apps.kde.org/kdevelop), [Konqueror](https://apps.kde.org/konqueror) and [Krusader](https://apps.kde.org/krusader) to render `.svg` content without opening third-party applications
- `markdownpart` <sup>([link](https://apps.kde.org/markdownpart))✔️</sup> — allows [Ark](https://apps.kde.org/ark), [Kate](https://apps.kde.org/kate), [KDevelop](https://apps.kde.org/kdevelop), [Konqueror](https://apps.kde.org/konqueror) and [Krusader](https://apps.kde.org/krusader) to render markdown content without opening third-party applications
	- [Kate](https://apps.kde.org/kate) <sup>💡</sup>: *Settings > Plugins > Document Preview*
- `baloo-widgets` <sup>([link](https://github.com/KDE/baloo-widgets))✔️</sup> — adds extra metadata in [Dolphin’s](https://apps.kde.org/dolphin) Information Panel (requires Baloo file indexing)
- `dolphin-plugins` <sup>([link](https://apps.kde.org/dolphin_plugins))✔️</sup> — adds [Git](https://git-scm.com), [Bazaar](https://www.gnu.org/software/bazaar), [Mercurial](https://www.mercurial-scm.org), and ISO mounting support to [Dolphin](https://apps.kde.org/dolphin)
- `kde-inotify-survey` <sup>([link](https://github.com/KDE/kde-inotify-survey))✔️ </sup> — a diagnostic tool to check the availability and limits of inotify, a Linux kernel feature for monitoring filesystem events
- `kdenetwork-filesharing` <sup>([link](https://apps.kde.org/kdenetwork_filesharing))✔️</sup> — provide easily sharing files and directories over the network. **Note**: still in development
- `kio-extras` <sup>([link](https://github.com/KDE/kio-extras))✔️</sup>, `kio-fuse` <sup>([link](https://github.com/KDE/kio-fuse))✔️</sup>, `kio-gdrive` <sup>([link](https://apps.kde.org/kio_gdrive))✔️</sup>, `kio-admin` <sup>([link](https://github.com/KDE/kio-admin))✔️</sup> — provide seamless access to remote filesystems, cloud storage (e.g., Google Drive), network protocols, and administrative file management in KDE applications and beyond
- `kwalletmanager` <sup>([link](https://apps.kde.org/nl/kwalletmanager5))✔️</sup> — [KWallet's](https://en.wikipedia.org/wiki/KWallet) [KCM](https://develop.kde.org/docs/features/configuration/kcm) module
- `xwaylandvideobridge` <sup>([link](https://github.com/KDE/xwaylandvideobridge))✔️</sup> —  Utility to allow streaming [Wayland](https://en.wikipedia.org/wiki/Wayland_(protocol)) windows to [X](https://en.wikipedia.org/wiki/X_Window_System) applications
- `iio-sensor-proxy` <sup>([link](https://gitlab.freedesktop.org/hadess/iio-sensor-proxy))</sup> — automatic screen rotation. Useful for wearable devices
- `libappindicator-gtk3` — tray icon for [GTK3](https://docs.gtk.org/gtk3) apps
- `maliit-keyboard` <sup>([link](https://maliit.github.io))</sup> — on-screen keyboard
    - How to <sup>💡</sup>: *System Settings > Keyboard > Virtual Keyboard*
- `power-profiles-daemon` <sup>([link](https://gitlab.freedesktop.org/upower/power-profiles-daemon))</sup> — enables the power management in Plasma.  **Please** read the callout below
- `xdg-desktop-portal-gtk` <sup>([link](https://github.com/flatpak/xdg-desktop-portal-gtk))</sup>, `xsettingsd` <sup>([link](https://codeberg.org/derat/xsettingsd))</sup> — sync [GTK](https://en.wikipedia.org/wiki/GTK) font / theme settings with Plasma
- `orca` <sup>([link](https://userbase.kde.org/Accessibility/Plasma#Starting_Orca_Screenreader))</sup> — screen reader
    - How to <sup>💡</sup>: *System Settings > Accessibility > Screenreader Tab > "Enable Screen Reader" checkbox*
- `cryfs` <sup>([link](https://github.com/cryfs/cryfs))</sup>, `encfs` <sup>([link](https://github.com/vgough/encfs))</sup>, `gocryptfs` <sup>([link](https://github.com/rfjakob/gocryptfs))</sup> — encryption algorithms for Plasma's Vault
- `ufw` <sup>([link](https://en.wikipedia.org/wiki/Uncomplicated_Firewall))</sup> **or** `firewalld` <sup>([link](https://en.wikipedia.org/wiki/Firewalld))</sup> — firewall daemon
    - How to <sup>💡</sup> — *System Settings > WiFi & Internet > Firewall*
- `fwupd` <sup>([link](https://github.com/fwupd/fwupd))</sup> — adds the ability to update PC's firmware from the app store
- `quota-tools` <sup>([link](https://sourceforge.net/projects/linuxquota))</sup> — applet for [Disk Quota](https://en.wikipedia.org/wiki/Disk_quota). You don't really need this
- `ripgrep` <sup>([link](https://github.com/BurntSushi/ripgrep))</sup> **and** `ripgrep-all` <sup>([link](https://github.com/phiresky/ripgrep-all))</sup> — [Dolphin's](https://apps.kde.org/dolphin) search backend <sup>([link](https://blogs.kde.org/2024/10/02/use-ripgrep-all-/-ripgrep-to-improve-search-in-dolphin))</sup> when Baloo is disabled
- `hunspell` <sup>([link](https://github.com/hunspell/hunspell))</sup> **and** `hunspell-$LOCALE` — Plasma's spell cheking system & dictionaries
- `kdeconnect` <sup>([link](https://kdeconnect.kde.org))✔️</sup> — seamlessly integrates your phone and other devices with Plasma
    - `sshfs` <sup>([link](https://github.com/libfuse/sshfs))⚙️</sup> — allows to browse phone's filesystem
    - `qt6-tools` — runcommand plugin settings
    - `krfb` <sup>([link](https://apps.kde.org/krfb))✔️</sup> — use remote device as virtual monitor
- `krfb` (itself) <sup>([link](https://apps.kde.org/krfb))✔️</sup> — remote desktop sharing

> [!WARNING]
> The `power-profiles-daemon` works with the [CPPC](https://docs.kernel.org/admin-guide/acpi/cppc_sysfs.html) driver, which adjusts CPU frequencies differently than `acpi-cpufreq`. If your processor does not support CPPC (e.g. zen1 or some zen2 CPUs) you can install `tuned` and `tuned-ppd` as replacements for `power-profiles-daemon`. 
> Remember to enable the systemd service for both packages immediately after installation. Reboot is not needed
> ```bash
> sudo pacman -S tuned tuned-ppd
> sudo systemctl enable --now tuned tuned-ppd
> ```

### 🖼️ Thumbnailing plugins

- `ffmpegthumbs` <sup>([link](https://github.com/KDE/ffmpegthumbs))✔️</sup> — generates video thumbnails across KDE apps
- `kdegraphics-thumbnailers` <sup>([link](https://apps.kde.org/kdegraphics_thumbnailers))✔️</sup> —  a collection of plugins for generating file thumbnails
- `kimageformats` <sup>([link](https://api.kde.org/frameworks/kimageformats/html/index.html))✔️</sup> — a KDE library that adds support for various image file formats, enabling viewing and processing in KDE applications. More info [here](https://api.kde.org/frameworks/kimageformats/html/index.html)
- `icoutils` <sup>([link](https://www.nongnu.org/icoutils))</sup> — thumbnails for Windows's executables across KDE apps
- `qt{5,6}-imageformats` <sup>([link](https://doc.qt.io/qt-6/qtimageformats-index.html))</sup> <sup><sup>(shell's argument substitution)</sup></sup> — provides support for formats like PNG, JPEG, GIF, and others in Qt6-based applications

### 💼 KDE PIM

KDE PIM helps manage email, calendars, contacts, and more. Install only if you need it.

- [Info Link 1](https://community.kde.org/KDE_PIM)
- [Info Link 2](https://wiki.archlinux.org/title/KDE#PIM)

To install the entire set of required programs at once, use the `kde-pim` package group, or the `kde-pim-meta` meta package. 

- **Notable Apps**:
	- `kontact` <sup>([link](https://apps.kde.org/kontact))✔️</sup> — email, calendar, contacts and other personal data management
    - `kmail` <sup>([link](https://apps.kde.org/kmail2))✔️</sup> — mail client
    - `korganizer` <sup>([link](https://apps.kde.org/korganizer))✔️</sup> — personal calender, tasks management and more
    - `kaddressbook` <sup>([link](https://apps.kde.org/kaddressbook))✔️</sup> — personal data such as family members, friends, phone number and much more
    - `akregator` <sup>([link](https://apps.kde.org/akregator))✔️</sup> — [RSS](https://en.wikipedia.org/wiki/RSS) reader
	- `zanshin` <sup>([link](https://apps.kde.org/zanshin))✔️</sup> — your day to day actions management
    - `ktimetracker` <sup>([link](https://apps.kde.org/ktimetracker))✔️ <sup>abandoned?</sup></sup> — time management. Not part of PIM, but I still decided to put it here
    - `kleopatra` <sup>([link](https://apps.kde.org/kleopatra))✔️</sup> — certificate management
    - `kmymoney` <sup>([link](https://apps.kde.org/kmymoney))✔️</sup> — finance management

Below is a list of packages that complement the KDE PIM environment:

- `kdepim-addons` <sup>([link](https://github.com/KDE/kdepim-addons))✔️</sup> — a set of PIM plugins

For detailed further instructions, please refer to [ArchWiki](https://wiki.archlinux.org/title/KDE#PIM).

## 📦 Apps from the KDE ecosystem

These are mostly applications that have been in the KDE application catalog for a long time, but are not included in DE.

### 📈 Administration / 📊 System monitoring

- `filelight` <sup>([link](https://apps.kde.org/filelight))✔️</sup> — disk usage visualizer | 👍
- `isoimagewriter` <sup>([link](https://apps.kde.org/isoimagewriter))✔️</sup> — disk image writer. Also try [`ventoy`](https://github.com/ventoy/Ventoy)
- `kfing` <sup>([link](https://apps.kde.org/kfind))✔️</sup> — simple but fast file searching
    - `mlocate` <sup>([link](https://pagure.io/mlocate))  <sup>[AUR](https://aur.archlinux.org/packages/mlocate-git)</sup> <sup><sup>abandoned?</sup></sup></sup> — search using mlocate index
- `kgpg` <sup>([link](https://apps.kde.org/kgpg))✔️</sup> — GPG keys management | 👍
    - **Note**: also allows you to encrypt files via the [Dolphin's](https://apps.kde.org/dolphin) context menu
- `kjournald` <sup>([link](https://invent.kde.org/system/kjournald))✔️</sup> — view and manage [journalctl](https://www.freedesktop.org/software/systemd/man/journalctl.html) logs
- `ksystemlog` <sup>([link](https://apps.kde.org/ksystemlog))✔️</sup> — view and manage kernel, xorg and other system logs
- `kwalletmanager` <sup>([link](https://apps.kde.org/kwalletmanager5))✔️</sup> — password management GUI
- `partitionmanager` <sup>([link](https://apps.kde.org/partitionmanager))✔️</sup> — *"[GParted](https://gparted.org) by KDE"* | 👍
    - `dosfstools` <sup><sup>⚙️</sup></sup> — [FAT16 and FAT32](https://en.wikipedia.org/wiki/File_Allocation_Table) support
    - `jfsutils` <sup><sup>⚙️</sup></sup> — [jfs](https://en.wikipedia.org/wiki/JFS_(file_system)) support
    - `btrfs-progs` <sup><sup>⚙️</sup></sup> — [BTRFS](https://en.wikipedia.org/wiki/Btrfs) support <sup><sup>(the **best** filesystem **ever**)</sup></sup>
    - `exfatprogs` <sup><sup>⚙️</sup></sup> — [exFAT](https://en.wikipedia.org/wiki/ExFAT) support
    - `ntfs-3g` <sup><sup>⚙️</sup></sup> — [NTFS](https://en.wikipedia.org/wiki/NTFS) support
    - `xfsprogs` <sup><sup>⚙️</sup></sup> — [XFS](https://en.wikipedia.org/wiki/XFS) support
- `yakuake` <sup>([link](https://apps.kde.org/yakuake))✔️</sup> — drop-down terminal | 👍

### 📽️ Multimedia / 💾 Downloads

- `amarok` <sup>([link](https://apps.kde.org/amarok))✔️</sup> <sup><sup>[AUR](https://aur.archlinux.org/packages/amarok)</sup></sup> — music player
- `audiotube` <sup>([link](https://apps.kde.org/audiotube))✔️</sup> — YouTube Music player
- `kaffeine` <sup>([link](https://apps.kde.org/kaffeine))✔️</sup> — media player
- `dragon` <sup>([link](https://apps.kde.org/dragonplayer))✔️</sup> — media player
- `elisa` <sup>([link](https://apps.kde.org/elisa))✔️</sup> — music player. Supports radio streaming | 👍
- `haruna` <sup>([link](https://apps.kde.org/haruna))✔️</sup> — I call it [mpv](https://mpv.io) on steroids | 👍👍👍
    - `yt-dlp` <sup><sup>⚙️</sup></sup><sup>([link](https://github.com/yt-dlp/yt-dlp))</sup> — YouTube streaming support
- `juk` <sup>([link](https://apps.kde.org/juk))✔️</sup> — music player
- `kget` <sup>([link](https://apps.kde.org/kget))✔️</sup> — universal download manager
    - `libktorrent`<sup><sup>⚙️</sup></sup> — torrent support
- `ktorrent` <sup>([link](https://apps.kde.org/ktorrent))✔️</sup> — torrent client
	- `kplotting`<sup><sup>⚙️</sup></sup> — *"statistics plugin"* for [KTorrent](https://apps.kde.org/ktorrent)
- `plasmatube` <sup>([link](https://apps.kde.org/plasmatube))✔️</sup> — YouTube frontend
- `vvave` <sup>([link](https://apps.kde.org/vvave))✔️</sup> — music player

### 📚 Office / ⏰ Productivity / 📝 Work

- `arianna` <sup>([link](https://apps.kde.org/arianna))✔️</sup> — pretty convenient ebook reader | 👍
- `calligra` <sup>([link](https://apps.kde.org/calligra))✔️</sup> — all in one office suite
    - `libetonyek`<sup><sup>⚙️</sup></sup> — Apple Keynote import filter
    - `libvisio`<sup><sup>⚙️</sup></sup> — Microsoft Visio import filter
    - `libwpg`<sup><sup>⚙️</sup></sup> — Corel WordPerfect Graphics image importer
    - `libwps`<sup><sup>⚙️</sup></sup> — Microsoft Works file word processor format importer
    - `poppler`<sup><sup>⚙️</sup></sup> — PDF to SVG filter
    - `pstoedit`<sup><sup>⚙️</sup></sup> — EPS to SVG filter
    - `qt6-webengine`<sup><sup>⚙️</sup></sup> — Braindump web shape
- `francis` <sup>([link](https://apps.kde.org/francis))✔️</sup> — a pomodoro timer | 👍
- `ghostwriter` <sup>([link](https://apps.kde.org/ghostwriter))✔️</sup> — a markdown editor / note taking app
    - `cmark`<sup><sup>⚙️</sup></sup> — [CommonMark](https://commonmark.org) support
    - `mathjax`<sup><sup>⚙️</sup></sup> — [MathJax](https://www.mathjax.org) rendering in live preview
    - `pandoc`<sup><sup>⚙️</sup></sup> — [Pandoc](https://github.com/jgm/pandoc) support
- `gwenview` <sup>([link](https://apps.kde.org/gwenview))✔️</sup> — simpe & fast image viewer with ability to edit images | 👍
    - `kamera`<sup><sup>⚙️</sup></sup> — import images from cameras
    - `kimageformats`<sup><sup>⚙️</sup></sup> — mentioned above
    - `qt6-imageformats`<sup><sup>⚙️</sup></sup> — mentioned above
- `kalk` <sup>([link](https://apps.kde.org/kalk))✔️</sup> — calculator
- `kcalc` <sup>([link](https://apps.kde.org/kcalc))✔️</sup> — calculator as well | 👍
- `kcolorchooser` <sup>([link](https://apps.kde.org/kcolorchooser))✔️</sup> — simple color picker
- `kdenlive` <sup>([link](https://apps.kde.org/kdenlive))✔️</sup> — powerful video editor | 👍
    - `bigsh0t`<sup><sup>⚙️</sup></sup> — VR360 effects
    - `dvgrab`<sup><sup>⚙️</sup></sup> — firewire capture
    - `kimageformats` — mentioned above
    - `mediainfo`<sup><sup>⚙️</sup></sup> — technical clip information
    - `noise-suppression-for-voice`<sup><sup>⚙️</sup></sup> — self-explanatory
    - `opencv`<sup><sup>⚙️</sup></sup> — motion tracking
    - `opentimelineio`<sup><sup>⚙️</sup></sup> — timeline import & export
    - `python-openai-whisper` & `python-srt_equalizer`<sup><sup>⚙️</sup></sup> — OpenAI's stt model
    - `python-vosk`<sup><sup>⚙️</sup></sup> — VOSK stt model
    - `recordmydesktop`<sup><sup>⚙️</sup></sup> — screen capture
- `kile` <sup>([link](https://apps.kde.org/kile))✔️</sup> — [LaTex](https://en.wikipedia.org/wiki/LaTeX) editor
- `klevernotes` <sup>([link](https://apps.kde.org/klevernotes))✔️ <sup>[AUR](https://aur.archlinux.org/packages/klevernotes)</sup></sup> — note taking app
- `kolourpaint` <sup>([link](https://apps.kde.org/kolourpaint))✔️</sup> — simple paint app, similiar to Windows's one
- `okular` <sup>([link](https://apps.kde.org/okular))✔️</sup> — PDF reader on steroids | 👍👍👍
     - `ebook-tools`<sup><sup>⚙️</sup></sup> — mobi and epub support
     - `kdegraphics-mobipocket`<sup><sup>⚙️</sup></sup> — mobi support
     - `unarchiver`<sup><sup>⚙️</sup></sup> **or** `unrar`<sup><sup>⚙️</sup></sup> — Comic Book support
- `subtitlecomposer` <sup>([link](https://apps.kde.org/subtitlecomposer))✔️</sup> — subtitle editor

### ⚒️ Development

- `kate` <sup>([link](https://apps.kde.org/kate))✔️</sup> & `kwrite` <sup>([link](https://apps.kde.org/kwrite))✔️</sup> — *"Advanced Text Editor"*. Can be used in development | Kwrite: 👍👍👍
    - `clang`<sup><sup>⚙️</sup></sup> — C & C++ LSP support
    - `git`<sup><sup>⚙️</sup></sup> — git-blame support
    - `python-lsp-server`<sup><sup>⚙️</sup></sup> — self-explanatory
    - `qt6-declarative`<sup><sup>⚙️</sup></sup> — RBQL plugin
    - `qtkeychain-qt6`<sup><sup>⚙️</sup></sup> — SQL plugin
    - `rust`<sup><sup>⚙️</sup></sup> — rust LSP support
    - `texlab`<sup><sup>⚙️</sup></sup> — LaTex support
- `kdevelop` <sup>([link](https://apps.kde.org/kdevelop))✔️</sup> — IDE
    - `apr`, `apr-util` and `subversion`<sup><sup>⚙️</sup></sup> — SVN support
    - `gdb`<sup><sup>⚙️</sup></sup> — GNU debugger
    - `heaptrack`<sup><sup>⚙️</sup></sup> — memory profiler
    - `cppcheck`<sup><sup>⚙️</sup></sup> — code analizer
    - `meson`<sup><sup>⚙️</sup></sup> — meson integration
    - `purpose`<sup><sup>⚙️</sup></sup> — patch review plugin
    - `qt6-doc`<sup><sup>⚙️</sup></sup> — QT dcumentation integration
- `kompare` <sup>([link](https://apps.kde.org/kompare))✔️</sup> — diff / patch frontend
- `okteta` <sup>([link](https://apps.kde.org/okteta))✔️</sup> — HEX editor

### 💫 Other

- `alpaka` <sup>([link](https://apps.kde.org/alpaka))✔️ <sup>[AUR](https://aur.archlinux.org/packages/alpaka-git)</sup> — GUI frontend for [Ollama](https://ollama.com). **Note**: still in development
- `kcharselect` <sup>([link](https://apps.kde.org/kcharselect))✔️</sup> — unicode character picker
- `kclock` <sup>([link](https://apps.kde.org/kclock))✔️</sup> — simple clock app for KDE Plasma / Plasma Mobile | 👍
- `kmousetool` <sup>([link](https://apps.kde.org/kmousetool))✔️</sup> — mouse auto clicker
- `kweather` <sup>([link](https://apps.kde.org/kweather))✔️</sup> — weather app for KDE Plasma / [Plasma Mobile](https://plasma-mobile.org)
- `nota` <sup>([link](https://apps.kde.org/nota))✔️<sup>[AUR](https://aur.archlinux.org/packages/nota)</sup></sup> — simple text editor for KDE Plasma / [Plasma Mobile](https://plasma-mobile.org)
- `kdialog` <sup>([link](https://develop.kde.org/docs/administration/kdialog))✔️</sup> — [`zenity`](https://en.wikipedia.org/wiki/Zenity) and [`yad`](https://github.com/v1cont/yad) alternative | 👍
- `khelpcenter` <sup>([link](https://apps.kde.org/khelpcenter))✔️</sup> — offline (F1 shortcut by default) documentation for KDE apps

## 🧑‍🤝‍🧑 Third-party applications that were made (not) for KDE 

### Plasma components / effects

- `plasma6-applets-panel-colorizer` <sup>([link](https://github.com/luisbocanegra/plasma-panel-colorizer)) <sup>[AUR](https://aur.archlinux.org/packages/plasma6-applets-panel-colorizer)</sup></sup> — customize your panel as you want
    - 💡 - *Right Click on the Desktop > Add or Manage Widgets > drag the widget to one of your panels > right click on the widget > configure*
- `plasma6-applets-wallpaper-effects` <sup>([link](https://github.com/luisbocanegra/plasma-wallpaper-effects)) <sup>[AUR](https://aur.archlinux.org/packages/plasma6-applets-wallpaper-effects)</sup></sup> — various wallpaper effects | 👍
    - 💡 - *Right Click on the Desktop > Add or Manage Widgets > select the widget and drag it to the desktop*
- `plasma6-wallpapers-blurredwallpaper` <sup>([link](https://github.com/bouteillerAlan/blurredwallpaper)) <sup>[AUR](https://aur.archlinux.org/packages/plasma6-wallpapers-blurredwallpaper)</sup></sup> — blurs wallpaper when active window is present | 👍👍
    - 💡 - *Right Click on the Desktop > Desktop and Wallpaper > \*choose "Blurred Wallpaper"\* wallpaper plugin > Set blur radius and click "Apply"*
- `plasma6-wallpapers-wallpaper-engine-git` <sup>([link](https://github.com/catsout/wallpaper-engine-kde-plugin)) <sup>[AUR](https://aur.archlinux.org/packages/plasma6-wallpapers-wallpaper-engine-git)</sup></sup> — [Wallpaper Engine](https://store.steampowered.com/app/431960/Wallpaper_Engine) plugin for KDE Plasma | 👍👍
    - 💡 - *Install Wallpaper Engine from Steam, open it and download some wallpapers > Right Click on the Desktop > Desktop and Wallpaper > \*choose wallpaper engine plugin\* > Set Default Steam Folder > apply*
- `plasma6-applets-weather-widget-3-git` <sup>([link](https://github.com/blackadderkate/weather-widget-2)) <sup>[AUR](https://aur.archlinux.org/packages/plasma6-applets-weather-widget-3-git)</sup></sup> — simple weather widget, that live in the taskbar / tray | 👍👍
    - 💡 - *Right click on the desktop > Add or Manage Widgets > \*drag the widget into the taskbar\* > \*configure by right clicking\**
- `kde-material-you-colors` <sup>([link](https://github.com/luisbocanegra/kde-material-you-colors)) <sup>[AUR](https://aur.archlinux.org/packages/kde-material-you-colors)</sup></sup> — Android's Material You color palette for KDE | 👍👍👍
    - 💡 - *Open Tray Menu > KDE Material You Colors*
    - 💡 - *Right click on the desktop > Add or Manage Widgets > KDE Material You Colors*
- `kando` <sup>([link](https://github.com/kando-menu/kando)) <sup>[AUR](https://aur.archlinux.org/packages/kando-bin)</sup></sup> — a nice looking cross-platform pie menu
- `kwin-effect-rounded-corners` <sup>([link](https://github.com/matinlotfali/KDE-Rounded-Corners)) <sup>[AUR](https://aur.archlinux.org/packages/kwin-effect-rounded-corners-git)</sup></sup> — rounded window corners with outlines and shadow interpolation
- `kwin-effects-forceblur` <sup>([link](https://github.com/taj-ny/kwin-effects-forceblur)) <sup>[AUR](https://aur.archlinux.org/packages/kwin-effects-forceblur)</sup></sup> — force blur with rounded corners
- `kwin-effects-kinetic` <sup>([link](https://github.com/gurrgur/kwin-effects-kinetic)) <sup>[AUR](https://aur.archlinux.org/packages/kwin-effects-kinetic)</sup></sup> — kinetic kwin effects | 👍👍👍
- `kwin4_effect_geometry_change` <sup>([link](https://github.com/peterfajdiga/kwin4_effect_geometry_change))</sup> — animations for windows moved or resized by programs and scripts
- `kwin-scripts-krohnkite` <sup>([link](https://github.com/anametologin/krohnkite)) <sup>[AUR](https://aur.archlinux.org/packages/kwin-scripts-krohnkite-git)</sup></sup> — dynamic window tiling

### 📈 Administration / 📊 System monitoring

- `kdiskmark` <sup>([link](https://github.com/JonMagon/KDiskMark))</sup> — a [CrystalDiskMark](https://sourceforge.net/projects/crystaldiskmark) alternative for Linux

### 📚 Office / ⏰ Productivity / 📝 Work

- `qtpass` <sup>([link](https://github.com/IJHack/QtPass))</sup> — a QT wrapper for [pass](https://www.passwordstore.org) | 👍👍👍
- `qownnotes` <sup>([link](https://www.qownnotes.org)) <sup>[AUR](https://aur.archlinux.org/packages/qownnotes)</sup></sup> — notes app
- `keepassxc` <sup>([link](https://keepassxc.org))</sup> — a passwords manager, works with [kdbx](https://keepass.info/help/kb/kdbx_4.html) format

### 💫 Other

- `koi` <sup>([link](https://github.com/baduhai/Koi)) <sup>[AUR](https://aur.archlinux.org/packages/koi)</sup></sup> — auto light / dark mode switcher. [^1] | 👍👍👍
- `yin-yang` <sup>([link](https://github.com/oskarsh/Yin-Yang)) <sup>[AUR](https://aur.archlinux.org/packages/yin-yang)</sup></sup> — auto light / dark mode switcher [^1]
- `protonup-qt` <sup>([link](https://github.com/DavidoTek/ProtonUp-Qt)) <sup>[AUR](https://aur.archlinux.org/packages/protonup-qt)</sup></sup> — install and manage [GE-Proton](https://github.com/GloriousEggroll/proton-ge-custom), [Steam Proton](<https://en.wikipedia.org/wiki/Proton_(software)>), [Lutris](https://github.com/lutris/lutris) runners and much more <sup>[^2]</sup>
- `qbittorrent` <sup>([link](https://github.com/qbittorrent/qBittorrent))</sup> — cmon man, you know what is this! | 👍👍👍
- `qpwgraph` <sup>([link](https://gitlab.freedesktop.org/rncbc/qpwgraph))</sup> — a [PipeWire](https://gitlab.freedesktop.org/rncbc/qpwgraph) GUI frontend | 👍
- `jamesdsp` <sup>([link](https://github.com/Audio4Linux/JDSP4Linux)) <sup>[AUR](https://aur.archlinux.org/packages/jamesdsp)</sup></sup> — an [EasyEffects](https://github.com/wwmm/easyeffects) alternative
- `media-downloader` <sup>([link](https://github.com/mhogomchungu/media-downloader)) <sup>[AUR](https://aur.archlinux.org/packages/media-downloader)</sup></sup> — a cross-platform app for downloading media from a popular sites such as YouTube and others | 👍👍👍
    - `aria2`<sup><sup>⚙️</sup></sup> - [aria2](https://github.com/aria2/aria2) backend

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
