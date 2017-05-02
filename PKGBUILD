# Maintainer: Julian Geywitz <github@geigi.de>
pkgname=backlitkeyboardtimer
pkgver=0.1
pkgrel=1
pkgdesc="Automatically turn off your backlit keyboard on inactivity."
arch=('x86_64')
url="https://github.com/geigi/backlitkeyboardtimer"
license=('unknown')
depends=(xprintidle)
source=("$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')

prepare() {
	chmod 666 /sys/class/leds/smc::kbd_backlight/brightness
}

package() {
	SYSTEMD_DESTDIR="${pkgdir}/usr/lib/systemd/user/"
	PCK_DESTDIR="${pkgdir}/opt/backlitkeyboardtimer/"
	mkdir -p "${SYSTEMD_DESTDIR}"
	mkdir -p "${PCK_DESTDIR}"
	cp ${srcdir}/${pkgname}-${pkgver}/backlitkeyboardtimer.service "${SYSTEMD_DESTDIR}"
	cp ${srcdir}/${pkgname}-${pkgver}/backlitkeyboardtimer.sh "${PCK_DESTDIR}"
	chmod +x "${PCK_DESTDIR}"backlitkeyboardtimer.sh
}
