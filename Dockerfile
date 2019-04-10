from debian:stable
label description "Full TeXlive installation"

env LANG=C.UTF-8 DEBIAN_FRONTEND=noninteractive
run apt-get update && apt-get -y dist-upgrade && \
    # install build packages
    apt-get -y --no-install-recommends install \
        bsdmainutils \
        git \
        latexmk \
        lmodern \
        make \
        texlive-fonts-extra \
        texlive-generic-recommended \
        texlive-generic-extra \
        texlive-luatex \
        texlive-xetex \
        unzip \
        wget \
        texlive-full \
        && \
    # clean up
    apt-get autoclean && apt-get clean && \
    # would get done before each compile otherwise
    luaotfload-tool --update && \
    # directory/mount-point for work
    mkdir -p /work

workdir /work
volume [ "/work" ]

cmd [ "/bin/bash" ]
