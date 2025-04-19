#!/usr/bin/env  bash

if [[ $UID -ne 0 ]]; then

	echo "script must be run as root"

exit 1

fi

while true; do

	read  -p "Are you using a debian-based OS? [y/n] " answer

case "${answer,,}" in

	y|yes) echo "Installing pwn_noodles"; break;;

	n|no) echo "Exiting...switch to a debian-based os"; exit 1;;

	*) echo "Invalid response; please enter y or n.";;

esac
done

# system depencies
apt update
apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential

# create a venv in ~/.pwn_noodles_env
VENV_DIR="$HOME/.pwn_noodles_env"

if [ ! -d "$VENV_DIR" ]; then 
	python3 -m venv "$VENV_DIR"
fi

source "$VENV_DIR/bin/activate"
export PATH="$VENV_DIR/bin:$PATH"

# install all
install_all(){
	install_pwntools
	install_ghidra
	install_checksec
	install_pwndbg
}

# pwntools
install_pwntools(){
	echo  "Installing pwn tools into venv at $VENV_DIR"
	apt-get install software-properties-common
	apt-add-repository ppa:pwntools/binutils

	apt-get install binutils-$ARCH-linux-gnu
	python3 -m pip install --upgrade pip
	python3 -m pip install --upgrade pwntools
}

# ghidra
install_ghidra(){
	snap install ghidra
}

# checksec
install_checksec(){
	pip install checksec
}

# pwn-dbg

install_pwndbg(){
	git clone https://github.com/pwndbg/pwndbg 
	pwndbg/setup.sh
}


#  === MAIN MENU ===
echo "===PWN NOODLES MENU==="
echo "0) install all"
echo "1) install pwntools"
echo "2) install ghidra"
echo "3) install checksec"
echo "4) install pwn-gdb"
echo "======================"
read -p "Selection an option (0-4): " choice

case $choice in
	0) install_all ;;
	1) install_pwntools ;;
	2) install_ghidra ;;
	3) install_checksec ;;
	4) install_pwndbg ;;
	*) echo "Invalid response";;
esac
