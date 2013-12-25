

R = R 
RSCRIPT = Rscript

PKG = toyrpkg
VER = $(shell $(RSCRIPT) -e "cat(read.dcf(file = './$(PKG)/DESCRIPTION')[1, deparse(quote(Version))])")
PKGtargz = $(PKG)_$(VER).tar.gz

build $(PKGtargz): ./toyrpkg/DESCRIPTION 
	$(R) CMD build toyrpkg --md5  # --no-build-vignettes --no-manual

install: $(PKGtargz) 
	$(R) CMD INSTALL $(PKGtargz)

clean: 
	rm -f $(PKGtargz) 

.PHONY: build install clean

