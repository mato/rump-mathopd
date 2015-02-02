rump-mathopd
============

Unmodified mathopd (http://mathopd.org/) plus supporting files for running on
rumprun-xen (http://repo.rumpkernel.org/rumprun-xen).

To play with this, build rumprun-xen according to the instructions and add the
`app-tools` directory to the *end* of your `$PATH`. You will also need to
install `genisoimage`.

Then, run:

````
rumprun-xen-make
````

To start a domU running mathopd, as root run (for example):

````
rumprun xen -M 32 -di \
    -n inet,static,10.10.10.10/24 \
    -b images/stubetc.iso,/etc \
    -b images/data.iso,/data \
    mathopd/src/mathopd -n -f /data/mathopd.conf
````

Replace `10.10.10.10/24` with a valid IP address on your Xen network.
