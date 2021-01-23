# TexLive Docker Images

[![Build Status](https://travis-ci.org/listx/texlive-docker.svg?branch=master)](https://travis-ci.org/listx/texlive-docker)
[![](https://images.microbadger.com/badges/image/listx/texlive.svg)](https://microbadger.com/images/listx/texlive "Get your own image badge on microbadger.com")
[![Docker hub](https://img.shields.io/docker/pulls/listx/texlive.svg)](https://hub.docker.com/r/listx/texlive/)

This repository holds the Dockerfiles that are used to build Docker images of
TexLive.

# Tutorial

There is 1 image, called

- `listx/texlive:2020`

which this repo publishes. To use this image, simply run the
[`start_container.sh`](./texlive/start_container.sh) script in the
[`texlive`](./texlive) subfolder.

```
cd texlive
./start_container.sh
```

`start_container.sh` mounts the `/home` folder (which should house your `$HOME`
folder, which presumably has your TeX files needing compilation) into the
container, and keeps it running in the background. Now you can either invoke
[`enter_container.sh`](./texlive/enter_container.sh) to enter a TexLive bash
environment inside the container, or you can optionally run
[`with_container.sh`](./texlive/with_container.sh) to invoke a build script for
your TeX files if you already have such a build script ready, with

```
cd texlive
./with_container.sh "path/to/your/tex/document/build/script.sh"
```

The above commands run everything as `root` inside the container. If you do not
want this, go to the [`texlive-user`](./texlive-user) subfolder and run
[`./build_container.sh`](texlive-user/build_container.sh) to generate an image
that uses `listx/texlive:2020` as the base image but also injects a new user
**inside** the container named after your current non-root user that has the
same user ID and group ID as your own. Running that script will result in a new
image with the tag `2020-${USER}` (named after your own username), and to use
it you can invoke it the same way as for the root user, by invoking the
`start_container.sh` script in the [`texlive-user`](./texlive-user) subfolder.
The same guidance for `enter_container.sh` and `with_container.sh` apply here
as well.

# License

See [LICENSE file](LICENSE).
