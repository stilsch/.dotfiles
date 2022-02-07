# These are my personal dotfiles
## installation with `git` and `sudo`

```bash
# you may delete the existing folder first
rm -rf ~/.dotfiles

set -e
sudo apt update  && \
sudo apt install git -y && \
git clone https://github.com/stilsch/.dotfiles.git ~/.dotfiles && \
~/.dotfiles/install.sh
```
## installation with `git` and no `sudo`
```bash
# you may delete the existing folder first
rm -rf ~/.dotfiles

set -e
apt update  && \
apt install git -y && \
git clone https://github.com/stilsch/.dotfiles.git ~/.dotfiles && \
~/.dotfiles/install.sh
```

## some intesting other dotfiles
https://github.com/webpro/awesome-dotfiles#readme
