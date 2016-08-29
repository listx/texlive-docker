FROM base/archlinux

MAINTAINER Linus Arver <linus@ucla.edu>

# Bring archlinux up to date. The base image is quite old so we have to jump
# through some hoops.
RUN perl -pi -e 's/https/http/' /etc/pacman.d/mirrorlist
RUN pacman -Sy --noconfirm archlinux-keyring
RUN pacman -Syu --noconfirm
RUN pacman-db-upgrade
RUN pacman -Syy

# Finally, all of the latest texlive packages. The texlive-most and texlive-lang
# packages are metapackages that comprise the entire suite of texlive packages
# offered in Arch Linux.
RUN pacman -S --noconfirm\
 base-devel\
 texlive-most\
 texlive-lang

# Fix fonts.
#RUN updmap-sys

CMD ["tail", "-f", "/dev/null"]
