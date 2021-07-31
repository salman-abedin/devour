# Devour: X11 Window Swallower

Devour hides your current window before launching an external program and unhides it after quitting.  
Devour was inspired by
[sw](https://github.com/ronniedroid/.dotfiles/blob/master/Scripts/sw)
and is a successor to
[devour.sh](https://github.com/salman-abedin/devour.sh)

![](https://gitlab.com/salman-abedin/assets/-/raw/master/devour.gif)

# Demonstration done by [DistroTube](https://www.youtube.com/channel/UCVls1GmFKf6WlTraIb_IaJg)

[![](https://gitlab.com/salman-abedin/assets/-/raw/master/devour-dt.png)](https://www.youtube.com/watch?v=mBNLzHcUtTo&t=5m22s)

## Dependencies

- Xlib (client-side header files)

## Installation

#### AUR

```sh
yay -S --noconfirm devour
# or
yay -S --noconfirm devour-git # Nightly
```

#### Git

```sh
git clone https://github.com/salman-abedin/devour.git && cd devour && sudo make install
```

## Usage

```sh
devour CMD ...
```

## Patches

- **Shell aliases**. (ex. `devour z FILE` instead of `devour zathura FILE`)

```sh
cd devour
patch -s < devour-shellalias-10.0.diff    # Add the feature
patch -s -R < devour-shellalias-10.0.diff # Remove the feature
sudo make install                      # Reinstall
```

## Pro Tip

**Devour from your file explorer instead of the shell.**  
Watch my demo and notice how seamless it is compared to devouring from the shell.

**Hint:** If you are one of those unfortunate souls who uses **xdg-open** instead of
[a custom launch script](https://gist.github.com/salman-abedin/6f52c52e465d89d489f9ea8d891c7332),
then go to your **~/.local/share/applications** directory and modify the applications you launch from your file explorer like below and enjoy the true devouring experience.

```
[Desktop Entry]
Type=Application
Name=PDF Reader
Exec=/usr/local/bin/devour /usr/bin/zathura %U
```

## Update

```sh
cd devour
git pull --no-rebase && sudo make install
```

## Uninstallation

```sh
cd devour
sudo make uninstall
```

## Logs

- **21/06/20**:- Added support for names with spaces

- **07/07/20**:- Added support for shell aliases

- **03/08/20**:- Rewrote the shellscript in C

- **23/08/20**:- Made additional features optional using patching

- **08/11/20**:- Added support for all unsafe characters

## Contributors

- keni7385 (AUR package submitter/maintainer)

- [agnipau](https://github.com/agnipau)

- [HawaiinPizza](https://github.com/HawaiinPizza)

- [sbuller](https://github.com/sbuller)

- [AriaMoradi](https://github.com/AriaMoradi)

- [durcor](https://github.com/durcor)

## TO-DOs

- Authentic swallowing

---

## Shameful Plug

| Name                                                    | Description                        |
| ------------------------------------------------------- | ---------------------------------- |
| [faint](https://github.com/salman-abedin/faint)         | Extensible TUI fuzzy file explorer |
| [bolt](https://github.com/salman-abedin/bolt)           | The launcher wrapper               |
| [uniblocks](https://github.com/salman-abedin/uniblocks) | The status bar wrapper             |
| [tide](https://github.com/salman-abedin/tide)           | Minimal Transmission CLI client    |
| [puri](https://github.com/salman-abedin/puri)           | Minimal URL launcher               |
| [Magpie](https://github.com/salman-abedin/magpie)       | The dotfiles                       |
| [Alfred](https://github.com/salman-abedin/alfred)       | The scripts                        |

## Contact

SalmanAbedin@disroot.org
