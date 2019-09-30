#!/bin/bash

# Option to install elsewhere with argument
if [[ -n $1 ]]; then
	pkgdir="$1"
else
	pkgdir="/"
fi

# Installation
mkdir -p "${pkgdir}/usr/bin/wallpaper"
mkdir -p "${pkgdir}/etc/systemd/system/"
mkdir -p "${pkgdir}/etc/default/daynight/"

install -Dm755 wallpaper "${pkgdir}/usr/bin/wallpaper"
install -Dm644 daynight@.* "${pkgdir}/etc/systemd/system/"
install -Dm644 daynightrc "${pkgdir}/etc/default/daynight/"
