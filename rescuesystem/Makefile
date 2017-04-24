.PHONY: all fstab verbose chroot boot

VERBOSITY ?= "--"
TARGETDIR ?= /mnt
UUID ?= "$(shell findmnt -n -o UUID "$(TARGETDIR)")"

all: fstab
	sudo ANSIBLE_NOCOWS=1 ansible-playbook -i inventory.cfg \
		-e UUID="$(UUID)" $(VERBOSITY) deploy.yml

fstab:
	sed -i 's:^\(UUID=\)[^ ]*\( / auto .*$$\):\1'$(UUID)'\2:' files/etc/fstab

boot:
	sudo qemu-system-x86_64 --enable-kvm -drive file=/dev/sdb,media=disk -m 2G -net nic -net user -cpu host -vga cirrus

verbose:
	make VERBOSITY=-vvv all

chroot:
	sudo chroot $(TARGETDIR) /bin/bash
