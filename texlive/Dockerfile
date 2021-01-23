FROM nixos/nix

MAINTAINER Linus Arver <linus@ucla.edu>

RUN \
	nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs \
	&& nix-channel --update \
	# Install packages.
	&& nix-env -f '<nixpkgs>' -iA \
		bashInteractive \
		git \
		python39Packages.pygments \
		texlive.combined.scheme-full

CMD ["tail", "-f", "/dev/null"]

# REFERENCES
# [1]: https://www.reddit.com/r/archlinux/comments/5ash5v/problem_with_biber/
