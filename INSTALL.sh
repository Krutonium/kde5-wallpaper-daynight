#!/bin/bash

# Option to install elsewhere with argument
if [[ -n $1 ]]; then
	pkgdir="$1"
else
	pkgdir="/"
fi

# Installation
install -Dm755 wallpaper "${pkgdir}/usr/bin/"
install -Dm644 daynight@.* "${pkgdir}/etc/systemd/system/"
install -Dm644 daynightrc "${pkgdir}/etc/default/daynight/"
