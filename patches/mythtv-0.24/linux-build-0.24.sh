#!/bin/sh
#check if we have the right MythTV version first...
if [ "`grep -c -e release-0-24 version.pro`" -eq "0" ];
then
    echo 'Incorrect version of MythTV. This patch has only been tested with release 0.24'
    exit
fi

# check if patch file exists, apply patch if it does, rename diff file 
# if successfully patched
test -e upnp-wemedia-patch-0.24.diff && echo 'Applying patch...' \
&& patch -p0 -i ./upnp-wemedia-patch-0.24.diff \
&& mv ./upnp-wemedia-patch-0.24.diff ./upnp-wemedia-patched-0.24.diff

test ! -e upnp-wemedia-patched-0.24.diff && echo 'Patch could not be applied successfully... Quitting build.' && exit
 
# Run ./configure only if Makefile does not exist (i.e. if Makefile does not 
# exit, configure has not been run before). This check is to avoid overwriting
# anybody's custom configuration settings with the default.
test ! -e ./Makefile && echo 'Running ./configure' && ./configure

echo 'Building and installing mythtv (installing needs administrator password)...'
make && sudo make install
