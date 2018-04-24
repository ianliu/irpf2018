#!/bin/bash
set -e

ls -al ~

if [ $(id -u) = 0 ]; then
	groupadd -g $2 irpf
	useradd -g irpf -m -u $1 irpf
	test -d /home/irpf && chown irpf:irpf /home/irpf
	exec su irpf "$BASH_SOURCE" "$@"
fi

mcookie=$(xauth -f /tmp/xauth list $HOST_NAME/unix$DISPLAY | awk '{ print $NF }')
xauth add "$HOSTNAME/unix$DISPLAY" . "$mcookie"

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'
exec java -jar /IRPF2018/irpf.jar
