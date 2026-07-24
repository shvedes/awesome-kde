#!/usr/bin/env bash

# shellcheck disable=SC2034
# Rationale: the PACKAGES_* and SYSTEM_UNITS_*/USER_UNITS_* arrays below are
# all read via indirect expansion (e.g. varname="PACKAGES_${cat^^}"; "${!varname}[@]"
# in _get_category_packages / _run_install). shellcheck can't follow indirect
# name-based lookups, so it flags every one of these as unused. They aren't.

set -euo pipefail

RED=$'\e[0;31m'
YELLOW=$'\e[0;33m'
BLUE=$'\e[0;34m'
PURPLE=$'\e[0;35m'
GREEN=$'\e[0;32m'
CYAN=$'\e[0;36m'
GRAY=$'\e[90m'
BOLD=$'\e[1m'
RESET=$'\e[0m'

# Target line width for all wrapped/bordered output (section rules, package
# columns, summary table). Kept as one constant so every visual element in
# the script stays consistent with a standard 80-column terminal.
LINE_WIDTH=80

# Canonical category order — single source of truth for iteration order
# (used by --all expansion and the summary table), so output is always in
# the same, predictable order regardless of associative-array hash order.
ALL_CATEGORIES=(
  core graphics office multimedia internet pim
  development system games accessibility education utilities
)

trap '_on_exit $?' EXIT
trap 'echo; echo -e "${RED}Interrupted.${RESET}"; exit 130' INT TERM HUP

# ---------------------------------------------------------------------------
# Package lists
# ---------------------------------------------------------------------------

PACKAGES_CORE=(
  plasma svgpart markdownpart kio kio-extras kio-admin
  kio-fuse kio-gdrive kio-zeroconf
  orca cryfs gocryptfs ripgrep ripgrep-all
  hunspell-en_us sshfs qt6-tools kcron
  dolphin-plugins kup bup rsync cups
  system-config-printer keditbookmarks
  qt5-imageformats qt6-imageformats
  kdegraphics-mobipocket kimageformats
  colord-kde ffmpegthumbs
  kdegraphics-thumbnailers
  kdesdk-thumbnailers
  imath jxrlib karchive
  libavif libheif libjxl
  libraw openjpeg2 icoutils
  kdenetwork-filesharing
  purpose fwupd plocate
  mediainfo libvncserver
  freerdp libssh arj lrzip
  lzop 7zip unarchiver unrar
  zip cpio unarj unace
  faac flac lame vorbis-tools
  dosfstools jfsutils f2fs-tools
  btrfs-progs exfatprogs ntfs-3g
  udftools xfsprogs nilfs-utils
  gpart mtools kdnssd kplotting
  syndication taglib kunifiedpush
  power-profiles-daemon
  sshfs krdc krdp krfb
  # applications
  konsole dolphin
  kate kcalc kfind
  gwenview ark
)

PACKAGES_GRAPHICS=(
  kdenlive
  kamera kcolorchooser
  kgraphviewer kimagemapeditor
)

PACKAGES_OFFICE=(
  # libreoffice-fresh
  okular calligra arianna
  ghostscript tesseract
  tesseract-data-eng
  skanpage skanlite
  kile
)

PACKAGES_MULTIMEDIA=(
  audex audiocd-kio
  digikam kasts
  kamoso kwave
  telly-skout
  dragon juk
  plasmatube
  koko kmix
  audiotube
)

PACKAGES_INTERNET=(
  kdeconnect
  tokodon kget
  ktorrent falkon
  alligator angelfish
  konqueror konversation
  neochat signon-kwallet-extension
)

PACKAGES_PIM=(
  akonadi-calendar-tools
  akonadi-import-wizard
  grantlee-editor
  akonadiconsole
  kwalletmanager
  akregator
  itinerary
  kaddressbook
  kalarm
  kdepim-addons
  kleopatra
  kmail
  kmail-account-wizard
  kontact
  korganizer
  mbox-importer
  merkuro
  pim-data-exporter
  pim-sieve-editor
  zanshin
)

