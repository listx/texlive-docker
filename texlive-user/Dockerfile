FROM listx/texlive:2020

ARG user
ARG group
ARG uid
ARG gid

RUN \
	# Give '${user}' sudo access.
	echo '%${user} ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
	&& groupadd -g ${gid} ${group} \
	&& useradd -m -N -u ${uid} -g ${gid} ${user}

# Use "${user}" user.
USER ${user}
