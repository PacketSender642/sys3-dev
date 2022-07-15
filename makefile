C3C=c3c

SRCS=$(wildcard src/sys3/*.c3)

all: $(SRCS)
	$(C3C) compile-only --stdlib lib/ $^ --target elf-x64 -o sys3.o

	ld    				   	   \
		-Tlinker.ld            \
		-nostdlib              \
		-zmax-page-size=0x1000 \
		-static std.core.string.o std.core.io.o std.boot.limine.o std.core.builtin.o sys3.o -o sys3.elf

iso: all
	make -C limine
	rm -rf iso_root
	mkdir -p iso_root
	cp sys3.elf \
		limine.cfg limine/limine.sys limine/limine-cd.bin limine/limine-cd-efi.bin iso_root/
	xorriso -as mkisofs -b limine-cd.bin \
		-no-emul-boot -boot-load-size 4 -boot-info-table \
		--efi-boot limine-cd-efi.bin \
		-efi-boot-part --efi-boot-image --protective-msdos-label \
		iso_root -o SYS3_X86_64.iso
	./limine/limine-deploy SYS3_X86_64.iso
	rm -rf iso_root