FROM listx/texlive:2017-fonts

# Give 'foo' sudo access.
RUN echo '%foo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
	&& groupadd -g 1000 foo \
	&& useradd -m -N -u 1000 -g foo foo
USER foo
