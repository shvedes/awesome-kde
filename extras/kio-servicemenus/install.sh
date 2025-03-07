#!/usr/bin/env bash

export XDG_DATA_HOME="$HOME/.local/share"

dependencies=("kdialog" "magick" "git")
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
# mkdir -p "$XDG_DATA_HOME/kio/servicemenus"
# mkdir -p "$HOME/.local/bin/kio-servicemenus"

echo "==> Copying files"
