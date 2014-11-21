all: mathopd images

.PHONY: mathopd
mathopd:
	$(MAKE) -C mathopd/src

.PHONY: images
images:
	genisoimage -l -r -o images/stubetc.iso images/stubetc
	genisoimage -l -r -o images/data.iso images/data

.PHONY: clean
clean:
	$(MAKE) -C mathopd/src clean
