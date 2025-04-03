# Maintainer gingrspacecadet
pkgname=vvy
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple script to clone a repository and build an Arch package"
arch=('any')
url="https://github.com/gingrspacecadet/vincent-van-yogh.git"
license=('GPL')
depends=('git' 'base-devel')  # makepkg needs these dependencies
source=("vvy.sh")  # This will package the script file
sha256sums=('SKIP')  # You can add a checksum here if you want

# Build function (not needed for this script)
build() {
  return 0
}

# Package function
package() {
  install -Dm755 "$srcdir/vvy.sh" "$pkgdir/usr/bin/vvy"  # Install the script as a binary
}
