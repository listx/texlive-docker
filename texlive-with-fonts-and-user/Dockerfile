FROM listx/texlive:2018-fonts

RUN \
	`# Give 'foo' sudo access.` \
	&& echo '%foo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
	&& groupadd -g 1000 foo \
	&& useradd -m -N -u 1000 -g foo foo \
    `# Add some other useful packages.` \
    && pacman -Syw \
    && pacman -Sy --noconfirm \
		git
USER foo
