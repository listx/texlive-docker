# TexLive Docker Images

[![Build Status](https://travis-ci.org/listx/texlive-docker.svg?branch=master)](https://travis-ci.org/listx/texlive-docker)
[![](https://images.microbadger.com/badges/image/listx/texlive.svg)](https://microbadger.com/images/listx/texlive "Get your own image badge on microbadger.com")

This repository holds the Dockerfiles that are used to build Docker images of TexLive.

# Tutorial

There is 1 image, called

- `listx/texlive:2020`

which has TexLive on it.

Grab the first image, for example, like this:

```
docker pull listx/texlive:2020
```

The simplest way to use this image is to mount the folder holding your TeX files (e.g., your `$HOME` folder) into the container:

```
docker run --detach --rm --volume /home:/home --name texlive2020 listx/texlive:2020
```

The image above excutes things as the root user.
If you do not want this, go to the `texlive-user` subfolder and run `./build.sh` to generate an image that uses `listx/texlive:2020` as the base image but also injects a new user **inside** the container named `foo` that has the same user ID and group ID as your own.
Running that script will result in a new image with the tag `2020-${USER}` (named after your own username), and to use it you can invoke it the same way as for the root user, but with a different tag.

```
docker run --detach --rm --volume /home:/home --name texlive2020 listx/texlive:2020-${USER}
```

Now you can either (1) start a shell session inside the container to run something like `xelatex`, or (2) just run your TeX project's build command (if you have, e.g., a `Makefile` set up for it).
For (1), you can do

```
# Enter a bash session to run your TeX engines and other commands.
docker exec --interactive --tty texlive2020 bash'
```

For (2), you can do something like

```
docker exec --interactive --tty texlive2020 sh -c 'cd /home/foo/my_tex_project && pdftex foo.tex'
```

The second method is recommended because it forces you to have a clean build system defined independent of this image.

# License

See LICENSE file.
