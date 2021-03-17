SHELL=/bin/bash -O globstar

IMAGE=ghcr.io/afrinic-dbwg/document-qa:release
WORKSPACE=/opt/working

.PHONY: test
test: pull
	docker run --rm \
	           --tty \
	           --volume "$(CURDIR):$(WORKSPACE)" \
	           "$(IMAGE)"

.PHONY: spell
spell: pull
	docker run --rm \
	           --tty \
			   --interactive \
	           --volume "$(CURDIR):$(WORKSPACE)" \
	           "$(IMAGE)" \
			   --interactive

.PHONY: pull
pull:
	docker pull $(IMAGE)
