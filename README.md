rump-mathopd
============

Unmodified [mathopd](http://mathopd.org/) plus supporting files for running it
as a Unikernel on Xen using [rumprun](http://repo.rumpkernel.org/rumprun).

To play with this, build rumprun for Xen according to the
[instructions](http://wiki.rumpkernel.org/Repo%3A-rumprun) and add the
`app-tools` directory to your `$PATH`. You will also need to install
`genisoimage`.

Then, run:

````
make
````

This will build mathopd and data images, leaving the mathopd unikernel binary
in `bin/mathopd`.

To start a domU running mathopd, as root run (for example):

````
rumprun xen -M 32 -di \
    -n inet,static,10.10.10.10/24 \
    -b images/stubetc.iso,/etc \
    -b images/data.iso,/data \
    -- bin/mathopd -n -t -f /data/mathopd.conf
````

Replace `10.10.10.10/24` with a valid IP address on your Xen network.
