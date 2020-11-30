FROM archlinux/base

MAINTAINER Linus Arver <linus@ucla.edu>

RUN \
	`# Sync package databases.` \
	&& pacman -Syw \
	`# Install texlive packages.` \
	&& pacman -S --noconfirm \
		base-devel \
		biber \
		texlive-most \
		texlive-lang \
		pygmentize \
	`# Clear pacman cache` \
	&& pacman -Scc --noconfirm

# We have to manually edit PATH so that the "biber" binary is readily available
# to us. Although biber itself is found only in /usr/bin/vendor_perl, we include
# other Perl-based paths for the sake of completeness. [1]
ENV PATH="/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:${PATH}"

# Install dependencies for latexindent.
RUN  (echo y;echo o conf prerequisites_policy follow;echo o conf commit)|cpan \
	 && cpan install Log::Dispatch::File \
	 && cpan install YAML::Tiny \
	 && cpan install File::HomeDir \
	 && rm -Rf $HOME/.cpan

CMD ["tail", "-f", "/dev/null"]

# REFERENCES
# [1]: https://www.reddit.com/r/archlinux/comments/5ash5v/problem_with_biber/
