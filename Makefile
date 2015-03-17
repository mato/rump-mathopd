all: mathopd images

.PHONY: mathopd
mathopd: mathopd/src/mathopd

mathopd/src/mathopd: mathopd/src
	$(MAKE) -C mathopd/src CC=rumprun-xen-cc

mathopd/src:
	git submodule init
	git submodule update

.PHONY: images
images: images/stubetc.iso images/data.iso

images/stubetc.iso: images/stubetc/*
	genisoimage -l -r -o images/stubetc.iso images/stubetc

images/data.iso: images/data/mathopd.conf images/data/www/*
	genisoimage -l -r -o images/data.iso images/data

.PHONY: clean
clean:
	$(MAKE) -C mathopd/src clean
	rm -f images/stubetc.iso images/data.iso
