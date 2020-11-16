KDIR := /lib/modules/$(shell uname -r)/build

PWD := $(shell pwd)

obj-m += netlinkKernel.o

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules
	gcc send.c -static -o send
	gcc recv.c -static -o recv

clean:
	rm -rf *.o *.ko *.mod.* *.cmd .module* modules* Module* .*.cmd .tmp*
	rm send
	rm recv
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