PACKAGES_DEVELOPMENT=(
  kdevelop kdevelop-php
  kdevelop-python kompare
  umbrello kcachegrind
  massif-visualizer git
  heaptrack clang
  cmake extra-cmake-modules
  gdb kapptemplate
  kde-dev-scripts
  kde-dev-utils kdesdk-kio
  kdesdk-thumbnailers kirigami-gallery
  lokalize poxml
  kdebugsettings
)

PACKAGES_SYSTEM=(
  partitionmanager
  filelight
  isoimagewriter
  ksystemlog
  kgpg
  kdf
  kjournald
  systemdgenie
)

PACKAGES_GAMES=(
  bomber bovo granatier
  kajongg kapman katomic
  kblackbox kblocks kbounce
  kbreakout kdiamond kfourinline
  kgoldrunner kigo killbots
  kiriki kjumpingcube klickety
  klines kmahjongg kmines
  knavalbattle knetwalk knights
  kolf kollision konquest
  kpat kreversi kshisen
  ksirk ksnakeduel kspaceduel
  ksquares ksudoku ktuberling
  kubrick lskat palapeli
  picmi skladnik
)

PACKAGES_ACCESSIBILITY=(
  accessibility-inspector
  kmousetool kmouth
)

PACKAGES_EDUCATION=(
  artikulate blinken cantor
  kalgebra kalzium kanagram
  kbruch kgeography khangman
  kig kiten klettres
  kmplot ktouch kturtle
  kwordquiz marble minuet
  parley rocs step
)

PACKAGES_UTILITIES=(
  kontrast francis
  qrca kcharselect
  keysmith sweeper
)

# systemd units — parallel to PACKAGES_* arrays; empty arrays are skipped automatically.
#
# These lists are intentionally short. Audited against every package above:
# almost everything here is either a GUI app with no daemon, activated on
# demand via D-Bus with no enable step possible (e.g. fwupd.service and
# colord ship no [Install] section — `systemctl enable` on them just fails),
# or autostarted through Plasma's own systemd-session integration rather
# than a unit the package itself installs (kdeconnect, krfb ship no .service
# at all). Arch also does not run `systemctl preset` on install by default
# (no such pacman hook exists out of the box), so nothing here is enabled
# automatically behind our back — anything we want running has to be listed
# explicitly, and anything not listed here genuinely doesn't need to be.
SYSTEM_UNITS_CORE=(cups.socket power-profiles-daemon.service)
USER_UNITS_CORE=(app-org.kde.krdpserver.service)
SYSTEM_UNITS_GRAPHICS=()
USER_UNITS_GRAPHICS=()
SYSTEM_UNITS_OFFICE=()
USER_UNITS_OFFICE=()
SYSTEM_UNITS_MULTIMEDIA=()
USER_UNITS_MULTIMEDIA=()
SYSTEM_UNITS_INTERNET=()
USER_UNITS_INTERNET=()
SYSTEM_UNITS_PIM=()
USER_UNITS_PIM=()
SYSTEM_UNITS_DEVELOPMENT=()
USER_UNITS_DEVELOPMENT=()
SYSTEM_UNITS_SYSTEM=()
USER_UNITS_SYSTEM=()
SYSTEM_UNITS_GAMES=()
USER_UNITS_GAMES=()
SYSTEM_UNITS_ACCESSIBILITY=()
USER_UNITS_ACCESSIBILITY=()
SYSTEM_UNITS_EDUCATION=()
USER_UNITS_EDUCATION=()
SYSTEM_UNITS_UTILITIES=()
USER_UNITS_UTILITIES=()

# ---------------------------------------------------------------------------
# State
# ---------------------------------------------------------------------------

declare -A SELECTED_CATEGORIES
NUM_CATEGORIES=0 # plain integer — avoids set -e + empty assoc-array expansion bugs
OPT_ALL=false
OPT_CATEGORY_EXPLICIT=false # true once --category has selected at least one category
OPT_YES=false
OPT_DRY_RUN=false
OPT_NO_UNITS=false
OPT_SHOW_PACKAGES=false
EXCLUDE_PACKAGES=()
_SPINNER_PID=""

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------

_on_exit() {
  local code=${1:-0}
  if [[ $code -ne 0 && $code -ne 130 ]]; then
    echo "${RED}Script exited unexpectedly (exit code $code).${RESET}" >&2
  fi
}

