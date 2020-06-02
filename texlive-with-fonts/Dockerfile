FROM listx/texlive:2019

MAINTAINER Linus Arver <linus@ucla.edu>

# Add all known font packages on official Arch Linux repos (not AUR). This is
# done with a regex for more automation.
RUN \
	`# Sync package databases.` \
	&& pacman -Syw \
	&& pacman -S --noconfirm \
		$(pacman -Ssq "font|^otf|ttf" \
			| grep -v fluidsynth \
			| grep -v fontconfig \
			| grep -v fonteditfs \
			| grep -v fontforge \
			| grep -v fontsproto \
			| grep -v freetype2 \
			| grep -v ftgl \
			| grep -v gnome-font-viewer \
			| grep -v gtk2_prefs \
			| grep -v gtk2fontsel \
			| grep -v gwaterfall \
			| grep -v ^lib \
			| grep -v mate-utils \
			| grep -v mftrace \
			| grep -v pangox-compat \
			| grep -v ^perl \
			| grep -v ^python \
			| grep -v ^sdl \
			| grep -v ^sound \
			| grep -v ^t1 \
			| grep -v ^texlive \
			| grep -v texmacs \
			| grep -v ttf-nerd-fonts-symbols-mono \
			| grep -v ^xorg) \
	&& pacman -Scc --noconfirm
