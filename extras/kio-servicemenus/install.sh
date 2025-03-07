#!/usr/bin/env bash

export XDG_DATA_HOME="$HOME/.local/share"

convert_image_script_url="https://raw.githubusercontent.com/shvedes/awesome-kde/refs/heads/main/extras/kio-servicemenus/scripts/convert-image.sh"
convert_image_servicemenus_url="https://raw.githubusercontent.com/shvedes/awesome-kde/refs/heads/main/extras/kio-servicemenus/servicemenus/convert-image.desktop"

scripts_dir="$HOME/.local/bin/kio-servicemenus"
servicemenus_dir="$XDG_DATA_HOME/kio/servicemenus"

dependencies=("kdialog" "magick" "git" "wget")
missing_deps=()

for item in "${dependencies[@]}"; do
	if ! command -v "$item" > /dev/null; then
		echo "Dependency $item is not installed"
		missing_deps+=("$item")
	fi
done

if [[ -n "${missing_deps[*]}" ]]; then
	exit 1
fi

echo "==> Creating directories"
mkdir -p "$XDG_DATA_HOME/kio/servicemenus"
mkdir -p "$HOME/.local/bin/kio-servicemenus"

echo "==> Copying files"
wget -q "$convert_image_script_url" -O "$scripts_dir/convert-image.sh"
wget -q "$convert_image_servicemenus_url" -O "$servicemenus_dir/convert-image.desktop"

echo "==> Setting things up"
chmod +x "$scripts_dir/convert-image.sh"
chmod +x "$servicemenus_dir/convert-image.desktop"
sed -i "s/username/$(whoami)/" "$servicemenus_dir/convert-image.desktop"

echo "==> Done"
