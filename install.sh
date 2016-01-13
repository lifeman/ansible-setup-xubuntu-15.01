CURRENT=`pwd`
SETUPDIR="._xubuntu-setup"
#wget -O - https://raw.githubusercontent.com/lifeman/ansible-setup-xubuntu/master/install.sh | bash

if [ ! -d ~/"$SETUPDIR" ]
then
    echo "\033[0;32m Installation de python.......\033[0m"
    sudo apt-get install -y -qq python python-pip git git-core openssh-server

    echo "\033[0;32m Installation ansible.......\033[0m"
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install ansible



    echo "\033[0;32m Clone de la config d'installation.\033[0m"
    sudo -u `whoami` -H git clone https://github.com/lifeman/ansible-setup-xubuntu.git $HOME/"$SETUPDIR"
else
    echo "\033[0;32mThe folder $SETUPDIR is already installed\033[0m"
fi

cd $HOME/"$SETUPDIR"

ansible-playbook -i hosts playbook.yml -c local -K