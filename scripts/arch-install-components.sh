#!/usr/bin/env bash

source /etc/os-release

install_packages() {
	local packages=("svgpart" "markdownpart" "baloo-widgets" "dolphin-plugins" "kde-inotify-survey" "kdenetwork-filesharing" "kio-extras"
                    "kio-fuse" "kio-gdrive" "kio-admin" "power-profiles-daemon" "xdg-desktop-portal-gtk" "xsettingsd" "cryfs" "encfs" "gocryptfs"
				    "ufw" "fwupd" "ripgrep" "ripgrep-all" "hunspell" "krfb" "ffmpegthumbs" "kdegraphics-thumbnailers" "kimageformats" "icoutils" 
					"qt5-imageformats" "qt6-imageformats")
					echo "[WARNING] This script will install only those packages mentioned in the very first section in https://github.com/shvedes/awesome-kde. (not all of them)"
	echo "[WARNING] If you want to install additional GUI applications to your liking, please refer to the repository itself and install what you need manually."

	read -rp "[QUESTION] Contunue? [y/n]: " proceed

	case "$proceed" in
		[Yy][Ee][Ss]|[Yy])
			echo "[INFO] Installing needed packages using pacman."
			sudo pacman -S --needed --noconfirm "${packages[@]}"
			echo "[INFO] Done"
			;;
		*)
			echo "[INFO] Terminating..."
			exit 0
			;;
	esac
}

echo "[WARNING] This script is designed for Arch-based systems only."

read -rp "[QUESTION] Are you using an Arch-based system? [y/n]: " os

case "$os" in
	[Yy][Ee][Ss]|[Yy])
		if [[ $ID_LIKE == "arch" ]]; then
			install_packages
		else
			echo "[EXITING] Lier!" 
			exit 1
		fi
		;;
	*)
		echo "[EXITING] Don't be lazy and add support for your distro."
		exit 0
		;;
esac