_die() {
  echo "${RED}Error:${RESET} $*" >&2
  exit 1
}

_info() { echo "${CYAN}=>${RESET} $*"; }
_success() { echo "${GREEN}[OK]${RESET} $*"; }
_warn() { echo "${YELLOW}Warning:${RESET} $*" >&2; }

# Draw a horizontal rule of the given width (default $LINE_WIDTH) using only
# bash builtins — no external `tr`/`seq` process per call.
_hr() {
  local width="${1:-$LINE_WIDTH}"
  local char="${2:-=}"
  local bar
  printf -v bar '%*s' "$width" ''
  printf '%s' "${bar// /$char}"
}

_section() {
  echo
  echo "${BOLD}${BLUE}$*${RESET}"
  echo "${GRAY}$(_hr)${RESET}"
}

_spinner_start() {
  # Prints msg and animates a spinner on the same line until _spinner_stop is called.
  local msg="$1"
  _SPINNER_PID=""
  (
    i=0
    chars='\|/-'
    while true; do
      printf "\r\033[K%s %s" "$msg" "${chars:$((i % 4)):1}"
      i=$((i + 1))
      sleep 0.1
    done
  ) &
  _SPINNER_PID=$!
}

_spinner_stop() {
  if [[ -n "${_SPINNER_PID:-}" ]]; then
    kill "$_SPINNER_PID" 2> /dev/null
    wait "$_SPINNER_PID" 2> /dev/null || true
    _SPINNER_PID=""
    printf "\r\033[K"
  fi
}

_ask_yes_no() {
  local default="${1:-Y}"
  local message="$2"
  local input hint

  default="${default^^}"
  case "$default" in
    Y) hint="(Y/n)" ;;
    N) hint="(y/N)" ;;
    *)
      hint="(Y/n)"
      default="Y"
      ;;
  esac

  while true; do
    printf "%s %s: " "$message" "$hint"
    read -r input
    [[ -z "$input" ]] && input="$default"
    case "$input" in
      [Yy][Ee][Ss] | [Yy]) return 0 ;;
      [Nn][Oo] | [Nn]) return 1 ;;
      *)
        printf "\r\e[K"
        ;;
    esac
  done
}

# Safe counter increment — avoids the set -e trap where ((x++)) returns 1 when x==0.
_select_category() {
  local cat="$1"
  if [[ -z "${SELECTED_CATEGORIES[$cat]+_}" ]]; then
    SELECTED_CATEGORIES["$cat"]=1
    NUM_CATEGORIES=$((NUM_CATEGORIES + 1))
  fi
}

# ---------------------------------------------------------------------------
# Package helpers
# ---------------------------------------------------------------------------

