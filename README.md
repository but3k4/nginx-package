# NginX rpm/deb package

NginX rpm/deb package with third party modules

## Advice

To build the packages, use a Docker container or a VM, don't do that in a production environment.

## Overview

This project includes the necessary files to build the latest NginX version with third party modules.

The third party modules are:

* cache-purge<br/>
  https://github.com/FRiCKLE/ngx_cache_purge

* dav-ext<br/>
  https://github.com/arut/nginx-dav-ext-module

* development-kit<br/>
  https://github.com/simpl/ngx_devel_kit

* echo<br/>
  https://github.com/agentzh/echo-nginx-module

* fancyindex<br/>
  https://github.com/aperezdc/ngx-fancyindex

* headers-more<br/>
  https://github.com/agentzh/headers-more-nginx-module

* http-auth-pam<br/>
  https://github.com/stogh/ngx_http_auth_pam_module

* http-substitutions-filter<br/>
  https://github.com/yaoweibin/ngx_http_substitutions_filter_module

* lua<br/>
  https://github.com/chaoslawful/lua-nginx-module

* sticky<br/>
  https://bitbucket.org/nginx-goodies/nginx-sticky-module-ng

* upload-progress<br/>
  https://github.com/masterzen/nginx-upload-progress-module<br/>
  rm -r upload-progress/test

* upstream-fair<br/>
  https://github.com/gnosek/nginx-upstream-fair

## CentOS

To install the build dependencies, use the command below:

```bash

yum install -y ftp git-core rpm-build make gcc patch bzip2 GeoIP-devel gd-devel \
    libxslt-devel openssl-devel pcre-devel perl-devel perl-ExtUtils-Embed \
    zlib-devel expat-devel lua-devel pam-devel

```

#### Build

To build the package use:

```bash

git clone https://github.com/but3k4/nginx-package.git
cd nginx-package
make rpm

```

#### Install

To install the package use:

```bash

yum localinstall ../nginx-1.9.9-1.el7.x86_64.rpm \
    ../nginx-filesystem-1.9.9-1.el7.noarch.rpm

```
## Debian

To install the build dependencies, use the command below:

```bash

apt-get install -y ftp git-core dialog dh-make build-essential devscripts wget \
autotools-dev dh-systemd libluajit-5.1-dev libexpat-dev libgd2-dev libgeoip-dev \
libmhash-dev libpam0g-dev libpcre3-dev libperl-dev libssl-dev libxslt1-dev

```

#### Build

To build the package use:

```bash

git clone https://github.com/but3k4/nginx-package.git
cd nginx-package
make deb

```

#### Install

To install the package use:

```bash

dpkg -i ../nginx-common_1.9.9-1_all.deb ../nginx-extras_1.9.9-1_amd64.deb

```
