# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# bash autocomplete config
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Maven (mvn) config
export M2_HOME=/usr/local/Cellar/maven/3.6.2/libexec
export M2=${M2_HOME}/bin
export PATH=${PATH}:${M2_HOME}/bin

# git and python venv prompt
source ~/git_venv_prompt.sh

# for vim soliarized theme
sh .vim/pack/themes/opt/solarized8/scripts/solarized8.sh

# make directory and change to directory
# Usage $ mcd ../dir
function mcd () {
	mkdir -p "$1"
	cd "$1" || exit
}

# c docker stuff
# a lot of this can be ignored and deprecated, probably
function crun(){
    docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp vulture/gcc-valgrind-cunit /usr/src/myapp/"$1"
}

function cval(){
    docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp vulture/gcc-valgrind-cunit valgrind /usr/src/myapp/"$1"
}

function cpile(){
    docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp vulture/gcc-valgrind-cunit gcc -o "$1" "$2"
}
