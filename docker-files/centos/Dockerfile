FROM centos:7
MAINTAINER Claudio Borges <cbsfilho@gmail.com>
RUN yum update -y
RUN yum install -y ftp git-core rpm-build make gcc patch bzip2 \
GeoIP-devel gd-devel libxslt-devel openssl-devel pcre-devel \
perl-devel perl-ExtUtils-Embed zlib-devel expat-devel \
lua-devel pam-devel epel-release
RUN yum --enablerepo=epel install -y libmaxminddb libmaxminddb-devel
WORKDIR /root
RUN git clone https://github.com/but3k4/nginx-package.git
