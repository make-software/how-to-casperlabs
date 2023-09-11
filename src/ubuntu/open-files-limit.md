## Update Open Files Limit

Before beginning, update the maximum open files limit for your system. Specifically, update the node's `/etc/security/limits.conf` file as described below, to ensure proper node operation.

Add the following row to the bottom of the `/etc/security/limits.conf` file:

```
casper          hard    nofile          64000
```

And make sure the bottom part of the file contents looks similar to what is seen below:

```
#*               soft    core            0
#root            hard    core            100000
#*               hard    rss             10000
#@student        hard    nproc           20
#@faculty        soft    nproc           20
#@faculty        hard    nproc           50
#ftp             hard    nproc           0
#ftp             -       chroot          /ftp
#@student        -       maxlogins       4
casper          hard    nofile          64000

# End of file
```