# Fill out_arr (nameref, second arg) with all packages for a category,
# filtering blanks and comments. Handles hyphenated names: games -> PACKAGES_GAMES
_get_category_packages() {
  local cat="$1"
  local -n _gcp_out="$2"
  local varname
  varname="PACKAGES_${cat^^}"
  varname="${varname//-/_}"
  local pkgvar="${varname}[@]"
  local pkg
  _gcp_out=()
  for pkg in "${!pkgvar}"; do
    [[ -z "$pkg" || "$pkg" == \#* ]] && continue
    _gcp_out+=("$pkg")
  done
}

# Fill out_arr (nameref, first arg) with every package that would be
# installed (all selected categories).
# Note: the same package can legitimately appear under more than one category
# (e.g. kdesdk-thumbnailers under both core and development) — categories are
# meant to be installable independently, so each one carries its own runtime
# deps rather than assuming another category is also selected. Duplicates
# across categories are intentional; pacman's --needed flag makes them a
# no-op at install time.
_all_selected_packages() {
  local -n _asp_out="$1"
  local cat
  local -a cat_pkgs
  _asp_out=()
  for cat in "${!SELECTED_CATEGORIES[@]}"; do
    _get_category_packages "$cat" cat_pkgs
    _asp_out+=("${cat_pkgs[@]}")
  done
}

# Pure-bash insertion sort, in place (nameref, first arg). Package list
# sizes here are small (tens of entries), so O(n^2) is fine and it avoids
# spawning an external sort process.
_bsort() {
  local -n _bsort_arr="$1"
  local i j key
  for ((i = 1; i < ${#_bsort_arr[@]}; i++)); do
    key="${_bsort_arr[i]}"
    j=$((i - 1))
    while ((j >= 0)) && [[ "${_bsort_arr[j]}" > "$key" ]]; do
      _bsort_arr[j + 1]="${_bsort_arr[j]}"
      j=$((j - 1))
    done
    _bsort_arr[j + 1]="$key"
  done
}

# Print packages in fixed-width columns, wrapping at LINE_WIDTH chars.
# Column width = longest package name + 1 (single-space separator).
# Takes package names as positional args.
_print_columns() {
  local -a pkgs=("$@")

  [[ ${#pkgs[@]} -eq 0 ]] && return 0

  local max_len=0
  for pkg in "${pkgs[@]}"; do
    [[ ${#pkg} -gt $max_len ]] && max_len=${#pkg}
  done

  local col_width=$((max_len + 1))
  local num_cols=$((LINE_WIDTH / col_width))
  [[ $num_cols -lt 1 ]] && num_cols=1

  local col=0
  for pkg in "${pkgs[@]}"; do
    if [[ $col -eq $((num_cols - 1)) ]]; then
      # Last column in the row: no trailing padding, just a newline
      printf '%s\n' "$pkg"
      col=0
    else
      printf "%-*s" "$col_width" "$pkg"
      col=$((col + 1))
    fi
  done

  # If the last row was incomplete, close it
  if [[ $col -gt 0 ]]; then
    printf '\n'
  fi
}

_is_excluded() {
  local pkg="$1" ex
  for ex in "${EXCLUDE_PACKAGES[@]+"${EXCLUDE_PACKAGES[@]}"}"; do
    [[ "$pkg" == "$ex" ]] && return 0
  done
  return 1
}

_install_packages() {
  local packages=("$@")
  local to_install=()
  local pkg

  for pkg in "${packages[@]}"; do
    [[ -z "$pkg" || "$pkg" == \#* ]] && continue
    _is_excluded "$pkg" && continue
    to_install+=("$pkg")
  done

  [[ ${#to_install[@]} -eq 0 ]] && return 0

  local total=${#to_install[@]}

  if [[ "$OPT_DRY_RUN" == true ]]; then
    local current=0
    for pkg in "${to_install[@]}"; do
      current=$((current + 1))
      printf "\r\033[KInstalling ${GRAY}%s${RESET} [%d/%d]" "$pkg" "$current" "$total"
      sleep 0.02
    done
    printf "\r\033[K"
    return 0
  fi

  # Try the whole category as a single pacman transaction first. This lets
  # pacman resolve dependencies for the whole set together (faster, and
  # avoids repeated separate resolutions for shared deps) instead of the
  # old one-package-per-invocation loop.
  _spinner_start "Installing ${total} packages"
  if sudo pacman --noconfirm --needed -S "${to_install[@]}" &> /dev/null; then
    _spinner_stop
    return 0
  fi
  _spinner_stop
  _warn "Batched install failed — falling back to one-by-one to isolate the problem package(s)."

  local current=0
  local failed=()
  for pkg in "${to_install[@]}"; do
    current=$((current + 1))
    _spinner_start "Installing ${GRAY}${pkg}${RESET} [${current}/${total}]"
    if ! sudo pacman --noconfirm --needed -S "$pkg" &> /dev/null; then
      failed+=("$pkg")
      _spinner_stop
      printf "${YELLOW}[!!]${RESET}${GRAY}%s${RESET} — package not found or failed to install\n" "$pkg"
    else
      _spinner_stop
    fi
  done
  printf "\r\033[K"

  if [[ ${#failed[@]} -gt 0 ]]; then
    _warn "The following packages could not be installed: ${failed[*]}"
  fi
}

_enable_units() {
  local scope="$1" # "system" or "user"
  shift
  local units=("$@")
  local unit

  for unit in "${units[@]}"; do
    [[ -z "$unit" ]] && continue
    if [[ "$OPT_DRY_RUN" == true ]]; then
      echo "${YELLOW}[dry-run]${RESET} Would enable $scope unit: $unit"
    else
      if [[ "$scope" == "user" ]]; then
        if systemctl --user enable "$unit" 2> /dev/null; then
          echo "${GREEN}[OK]${RESET} Enabled user unit: ${BLUE}$unit${RESET}"
        else
          _warn "Failed to enable user unit: $unit"
        fi
      else
        if sudo systemctl enable "$unit" 2> /dev/null; then
          echo "${GREEN}[OK]${RESET} Enabled system unit: ${BLUE}$unit${RESET}"
        else
          _warn "Failed to enable system unit: $unit"
        fi
      fi
    fi
  done
}

_list_categories() {
  echo "${BOLD}Available categories:${RESET}"
  echo
  printf " ${CYAN}%-15s${RESET} %s\n" "core" "Core KDE libraries, extensions & applications"
  printf " ${CYAN}%-15s${RESET} %s\n" "graphics" "Image/video editors, color tools, viewers"
  printf " ${CYAN}%-15s${RESET} %s\n" "office" "Document editors, viewers, productivity tools"
  printf " ${CYAN}%-15s${RESET} %s\n" "multimedia" "Audio/video players, editors, photo management"
  printf " ${CYAN}%-15s${RESET} %s\n" "internet" "Browsers, download managers, remote desktop, KDE Connect"
  printf " ${CYAN}%-15s${RESET} %s\n" "pim" "Personal information management: mail, calendar, contacts"
  printf " ${CYAN}%-15s${RESET} %s\n" "development" "IDEs, debuggers, compilers, dev tools"
  printf " ${CYAN}%-15s${RESET} %s\n" "system" "System monitoring, disk management, maintenance"
  printf " ${CYAN}%-15s${RESET} %s\n" "games" "Games and gaming utilities"
  printf " ${CYAN}%-15s${RESET} %s\n" "accessibility" "Accessibility tools and assistive technologies"
  printf " ${CYAN}%-15s${RESET} %s\n" "education" "Educational software and tools"
  printf " ${CYAN}%-15s${RESET} %s\n" "utilities" "Miscellaneous desktop utilities"
}

# ---------------------------------------------------------------------------
# --show-packages
# ---------------------------------------------------------------------------

_show_packages() {
  local cat
  for cat in "${ALL_CATEGORIES[@]}"; do
    [[ -z "${SELECTED_CATEGORIES[$cat]+_}" ]] && continue
    _section "Category: ${CYAN}${cat}${RESET}"
    local pkg
    local -a cat_pkgs shown=()
    local excluded_count=0
    _get_category_packages "$cat" cat_pkgs
    _bsort cat_pkgs
    for pkg in "${cat_pkgs[@]}"; do
      if _is_excluded "$pkg"; then
        excluded_count=$((excluded_count + 1))
      else
        shown+=("$pkg")
      fi
    done

    if [[ ${#shown[@]} -eq 0 ]]; then
      echo " ${GRAY}(no packages defined yet)${RESET}"
    else
      _print_columns "${shown[@]}"
    fi
    [[ $excluded_count -gt 0 ]] && echo " ${GRAY}(${excluded_count} excluded, not shown)${RESET}"
  done
  echo
}

# ---------------------------------------------------------------------------
# --exclude validation
# ---------------------------------------------------------------------------

_validate_excludes() {
  [[ ${#EXCLUDE_PACKAGES[@]} -eq 0 ]] && return 0

  local -A known=()
  local -a all_pkgs
  local pkg
  _all_selected_packages all_pkgs
  for pkg in "${all_pkgs[@]}"; do
    known["$pkg"]=1
  done

  local bad=()
  for pkg in "${EXCLUDE_PACKAGES[@]}"; do
    if [[ -z "${known[$pkg]+_}" ]]; then
      bad+=("$pkg")
    fi
  done

  if [[ ${#bad[@]} -gt 0 ]]; then
    _warn "The following packages passed to --exclude do not appear in the selected categories:"
    for pkg in "${bad[@]}"; do
      echo "${RED}[!!]${RESET} ${GRAY}${pkg}${RESET}"
    done
    echo
    echo "Run ${CYAN}${0##*/} --show-packages --category <CAT>${RESET} to see valid package names."
    exit 1
  fi
}

# ---------------------------------------------------------------------------
# Help
# ---------------------------------------------------------------------------

_show_help() {
  # Capture the heredoc into a variable with the `read` builtin instead of
  # piping it through an external `cat` process. `read -d ''` reads until
  # EOF and returns non-zero since it never finds its delimiter, so guard
  # it with `|| true` to keep `set -e` happy; the variable is still filled.
  local help_text
  read -r -d '' help_text << EOF || true
${BOLD}Usage:${RESET}
  ${0##*/} --category <CAT...> [OPTIONS]
  ${0##*/} --all [OPTIONS]

${BOLD}Description:${RESET}
  Installs KDE components for Arch Linux. Use --category to select
  which groups to install, including ${BOLD}core${RESET} for the base KDE set.
  ${CYAN}-a/--all${RESET} and ${CYAN}--category${RESET} are mutually exclusive: --all already
  means every category, so combining it with --category is rejected
  rather than silently picking one.

${BOLD}Options:${RESET}
  ${CYAN}-h, --help${RESET}                  Show this help message and exit
  ${CYAN}-a, --all${RESET}                   Install core + all categories
  ${CYAN}-y, --yes${RESET}                   Skip confirmation prompts (assume yes)
  ${CYAN}-n, --dry-run${RESET}               Simulate installation without making changes
  ${CYAN}    --no-units${RESET}              Skip enabling systemd units
  ${CYAN}-l, --list${RESET}                  List available categories and exit
  ${CYAN}    --category CAT [CAT...]${RESET} Select one or more categories to install
  ${CYAN}    --show-packages${RESET}         Print packages for the selected categories and exit
  ${CYAN}    --exclude PKG [PKG...]${RESET}  Exclude one or more packages from installation

${BOLD}Categories:${RESET}
  ${BOLD}${YELLOW}core${RESET}           Core KDE libraries, extensions & applications
  ${BOLD}${YELLOW}graphics${RESET}       Image/video editors, color tools, viewers
  ${BOLD}${YELLOW}office${RESET}         Document editors, viewers, productivity tools
  ${BOLD}${YELLOW}multimedia${RESET}     Audio/video players, editors, photo management
  ${BOLD}${YELLOW}internet${RESET}       Browsers, download managers, remote desktop, KDE Connect
  ${BOLD}${YELLOW}pim${RESET}            Personal information management: mail, calendar, contacts
  ${BOLD}${YELLOW}development${RESET}    IDEs, debuggers, compilers, dev tools
  ${BOLD}${YELLOW}system${RESET}         System monitoring, disk management, maintenance
  ${BOLD}${YELLOW}games${RESET}          Games and gaming utilities
  ${BOLD}${YELLOW}accessibility${RESET}  Accessibility tools and assistive technologies
  ${BOLD}${YELLOW}education${RESET}      Educational software and tools
  ${BOLD}${YELLOW}utilities${RESET}      Miscellaneous desktop utilities

${BOLD}Examples:${RESET}
  ${0##*/} --category office multimedia
  ${0##*/} --all
  ${0##*/} --dry-run --all
  ${0##*/} -y --category development system
  ${0##*/} --show-packages --category internet
  ${0##*/} --exclude falkon --category internet
  ${0##*/} --exclude falkon konqueror --category internet pim
EOF
  printf '%s\n' "$help_text"
}

# ---------------------------------------------------------------------------
# Argument parsing
# ---------------------------------------------------------------------------

# All valid category names in one place — keep in sync with package arrays and --list.
_valid_categories='core|graphics|office|multimedia|internet|pim|development|system|games|accessibility|education|utilities'

_is_category() {
  local val="$1"
  case "$val" in
    core | graphics | office | multimedia | internet | pim | development | system | games | accessibility | education | utilities)
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

_parse_args() {
  while [[ $# -gt 0 ]]; do
    case "$1" in
      -h | --help)
        _show_help
        exit 0
        ;;
      -l | --list)
        _list_categories
        exit 0
        ;;
      -a | --all)
        OPT_ALL=true
        ;;
      -y | --yes)
        OPT_YES=true
        ;;
      -n | --dry-run)
        OPT_DRY_RUN=true
        ;;
      --no-units)
        OPT_NO_UNITS=true
        ;;
      --show-packages)
        OPT_SHOW_PACKAGES=true
        ;;
      --category)
        [[ $# -lt 2 ]] && _die "--category requires at least one category name."
        shift
        local _cat_consumed=0
        while [[ $# -gt 0 && ! "$1" =~ ^- ]]; do
          if _is_category "$1"; then
            _select_category "$1"
            _cat_consumed=$((_cat_consumed + 1))
            OPT_CATEGORY_EXPLICIT=true
            shift
          else
            _die "Unknown category '$1'. Run '${0##*/} --list' for valid categories."
          fi
        done
        [[ $_cat_consumed -eq 0 ]] && _die "--category requires at least one valid category name."
        continue
        ;;
      --exclude)
        [[ $# -lt 2 ]] && _die "--exclude requires at least one package name."
        shift
        while [[ $# -gt 0 && ! "$1" =~ ^- ]]; do
          _is_category "$1" && break
          EXCLUDE_PACKAGES+=("$1")
          shift
        done
        [[ ${#EXCLUDE_PACKAGES[@]} -eq 0 ]] && _die "--exclude requires at least one package name."
        continue
        ;;
      -*)
        _die "Unknown option: $1 (try --help)"
        ;;
      *)
        _die "Unknown argument: '$1'. Use --category to select categories, or --help for usage."
        ;;
    esac
    shift
  done

  if [[ "$OPT_ALL" == true && "$OPT_CATEGORY_EXPLICIT" == true ]]; then
    _die "-a/--all already selects every category; combining it with --category is not allowed. Use one or the other."
  fi

  if [[ "$OPT_ALL" == true ]]; then
    local cat
    for cat in "${ALL_CATEGORIES[@]}"; do
      _select_category "$cat"
    done
  fi
}

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------

_print_summary() {
  # A plain comma/space-joined category list (the old approach) can blow
  # well past 80 chars with -a or a handful of --category names. A table
  # keeps every line short regardless of how many categories are selected.
  local cat count total=0
  local -a rows=() cat_pkgs kept
  local name_width=8 # floor: length of the "CATEGORY" header itself

  for cat in "${ALL_CATEGORIES[@]}"; do
    [[ -z "${SELECTED_CATEGORIES[$cat]+_}" ]] && continue
    _get_category_packages "$cat" cat_pkgs
    kept=()
    local pkg
    for pkg in "${cat_pkgs[@]}"; do
      _is_excluded "$pkg" && continue
      kept+=("$pkg")
    done
    count=${#kept[@]}
    total=$((total + count))
    rows+=("${cat}:${count}")
    [[ ${#cat} -gt $name_width ]] && name_width=${#cat}
  done

  local num_cats=${#SELECTED_CATEGORIES[@]}
  local cat_label
  [[ $num_cats -eq 1 ]] && cat_label="category" || cat_label="categories"
  local table_width=$((name_width + 11)) # " %-*s  %8s" => 1 + name + 2 + 8

  _section "Ready to install"
  printf " ${BOLD}%-*s${RESET}  %8s\n" "$name_width" "CATEGORY" "PACKAGES"
  echo "${GRAY}$(_hr "$table_width")${RESET}"

  local row name cnt
  for row in "${rows[@]}"; do
    name="${row%%:*}"
    cnt="${row##*:}"
    printf " %-*s  %8s\n" "$name_width" "$name" "$cnt"
  done

  echo "${GRAY}$(_hr "$table_width")${RESET}"
  printf " ${BOLD}%-*s  %8s${RESET}\n" "$name_width" "TOTAL" "$total"
  echo
  echo "${total} packages across ${num_cats} ${cat_label}."

  if [[ ${#EXCLUDE_PACKAGES[@]} -gt 0 ]]; then
    local num_ex=${#EXCLUDE_PACKAGES[@]}
    local ex_label
    [[ $num_ex -eq 1 ]] && ex_label="package" || ex_label="packages"
    echo
    echo "${BOLD}Excluding ${num_ex}${RESET} ${ex_label}:"
    local -a sorted_excludes=("${EXCLUDE_PACKAGES[@]}")
    _bsort sorted_excludes
    _print_columns "${sorted_excludes[@]}"
  fi

  if [[ "$OPT_DRY_RUN" == true ]]; then
    echo
    echo "${YELLOW}Dry-run mode — no changes will be made.${RESET}"
  fi
  echo
}

# ---------------------------------------------------------------------------
# Sanity checks
# ---------------------------------------------------------------------------

_check_requirements() {
  if ! command -v pacman &> /dev/null; then
    _die "pacman not found. Only Arch Linux (and derivatives) are supported."
  fi

  if ! sudo -n true 2> /dev/null && [[ "$OPT_DRY_RUN" == false ]]; then
    _warn "This script requires sudo privileges. You may be prompted for your password."
  fi
}

_detect_extras() {
  local chassis
  chassis="$(hostnamectl chassis 2> /dev/null || true)"
  if [[ "$chassis" =~ ^(convertible|tablet)$ ]]; then
    _info "Detected $chassis form factor — adding iio-sensor-proxy for auto screen rotation."
    PACKAGES_CORE+=(iio-sensor-proxy)
  fi
}

# ---------------------------------------------------------------------------
# Main installation
# ---------------------------------------------------------------------------

_run_install() {
  if [[ "$OPT_DRY_RUN" == false ]]; then
    _section "Refreshing package databases"
    # Arch's own guidance: never run a bare `-Sy` (sync without upgrade).
    # It desyncs installed packages from the freshly-synced repo metadata,
    # which is exactly how partial-upgrade breakage happens. `-Syu` keeps
    # the system consistent before we layer new packages on top.
    _spinner_start " Syncing mirrors and upgrading system"
    sudo pacman -Syu --noconfirm &> /dev/null
    _spinner_stop
    _success "Done."
  fi

  local cat varname pkgvar sys_units_var usr_units_var
  local -a sys_units usr_units

  for cat in "${!SELECTED_CATEGORIES[@]}"; do
    _section "Installing category: ${CYAN}${cat}${RESET}"
    varname="PACKAGES_${cat^^}"
    varname="${varname//-/_}"
    pkgvar="${varname}[@]"
    _install_packages "${!pkgvar}"
    _success "Category '${cat}' installed."

    if [[ "$OPT_NO_UNITS" == false ]]; then
      sys_units_var="SYSTEM_UNITS_${cat^^}[@]"
      usr_units_var="USER_UNITS_${cat^^}[@]"
      sys_units=(${!sys_units_var+"${!sys_units_var}"})
      usr_units=(${!usr_units_var+"${!usr_units_var}"})
      [[ ${#sys_units[@]} -gt 0 ]] && _enable_units system "${sys_units[@]}"
      [[ ${#usr_units[@]} -gt 0 ]] && _enable_units user "${usr_units[@]}"
    fi
  done

  if [[ "$OPT_NO_UNITS" == true ]]; then
    _warn "Skipping systemd unit activation (--no-units was set)."
  fi

  _success "All done! Enjoy your KDE setup."
  echo
}

# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

main() {
  # No arguments at all → help
  [[ $# -eq 0 ]] && {
    _show_help
    exit 0
  }

  _parse_args "$@"

  # --category is mandatory (--all counts as providing categories)
  if [[ $NUM_CATEGORIES -eq 0 ]]; then
    _die "--category is required. Run '${0##*/} --list' for available categories."
  fi

  # --show-packages: display only. -y/--no-units affect the install step,
  # which never runs in this mode, so warn rather than silently no-op them.
  # --exclude, on the other hand, DOES apply here — the listing reflects
  # what would actually be installed.
  if [[ "$OPT_SHOW_PACKAGES" == true ]]; then
    if [[ "$OPT_YES" == true || "$OPT_NO_UNITS" == true ]]; then
      _warn "--show-packages only prints package information; -y/--no-units have no effect here."
    fi
    _detect_extras
    _validate_excludes
    _show_packages
    exit 0
  fi

  _check_requirements
  _detect_extras
  _validate_excludes
  _print_summary

  if [[ "$OPT_YES" == false ]]; then
    if ! _ask_yes_no N "Proceed with installation?"; then
      echo "Aborted."
      exit 0
    fi
  fi

  if [[ "$OPT_DRY_RUN" == false ]]; then
    sudo -v || _die "sudo authentication failed."
  fi

  _run_install
}

main "$@"
