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
	cp -a src/nginx-1.11.7.tar.gz ${TOPDIR}/nginx_1.11.7.orig.tar.gz
	cp -a src/debian.tar.xz ${TOPDIR}/nginx_1.11.7-1.debian.tar.xz
	tar -xvzf ${TOPDIR}/nginx_1.11.7.orig.tar.gz -C ${TOPDIR}/
	tar -xvJf ${TOPDIR}/nginx_1.11.7-1.debian.tar.xz -C ${TOPDIR}/nginx-1.11.7/
	tar -xvzf src/modules.tar.gz -C ${TOPDIR}/nginx-1.11.7/debian/
	cd ${TOPDIR}/nginx-1.11.7 && dpkg-buildpackage -us -uc -sa -tc
	cd ${TOPDIR} && cp -a *.deb *.xz *.dsc *.changes *.gz ../

.PHONY: clean

clean:  
	rm -rf ${TOPDIR}

