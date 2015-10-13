

R = R 
RSCRIPT = Rscript

PKG = toyrpkg
VER = $(shell $(RSCRIPT) -e "cat(read.dcf(file = './$(PKG)/DESCRIPTION')[1, deparse(quote(Version))])")
PKGtargz = $(PKG)_$(VER).tar.gz

build $(PKGtargz): ./toyrpkg/DESCRIPTION 
	cd toyrpkg/src; R -q -f stan2cpp.R --args a.stan a.cpp; R -q -f stan2cpp.R --args b.stan b.cpp ; cat a.cpp b.cpp > ab.cpp
	$(R) CMD build toyrpkg --md5  # --no-build-vignettes --no-manual

install: $(PKGtargz) 
	$(R) CMD INSTALL $(PKGtargz)

clean: 
	rm -f $(PKGtargz) 
	rm -f ./toyrpkg/src/*.o 
	rm -f ./toyrpkg/src/*.so ./toyrpkg/src/a.cpp ./toyrpkg/src/b.cpp ./toyrpkg/src/ab.cpp

listfiles:
	find yarpkg -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'

.PHONY: build install clean listfiles

