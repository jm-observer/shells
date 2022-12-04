#!/bin/bash
apt-get update
apt-get install -y gcc pkgconf libssl-dev pkgconf make cmake tree


apt-get install -y  zsh
chsh -s /bin/zsh
echo -e "\n" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/unixorn/fzf-zsh-plugin.git ~/.oh-my-zsh/plugins/fzf-zsh-plugin
sed -i 's/(git/(git zsh-autosuggestions fzf-zsh-plugin/' ~/.zshrc
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="daveverwer"/' ~/.zshrc
sed -i '$a\bindkey "?" autosuggest-accept' ~/.zshrc

# source ~/.zshrc

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"
cargo install crm
crm best
cargo install cargo-make