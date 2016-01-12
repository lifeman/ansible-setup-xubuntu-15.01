CURRENT=`pwd`
SETUPDIR=".config-desktop-xubuntu"
if [ ! -d ~/"$SETUPDIR" ]
then
    echo "\033[0;32m Installation de python.......\033[0m"
    sudo apt-get install -y -qq python python-pip git git-core openssh-server

    echo "\033[0;32m Installation ansible.......\033[0m"
    sudo pip install ansible

    echo "\033[0;32m Clone de la config d'installation.\033[0m"
    sudo -u `whoami` -H git clone git@git.karbouin.net:kevin.arbouin/desktop-home.git $HOME/"$SETUPDIR"
else
    echo "\033[0;32mThe folder $SETUPDIR is already installed\033[0m"
fi

cd $HOME/.config-desktop-home

ansible-playbook -i hosts site.yml -c local -K