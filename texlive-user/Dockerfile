FROM listx/texlive:2020

ARG uid
ARG gid

RUN \
	# Give 'foo' sudo access.
	echo '%foo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
	&& groupadd -g ${gid} foo \
	&& useradd -m -N -u ${uid} -g foo foo \
	# Add some other useful packages.
	&& pacman -Syw \
	&& pacman -Sy --noconfirm \
		git \
    # Cleanup.
	&& pacman -Scc --noconfirm

# Use "foo" user.
USER foo
