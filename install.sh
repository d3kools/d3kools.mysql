#!/bin/bash

proj=mysqld3kools
basedir=$(readlink -f $(dirname $0))

prefix=/usr/local

if !(test -z $1); then
    if [ $1 = 'help' ]; then
        echo help;
        exit;
    fi
    if [ $1 = 'relative' ]; then
        echo relat;
        exit;
    fi
    echo uknown parameter : $1
    exit;
fi

function checkout_prefixpath_permission {
    if ! test -d $prefix; then
        echo "$prefix not found"
        exit;
    fi
    if ! test -w $prefix; then
        echo "you do not have write permission to $prefix"
        exit;
    fi
}

function prefixpath_install {
    usrlocal=$prefix/$proj
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

checkout_prefixpath_permission
prefixpath_install
homerc_install

echo $proj installed
# mkdir $usrlocal
