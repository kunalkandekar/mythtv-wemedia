MYTHTV UPNP/WEMEDIA PATCH VERSION 1.0
-------------------------------------
The WeMedia project involved a DLNA/UPnP-based home networked system comprising:
1. multiple UPnP devices on a local home network;
2. a custom Aggregator application that aggregated content from all devices on 
   the LAN;
3. a UPnP-compliant DVR service (MythTV);
4. and a client that interfaced with the Aggregator UPnP server and presented 
   the aggregated content for consumption in a unified, user-friendly UI.
   
The following patches apply only to the **MythTV aspects** of the system. 

*** Note that these changes haven't been updated to work with MythTV versions 
post-0.23 (currently at 0.26) which is a considerable amount of work, 
especially considering the extensive changes that happened to the UPnP 
components post-0.24.

This patch and script will apply the changes to add previously missing UPnP
services like A/V Transport and Scheduled Recording Services, that enable 
UPnP/DLNA-compliant applications (like the WeMedia server and client) to talk to
the MythTV backend. This lets you watch live TV and schedule recordings on 
MythTV from the DLNA clients like WeMedia.  

The patch also includes a live TV transcoder component, which can transcode the
live TV file to Flash video as it is recording and stream it to a client over 
HTTP.

Since UPnP is a universal specification, any UPnP enabled client other than 
WeMedia *should* be able to talk to MythTV as well. However, this may not always
be the case due to minor differences in implementation. We have only tested 
these changes with the WeMedia client. You are welcome to try it with other UPnP
clients and let us know how it goes!


MYTHTV DOWNLOAD INSTRUCTIONS
----------------------------
This patch has only been tested with the mythtv-0.22-fixes and mythtv-0.23 
releases of MythTV on Ubuntu Linux. Those versions are available for download 
at:
* release 0.23 
HTTP - http://www.mythtv.org/download/mythtv/0.23
FTP  - ftp://ftp.osuosl.org/pub/mythtv/mythtv-0.23.tar.bz2

* 0.22-fixes 
HTTP - http://www.mythtv.org/download/mythtv/0.22
FTP  - ftp://ftp.osuosl.org/pub/mythtv/mythtv-0.22.tar.bz2

If you prefer to check it out from MythTV's Subversion repository:
svn co http://svn.mythtv.org/svn/branches/release-0-23-fixes/ mythtv-0-23

Or, for version 0.22-fixes: 
svn co http://svn.mythtv.org/svn/branches/release-0-22-fixes/ mythtv-0-22


EXTRACTION
----------
Extract the install files from the mythtv-patch installation package. 
The following files are included:
- README.txt
- DEVNOTES.txt
- gpl.txt
- mythtv-0.23/linux-build-0.23.sh
- mythtv-0.23/upnp-wemedia-patch-0.23.diff


BUILD AND INSTALLATION INSTRUCTIONS
-----------------------------------
The provided install script will check if the download is the right version, 
apply the patch, and if successfully applied will configure and build the 
source. 

* For MythTV Version 0.23
1. Copy the mythtv-0.23/linux-build-0.23.sh script and the 
   mythtv-0.23/upnp-wemedia-patch-0.23.diff patch file to the root of 
   the mythtv source directory. 
2. Run ./linux-build-0.23.sh.
3. When prompted, enter the administrator password.


CONFIGURE SETTINGS
------------------
The script runs configure with the default settings. If you have your own custom
settings, run ./configure yourself before running the script,and include 
whatever settings you want. If you are running the script in a pre-built MythTV
directory, it will not run configure and so should not overwrite your 
configuration settings.


OS
--
We have only built and tested these changes on Ubuntu Linux Jaunty 9.04
and later. However, there is no reason why they should not work on other
OSs that MythTV runs on.


TUNER
-----
All tests have been run with the HDHomeRun TV Tuner.


UNINSTALLATION INSTRUCTIONS
---------------------------
If for some reason you have problems with MythTV that you think are 
caused by this patch, you can reverse the patch to undo the changes by 
running this command in the root source directory:
  patch -R -p0 -i upnp-wemedia-patched-0.23.diff

Then run "make && sudo make install" to build and install the original
version.


CAVEATS
-------
This is only a prototype project, and has not been tested extensively. There are
undoubtedly many issues herein.

It is meant for developers and tech-savvy users to experiment with, especially 
if they are interested in new, visually appealling and user-friendly ways to 
explore and view video. This is the goal of the WeMedia project.

Some parts of it may potentially be incorporated into MythTV if the maintainers 
feel they are useful, such as the UPnP components.