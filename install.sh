#!/bin/bash

proj=mysqld3kools
basedir=$(readlink -f $(dirname $0))

if !(test -z $1); then
    if [ $1 = 'relative' ]; then
        echo relat;
    else
        echo uknown
    fi
fi

function usrlocal_install {
    usrlocal=/usr/local/$proj
    if test -d $usrlocal; then
        echo $usrlocal already exists;
        exit;
    else
        mkdir $usrlocal;
    fi
    for f in `ls -1 $basedir/mysql_d3*`; do
        filename=`basename $f`;
        cp $f $usrlocal/;
        ln -s $usrlocal/$filename /usr/local/bin/$filename;
    done
}

function homerc_install {
    rcfile=$HOME/.mysql_d3.rc
    touch $rcfile
    if [ -n $SUDO_USER ]; then
        chown $SUDO_USER $rcfile
        chgrp $SUDO_USER $rcfile
    fi
    chmod 640 $rcfile
}

usrlocal_install
homerc_install
echo $proj installed
# mkdir $usrlocal
