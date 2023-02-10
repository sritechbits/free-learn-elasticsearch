# free-learn-elasticsearch
This is for learning and mastering elasticsearch.


Here I will be updating the files as I am creating them , so we understand the thought process of setting up the environment. 
We will be creating a personal sandbox docker container and will be experimenting from that host. 

Learnings : 
1. https://collabnix.com/choosing-the-right-docker-image-for-your-apple-m1-pro/
2. 
# personal-sandbox.DockerFile

Creating own docker Image , which would act like a sandbox throughout learning process. 
Goal of this docker creation is to understand and learn the docker basic while we move forward . 

Command To Build the docker Image : 
## docker build  -t mysandbox:1.0.0 -f dockerFiles/personal-sandbox.DockerFile .


Command to run the image and get into shell
## docker run -it mysandbox:1.0.0 /bin/sh


Notice How I am able to accesss these basic command in this shell ( which is just 5mb )
What commands are available you can check in /bin folder. It would appear something like this

```
/bin # ls
arch           dnsdomainname  hostname       mkdir          printenv       stty
ash            dumpkmap       ionice         mknod          ps             su
base64         echo           iostat         mktemp         pwd            sync
bbconfig       ed             ipcalc         more           reformime      tar
busybox        egrep          kbd_mode       mount          rev            touch
cat            false          kill           mountpoint     rm             true
chgrp          fatattr        link           mpstat         rmdir          umount
chmod          fdflush        linux32        mv             run-parts      uname
chown          fgrep          linux64        netstat        sed            usleep
cp             fsync          ln             nice           setpriv        watch
date           getopt         login          pidof          setserial      zcat
dd             grep           ls             ping           sh
df             gunzip         lzop           ping6          sleep
dmesg          gzip           makemime       pipe_progress  stat
```