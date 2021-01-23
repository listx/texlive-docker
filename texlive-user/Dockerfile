FROM listx/texlive:2020

ARG user
ARG group
ARG uid
ARG gid

RUN \
	addgroup -g ${gid} ${group} \
	&& echo -e "${user}\n${user}" | adduser -G ${group} -u ${uid} ${user}

# Use "${user}" user.
USER ${user}
