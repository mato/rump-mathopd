all: mathopd images

.PHONY: mathopd
mathopd: mathopd/src
	$(MAKE) -C mathopd/src

mathopd/src:
	git submodule init
	git submodule update

.PHONY: images
images:
	genisoimage -l -r -o images/stubetc.iso images/stubetc
	genisoimage -l -r -o images/data.iso images/data

.PHONY: clean
clean:
	$(MAKE) -C mathopd/src clean
