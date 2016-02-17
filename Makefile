TOPDIR := $(shell dirname $(CURDIR))/build

default:
	@echo "Usage: make rpm or make deb"

rpm: RPM clean
deb: DEB clean

RPM:
	mkdir -p ${TOPDIR}/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
	cp -a src/* ${TOPDIR}/SOURCES/
	rm ${TOPDIR}/SOURCES/debian.tar.xz
	cp -a nginx.spec ${TOPDIR}/SPECS/
	rpmbuild -ba --define "_topdir ${TOPDIR}" --define "dist .el7" --clean ${TOPDIR}/SPECS/nginx.spec
	find ${TOPDIR}/ -type f -iname \*.rpm -exec cp -a {} ../ \;

DEB:
	mkdir -p ${TOPDIR}
	cp -a src/nginx-1.9.11.tar.gz ${TOPDIR}/nginx_1.9.11.orig.tar.gz
	cp -a src/debian.tar.xz ${TOPDIR}/nginx_1.9.11-1.debian.tar.xz
	tar -xvzf ${TOPDIR}/nginx_1.9.11.orig.tar.gz -C ${TOPDIR}/
	tar -xvJf ${TOPDIR}/nginx_1.9.11-1.debian.tar.xz -C ${TOPDIR}/nginx-1.9.11/
	cd ${TOPDIR}/nginx-1.9.11 && dpkg-buildpackage -us -uc -tc
	cd ${TOPDIR} && cp -a *.deb *.xz *.dsc *.changes *.gz ../

.PHONY: clean

clean:  
	rm -rf ${TOPDIR}

