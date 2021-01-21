FROM listx/texlive:2020

ARG user
ARG group
ARG uid
ARG gid

RUN \
	# Give '${user}' sudo access.
	echo '%${user} ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
	&& groupadd -g ${gid} ${group} \
	&& useradd -m -N -u ${uid} -g ${gid} ${user} \
	# Add some other useful packages.
	&& pacman -Syw \
	&& pacman -Sy --noconfirm \
		git \
    # Cleanup.
	&& pacman -Scc --noconfirm

# Use "${user}" user.
USER ${user}
