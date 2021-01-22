FROM archlinux/archlinux

MAINTAINER Linus Arver <linus@ucla.edu>

RUN \
	# Sync package databases.
	pacman -Syw \
	# Install texlive packages.
	&& pacman -S --noconfirm \
		base-devel \
		biber \
		git \
		texlive-most \
		texlive-lang \
		pygmentize \
	# Clear pacman cache.
	&& pacman -Scc --noconfirm

RUN \
    # Install missing Perl dependency for latexindent (see
    # https://bugs.archlinux.org/task/60210). We have to first create a
    # 'builder' user because `makepkg` refuses to run as a root user, then
    # download and install the dependency from AUR.
	echo '%builder ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
	&& groupadd -g 1100 builder \
	&& useradd -m -N -u 1100 -g 1100 builder \
	&& su - builder \
	# Download missing dependency.
	&& curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/perl-log-dispatch.tar.gz \
	&& tar xvf perl-log-dispatch.tar.gz \
	&& cd perl-log-dispatch \
	&& yes y | makepkg -si

# We have to manually edit PATH so that the "biber" binary is readily available
# to us. Although biber itself is found only in /usr/bin/vendor_perl, we include
# other Perl-based paths for the sake of completeness. [1]
ENV PATH="/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:${PATH}"

CMD ["tail", "-f", "/dev/null"]

# REFERENCES
# [1]: https://www.reddit.com/r/archlinux/comments/5ash5v/problem_with_biber/
