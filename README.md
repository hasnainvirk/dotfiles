# dotfiles
These are my personal dotfiles to setup a build env the way I want. This particular 
arrangement uses i3-gaps, polybar, zsh, p10k theme for zsh, vscode, prospect-mail, 
chromium and many other tools to prepare a powerful workstation environment.

## Initial step
```sh
sudo apt update
sudo apt upgrade
```

## Install useful dev tools
```sh
sudo apt install --no-install-recommends git gitk cmake ninja-build gperf \
  ccache dfu-util device-tree-compiler wget \
  python3-dev python3-pip python3-setuptools python3-tk python3-wheel xz-utils file \
  make gcc gcc-multilib g++-multilib libsdl2-dev
```
## Installing i3-gaps dependencies

```sh
$ sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool libxcb-shape0-dev 
```

## Installing i3-gaps
 Add the PPA rather than building from source.
```sh
sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt-get update
sudo apt install i3-gaps
```

## Generate default i3-config
Use i3-config wizard to do this

## Add i3-gaps config to default i3-config

```sh
set $mode_gaps Gaps: (o)uter, (i)nner, (h)orizontal, (v)ertical, (t)op, (r)ight, (b)ottom, (l)eft
set $mode_gaps_outer Outer Gaps: +|-|0 (local), Shift + +|-|0 (global)
set $mode_gaps_inner Inner Gaps: +|-|0 (local), Shift + +|-|0 (global)
set $mode_gaps_horiz Horizontal Gaps: +|-|0 (local), Shift + +|-|0 (global)
set $mode_gaps_verti Vertical Gaps: +|-|0 (local), Shift + +|-|0 (global)
set $mode_gaps_top Top Gaps: +|-|0 (local), Shift + +|-|0 (global)
set $mode_gaps_right Right Gaps: +|-|0 (local), Shift + +|-|0 (global)
set $mode_gaps_bottom Bottom Gaps: +|-|0 (local), Shift + +|-|0 (global)
set $mode_gaps_left Left Gaps: +|-|0 (local), Shift + +|-|0 (global)
bindsym $mod+Shift+g mode "$mode_gaps"

mode "$mode_gaps" {
        bindsym o      mode "$mode_gaps_outer"
        bindsym i      mode "$mode_gaps_inner"
        bindsym h      mode "$mode_gaps_horiz"
        bindsym v      mode "$mode_gaps_verti"
        bindsym t      mode "$mode_gaps_top"
        bindsym r      mode "$mode_gaps_right"
        bindsym b      mode "$mode_gaps_bottom"
        bindsym l      mode "$mode_gaps_left"
        bindsym Return mode "$mode_gaps"
        bindsym Escape mode "default"
}

mode "$mode_gaps_outer" {
        bindsym plus  gaps outer current plus 5
        bindsym minus gaps outer current minus 5
        bindsym 0     gaps outer current set 0

        bindsym Shift+plus  gaps outer all plus 5
        bindsym Shift+minus gaps outer all minus 5
        bindsym Shift+0     gaps outer all set 0

        bindsym Return mode "$mode_gaps"
        bindsym Escape mode "default"
}
mode "$mode_gaps_inner" {
        bindsym plus  gaps inner current plus 5
        bindsym minus gaps inner current minus 5
        bindsym 0     gaps inner current set 0

        bindsym Shift+plus  gaps inner all plus 5
        bindsym Shift+minus gaps inner all minus 5
        bindsym Shift+0     gaps inner all set 0

        bindsym Return mode "$mode_gaps"
        bindsym Escape mode "default"
}
mode "$mode_gaps_horiz" {
        bindsym plus  gaps horizontal current plus 5
        bindsym minus gaps horizontal current minus 5
        bindsym 0     gaps horizontal current set 0

        bindsym Shift+plus  gaps horizontal all plus 5
        bindsym Shift+minus gaps horizontal all minus 5
        bindsym Shift+0     gaps horizontal all set 0

        bindsym Return mode "$mode_gaps"
        bindsym Escape mode "default"
}
mode "$mode_gaps_verti" {
        bindsym plus  gaps vertical current plus 5
        bindsym minus gaps vertical current minus 5
        bindsym 0     gaps vertical current set 0

        bindsym Shift+plus  gaps vertical all plus 5
        bindsym Shift+minus gaps vertical all minus 5
        bindsym Shift+0     gaps vertical all set 0

        bindsym Return mode "$mode_gaps"
        bindsym Escape mode "default"
}
mode "$mode_gaps_top" {
        bindsym plus  gaps top current plus 5
        bindsym minus gaps top current minus 5
        bindsym 0     gaps top current set 0

        bindsym Shift+plus  gaps top all plus 5
        bindsym Shift+minus gaps top all minus 5
        bindsym Shift+0     gaps top all set 0

        bindsym Return mode "$mode_gaps"
        bindsym Escape mode "default"
}
mode "$mode_gaps_right" {
        bindsym plus  gaps right current plus 5
        bindsym minus gaps right current minus 5
        bindsym 0     gaps right current set 0

        bindsym Shift+plus  gaps right all plus 5
        bindsym Shift+minus gaps right all minus 5
        bindsym Shift+0     gaps right all set 0

        bindsym Return mode "$mode_gaps"
        bindsym Escape mode "default"
}
mode "$mode_gaps_bottom" {
        bindsym plus  gaps bottom current plus 5
        bindsym minus gaps bottom current minus 5
        bindsym 0     gaps bottom current set 0

        bindsym Shift+plus  gaps bottom all plus 5
        bindsym Shift+minus gaps bottom all minus 5
        bindsym Shift+0     gaps bottom all set 0

        bindsym Return mode "$mode_gaps"
        bindsym Escape mode "default"
}
mode "$mode_gaps_left" {
        bindsym plus  gaps left current plus 5
        bindsym minus gaps left current minus 5
        bindsym 0     gaps left current set 0

        bindsym Shift+plus  gaps left all plus 5
        bindsym Shift+minus gaps left all minus 5
        bindsym Shift+0     gaps left all set 0

        bindsym Return mode "$mode_gaps"
        bindsym Escape mode "default"
}
```

## Installing feh, compton pywal

```sh
sudo apt install python3-pip
pip3 install pywal
sudo apt install feh compton

```

## Installing ZSH

```sh
sudo apt install zsh
```

## Installing oh-my-zsh & setting it up with p10k theme and various plugins


1. Get oh-my-zsh
```sh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

2. Install fonts from Nerd fonts
```sh
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip

```

3. Install material-design-icons
```sh
git clone https://github.com/google/material-design-icons
```
2. Install p10k theme into oh-my-zsh
```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
## Installing plugins for oh-my-zsh

These ones need to be installed explicitly.

1. zsh-autosuggestions
```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

2. zsh-syntax-highligtying
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Here is the list of plugins I use:

	gitfast
	z
	history-substring-search
	colored-man-pages
	command-not-found
	zsh-autosuggestions
	zsh-syntax-highlighting

## polybar installation

1. Install polybar
```sh
sudo apt install -y polybar
```

2. Install polybar collection fork of Murzchnvok's repo
```sh
git clone https://github.com/hasnainvirk/polybar-collection.git
```

3. Rofi collection to match the selected theme
```sh
git clone https://github.com/Murzchnvok/rofi-collection
```

4. Spotify controls for polybar
```sh
sudo apt-get install python-dbus
sudo apt-get install python-gobject
git clone https://github.com/dietervanhoof/polybar-spotify-controls.git

sudo apt install playerctl
```

## Installing terminator
```sh
sudo apt install terminator
```

## Installing session controller
```sh
sudo apt install lxsession-logout  
```
