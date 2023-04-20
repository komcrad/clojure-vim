#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

install-software() {
  software="vim curl silversearcher-ag openjdk-8-jdk"
  sudo apt install -y $software
  sudo cp cljfmt /usr/local/bin
  git clone git clone --depth 1 https://github.com/junegunn/fzf.git
  cd fzf
  echo 'y\ny\ny\n' | ./install
  cd $DIR
}

vim-plugins () {
  mkdir -p ~/.vim/autoload ~/.vim/bundle
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  cd ~/.vim/bundle
  git clone https://github.com/komcrad/vim-clojure-static.git
  git clone https://github.com/komcrad/beacon.nvim.git
  git clone https://github.com/komcrad/vim-fireplace.git
  git clone https://github.com/komcrad/supertab.git
  git clone https://github.com/komcrad/vim-markdown-preview.git
  #git clone https://github.com/vim-scripts/paredit.vim.git
  git clone https://github.com/komcrad/vim-surround.git
  git clone https://github.com/komcrad/vim-cljfmt.git
  git clone https://github.com/junegunn/fzf.vim
  mkdir paredit.vim
  cd paredit.vim
  curl https://www.vim.org/scripts/download_script.php?src_id=25042 > paredit.zip
  unzip paredit.zip
  rm paredit.zip
  cd ..
  cd $DIR
  cp .vimrc ~/
}

setup-clojure () {
  curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > lein
  chmod +x lein
  sudo mv lein /usr/local/bin/
  lein -version
  cp profiles.clj ~/.lein/
  cd $DIR
  git clone https://github.com/komcrad/repl-reload.git
  cd repl-reload
  git checkout updates
  lein install
  cd $DIR
}

main() {
  install-software
  vim-plugins
  setup-clojure
}

main
