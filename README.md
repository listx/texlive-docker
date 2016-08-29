# TexLive Docker Images

[![Build Status](https://travis-ci.org/listx/texlive-docker.svg?branch=master)](https://travis-ci.org/listx/texlive-docker)

This repository holds the Dockerfiles that are used to build Docker images of TexLive.

# Tutorial

The simplest way is to mount the folder holding your TeX files (e.g., your `$HOME` folder) into the container:

```
docker run --detach --rm --volume /home:/home --name texlive2016 listx/texlive:2016
```

.
Now you can either (1) start a shell session inside the container to run something like `xelatex`, or (2) just run your TeX project's build comman (if you have, e.g., a `Makefile` set up for it).
For (1), you can do

```
docker exec --interactive --tty texlive2016 bash'
```

.
For (2), you can do something like

```
docker exec --interactive --tty texlive2016 sh -c 'cd /home/foo/my_tex_project && pdftex foo.tex'
```

.

# License

See LICENSE file.
