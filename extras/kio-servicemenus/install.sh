#!/usr/bin/env bash

export XDG_DATA_HOME="$HOME/.local/share"

convert_image_script_url="https://raw.githubusercontent.com/shvedes/awesome-kde/refs/heads/main/extras/kio-servicemenus/scripts/convert-image.sh"
convert_image_servicemenus_url="https://raw.githubusercontent.com/shvedes/awesome-kde/refs/heads/main/extras/kio-servicemenus/servicemenus/convert-image.desktop"

scripts_dir="$HOME/.local/bin"
servicemenus_dir="${XDG_DATA_HOME:-$HOME/.local/share/kio/servicemenus}/kio/servicemenus"

dependencies=("kdialog" "magick" "wget")
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
mkdir -p "$servicemenus_dir" "$scripts_dir"

echo "==> Copying files"
wget -q -4 "$convert_image_script_url" -O "$scripts_dir/kde-convert-image"
wget -q -4 "$convert_image_servicemenus_url" -O "$servicemenus_dir/kde-convert-image.desktop"

echo "==> Setting things up"
chmod +x "$scripts_dir/kde-convert-image"
chmod +x "$servicemenus_dir/kde-convert-image.desktop"
sed -i "s/username/$(whoami)/" "$servicemenus_dir/kde-convert-image.desktop"

echo "==> Done"
