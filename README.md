![](demo/preview.gif)

# Window Manager agnostic swallowing feature for terminal emulators

Devour hides your terminal window before launching an external program and unhides it after quitting.

Devour is the successor to
[BSPWM_Swallow](https://github.com/salman-abedin/bspwm_swallow)
and a fork of
[sw](https://github.com/ronniedroid/.dotfiles/blob/master/Scripts/sw) by
[ronniedroid](https://github.com/ronniedroid)

## Dependencies

-  [xdo](https://github.com/baskerville/xdo)

## Installation

```sh
git clone https://github.com/salman-abedin/devour.git && cd devour && sudo make install
```

## Usage

```sh
devour [CMD...]
```

## Pro Tip

Don't use the script directly.
I didn't write it to be called from the terminal in the first  place.
It just happens to have that ability.
Watch my demo and see how I have integrated it with a file browser.
That's the "True Devouring Experience". XD

**Hint:** I'm sure most of you are using the abomination of a thing called **xdg-open** so go to your application folder and modify your applications like below.

```
[Desktop Entry]
Type=Application
Name=PDF Reader
Exec=/usr/local/bin/devour /usr/bin/zathura %U
```

## Uninstallation

```sh
sudo make uninstall
```

## Patches

-  Added support for names with spaces (21/06/20)

-  Fixed a minor bug (24/06/20)

## Contributors

-  [agnipau](https://github.com/agnipau)

-  [HawaiinPizza](https://github.com/HawaiinPizza)

-  [sbuller](https://github.com/sbuller)

## Repos you might be interested in

[Bolt](https://github.com/salman-abedin/bolt)
: The lightning fast file/folder launcher

[Crystal](https://github.com/salman-abedin/crystal)
: The transparent setup

[Uniblocks](https://github.com/salman-abedin/uniblocks)
: The statusbar

[Magpie](https://github.com/salman-abedin/magpie)
: The dotfiles

[Alfred](https://github.com/salman-abedin/alfred)
: The scripts

## Contact

SalmanAbedin@disroot.org
