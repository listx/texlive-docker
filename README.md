# TexLive Docker Images

[![Build Status](https://travis-ci.org/listx/texlive-docker.svg?branch=master)](https://travis-ci.org/listx/texlive-docker)

This repository holds the Dockerfiles that are used to build Docker images of TexLive.

# Tutorial

There are 2 images:

- `listx/texlive:2016`
- `listx/texlive:2016-fonts`

.
The first only has TexLive on it; the second one has everything in the first, plus all official Arch Linux font packages (have a look at the Dockerfile directly for the full list).
Grab the first image, for example, like this:

```
docker pull listx/texlive:2016
```

.
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
If you don't like the fact that processes inside the container run as the `root` user, you can change this by creating your own custom image on top of these images, like this:

```
FROM listx/texlive:2016-fonts

# Give 'foo' sudo access.
RUN echo '%foo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN groupadd -g 1000 foo
RUN useradd -M -n -u 1000 -g foo foo
USER foo
```

.
The above image creates a user named `foo`, and so all processes will run as `foo` inside this container.
So, instead of files having user/group ownership as `root:root`, they will now be `foo:foo`.
If the uid/gid of `1000` is also the same as your host system for your current user (let's say, `bar`), then your host will see new files created by the container as owned by `bar` (whereas they will be owned by `foo` /inside/ the container).
You could, of course, decide to match up not just the user/group name but also the uid/gid as well to make it all the same.

# License

See LICENSE file.
