#!/usr/bin/env bash

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
  kwave
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
  kcachegrind kde-dev-scripts
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
SYSTEM_UNITS_CORE=(cups.socket)
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
_section() {
  echo
  echo "${BOLD}${BLUE}$*${RESET}"
  echo "${GRAY}$(printf '─%.0s' {1..60})${RESET}"
}

_spinner_start() {
  # Prints msg and animates a spinner on the same line until _spinner_stop is called.
  local msg="$1"
  _SPINNER_PID=""
  (
    i=0
    chars='|/-\'
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
    kill "$_SPINNER_PID" 2>/dev/null
    wait "$_SPINNER_PID" 2>/dev/null || true
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

# Emit all packages for a category, filtering blanks and comments.
# Handles hyphenated names: games → PACKAGES_GAMES
_get_category_packages() {
  local cat="$1"
  local varname
  varname="PACKAGES_${cat^^}"
  varname="${varname//-/_}"
  local pkgvar="${varname}[@]"
  local pkg
  for pkg in "${!pkgvar}"; do
    [[ -z "$pkg" || "$pkg" == \#* ]] && continue
    printf '%s\n' "$pkg"
  done
}

# Emit every package that would be installed (all selected categories)
_all_selected_packages() {
  local cat
  for cat in "${!SELECTED_CATEGORIES[@]}"; do
    _get_category_packages "$cat"
  done
}

# Print packages in fixed-width columns, wrapping at 60 chars.
# Column width = longest package name + 1 (single-space separator).
# Reads newline-separated package names from stdin.
_print_columns() {
  local -a pkgs=()
  local pkg
  while IFS= read -r pkg; do
    [[ -n "$pkg" ]] && pkgs+=("$pkg")
  done

  [[ ${#pkgs[@]} -eq 0 ]] && return 0

  local max_len=0
  for pkg in "${pkgs[@]}"; do
    [[ ${#pkg} -gt $max_len ]] && max_len=${#pkg}
  done

  local col_width=$((max_len + 1))
  local num_cols=$((60 / col_width))
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

_install_packages() {
  local packages=("$@")
  local to_install=()
  local pkg

  for pkg in "${packages[@]}"; do
    [[ -z "$pkg" || "$pkg" == \#* ]] && continue
    local excluded=false ex
    for ex in "${EXCLUDE_PACKAGES[@]+"${EXCLUDE_PACKAGES[@]}"}"; do
      [[ "$pkg" == "$ex" ]] && excluded=true && break
    done
    $excluded && continue
    to_install+=("$pkg")
  done

  [[ ${#to_install[@]} -eq 0 ]] && return 0

  local total=${#to_install[@]}
  local current=0
  local failed=()

  for pkg in "${to_install[@]}"; do
    current=$((current + 1))
    if [[ "$OPT_DRY_RUN" == true ]]; then
      printf "\r\033[KInstalling ${GRAY}%s${RESET} [%d/%d]" "$pkg" "$current" "$total"
      sleep 0.02
    else
      _spinner_start "Installing ${GRAY}${pkg}${RESET} [${current}/${total}]"
      if ! sudo pacman --noconfirm --needed -S "$pkg" &>/dev/null; then
        failed+=("$pkg")
        _spinner_stop
        printf "${YELLOW}[!!]${RESET}${GRAY}%s${RESET} — package not found or failed to install\n" "$pkg"
      else
        _spinner_stop
      fi
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
      echo "${YELLOW}[dry-run]${RESET} would enable $scope unit: $unit"
    else
      if [[ "$scope" == "user" ]]; then
        systemctl --user enable "$unit" 2>/dev/null &&
          echo "${GREEN}[OK]${RESET} Enabled user unit: ${BLUE}$unit${RESET}" ||
          _warn "Failed to enable user unit: $unit"
      else
        sudo systemctl enable "$unit" 2>/dev/null &&
          echo "${GREEN}[OK]${RESET} Enabled system unit: ${BLUE}$unit${RESET}" ||
          _warn "Failed to enable system unit: $unit"
      fi
    fi
  done
}

_list_categories() {
  echo "${BOLD}Available categories:${RESET}"
  echo
  printf "  ${CYAN}%-15s${RESET} %s\n" "core" "Core KDE libraries, extensions & applications"
  printf "  ${CYAN}%-15s${RESET} %s\n" "graphics" "Image/video editors, color tools, viewers"
  printf "  ${CYAN}%-15s${RESET} %s\n" "office" "Document editors, viewers, productivity tools"
  printf "  ${CYAN}%-15s${RESET} %s\n" "multimedia" "Audio/video players, editors, photo management"
  printf "  ${CYAN}%-15s${RESET} %s\n" "internet" "Browsers, download managers, remote desktop, KDE Connect"
  printf "  ${CYAN}%-15s${RESET} %s\n" "pim" "Personal information management: mail, calendar, contacts"
  printf "  ${CYAN}%-15s${RESET} %s\n" "development" "IDEs, debuggers, compilers, dev tools"
  printf "  ${CYAN}%-15s${RESET} %s\n" "system" "System monitoring, disk management, maintenance"
  printf "  ${CYAN}%-15s${RESET} %s\n" "games" "Games and gaming utilities"
  printf "  ${CYAN}%-15s${RESET} %s\n" "accessibility" "Accessibility tools and assistive technologies"
  printf "  ${CYAN}%-15s${RESET} %s\n" "education" "Educational software and tools"
  printf "  ${CYAN}%-15s${RESET} %s\n" "utilities" "Miscellaneous desktop utilities"
}

# ---------------------------------------------------------------------------
# --show-packages
# ---------------------------------------------------------------------------

_show_packages() {
  local cat
  for cat in "${!SELECTED_CATEGORIES[@]}"; do
    _section "Category: ${CYAN}${cat}${RESET}"
    local pkgs
    pkgs="$(_get_category_packages "$cat" | sort)"
    if [[ -z "$pkgs" ]]; then
      echo "  ${GRAY}(no packages defined yet)${RESET}"
    else
      echo "$pkgs" | _print_columns
    fi
  done
  echo
}

# ---------------------------------------------------------------------------
# --exclude validation
# ---------------------------------------------------------------------------

_validate_excludes() {
  [[ ${#EXCLUDE_PACKAGES[@]} -eq 0 ]] && return 0

  local -A known=()
  local pkg
  while IFS= read -r pkg; do
    known["$pkg"]=1
  done < <(_all_selected_packages)

  local bad=()
  for pkg in "${EXCLUDE_PACKAGES[@]}"; do
    if [[ -z "${known[$pkg]+_}" ]]; then
      bad+=("$pkg")
    fi
  done

  if [[ ${#bad[@]} -gt 0 ]]; then
    _warn "The following packages passed to --exclude do not appear in the selected categories:"
    for pkg in "${bad[@]}"; do
      echo "${RED}[!!]${RESET}  ${GRAY}${pkg}${RESET}"
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
  cat <<EOF
${BOLD}Usage:${RESET}
  ${0##*/} --category <CAT...> [OPTIONS]
  ${0##*/} --all [OPTIONS]

${BOLD}Description:${RESET}
  Installs KDE components for Arch Linux. Use --category to select
  which groups to install, including ${BOLD}core${RESET} for the base KDE set.

${BOLD}Options:${RESET}
  ${CYAN}-h, --help${RESET}                       Show this help message and exit
  ${CYAN}-a, --all${RESET}                        Install core + all categories
  ${CYAN}-y, --yes${RESET}                        Skip confirmation prompts (assume yes)
  ${CYAN}-n, --dry-run${RESET}                    Simulate installation without making changes
  ${CYAN}    --no-units${RESET}                   Skip enabling systemd units
  ${CYAN}-l, --list${RESET}                       List available categories and exit
  ${CYAN}    --category CAT [CAT...]${RESET}      Select one or more categories to install
  ${CYAN}    --show-packages${RESET}              Print packages for the selected categories and exit
  ${CYAN}    --exclude PKG [PKG...]${RESET}       Exclude one or more packages from installation

${BOLD}Categories:${RESET}
  ${BOLD}${YELLOW}core${RESET}          Core KDE libraries, extensions & applications
  ${BOLD}${YELLOW}graphics${RESET}      Image/video editors, color tools, viewers
  ${BOLD}${YELLOW}office${RESET}        Document editors, viewers, productivity tools
  ${BOLD}${YELLOW}multimedia${RESET}    Audio/video players, editors, photo management
  ${BOLD}${YELLOW}internet${RESET}      Browsers, download managers, remote desktop, KDE Connect
  ${BOLD}${YELLOW}pim${RESET}           Personal information management: mail, calendar, contacts
  ${BOLD}${YELLOW}development${RESET}   IDEs, debuggers, compilers, dev tools
  ${BOLD}${YELLOW}system${RESET}        System monitoring, disk management, maintenance
  ${BOLD}${YELLOW}games${RESET}         Games and gaming utilities
  ${BOLD}${YELLOW}accessibility${RESET} Accessibility tools and assistive technologies
  ${BOLD}${YELLOW}education${RESET}     Educational software and tools
  ${BOLD}${YELLOW}utilities${RESET}     Miscellaneous desktop utilities

${BOLD}Examples:${RESET}
  ${0##*/} --category office multimedia
  ${0##*/} --all
  ${0##*/} --dry-run --all
  ${0##*/} -y --category development system
  ${0##*/} --show-packages --category internet
  ${0##*/} --exclude falkon --category internet
  ${0##*/} --exclude falkon konqueror --category internet pim

EOF
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
      _die "Unknown option: $1  (try --help)"
      ;;
    *)
      _die "Unknown argument: '$1'. Use --category to select categories, or --help for usage."
      ;;
    esac
    shift
  done

  if [[ "$OPT_ALL" == true ]]; then
    local cat
    for cat in core graphics office multimedia internet pim development system games accessibility education utilities; do
      _select_category "$cat"
    done
  fi
}

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------

_print_summary() {
  local -a all_pkgs
  mapfile -t all_pkgs < <(_all_selected_packages)
  local total=${#all_pkgs[@]}
  local num_cats=${#SELECTED_CATEGORIES[@]}
  local cat_label
  [[ $num_cats -eq 1 ]] && cat_label="category" || cat_label="categories"
  local cat_list="${!SELECTED_CATEGORIES[*]}"

  _section "Ready to install"
  echo "${BOLD}${total}${RESET} packages across ${BOLD}${num_cats}${RESET} ${cat_label}: ${CYAN}${cat_list}${RESET}"

  if [[ ${#EXCLUDE_PACKAGES[@]} -gt 0 ]]; then
    local num_ex=${#EXCLUDE_PACKAGES[@]}
    local ex_label
    [[ $num_ex -eq 1 ]] && ex_label="package" || ex_label="packages"
    echo "Excluding ${BOLD}${num_ex}${RESET} ${ex_label}: ${GRAY}${EXCLUDE_PACKAGES[*]}${RESET}"
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
  if ! command -v pacman &>/dev/null; then
    _die "pacman not found. Only Arch Linux (and derivatives) are supported."
  fi

  if ! sudo -n true 2>/dev/null && [[ "$OPT_DRY_RUN" == false ]]; then
    _warn "This script requires sudo privileges. You may be prompted for your password."
  fi
}

_detect_extras() {
  local chassis
  chassis="$(hostnamectl chassis 2>/dev/null || true)"

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
    _spinner_start "  Syncing mirrors"
    sudo pacman -Sy --noconfirm &>/dev/null
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

  # --show-packages: display only, silently ignore --exclude / -y / --no-units
  if [[ "$OPT_SHOW_PACKAGES" == true ]]; then
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
