#!/bin/bash

if [ -f /.root_pw_set ]; then
	echo "Root password already set!"
	exit 0
fi

PASS=qwerty
_word=$( [ ${ROOT_PASS} ] && echo "preset" || echo "random" )
echo "=> Setting a ${PASS} password to the root user"
echo "root:$PASS" | chpasswd

echo "=> Done!"
touch /.root_pw_set

echo "========================================================================"
echo "You can now connect to this CentOS container via SSH using:"
echo ""
echo "    ssh -p <port> root@<host>"
echo "and enter the root password '$PASS' when prompted"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
