1. Installation of vagrant
-----------------------
- Go to https://www.virtualbox.org/wiki/Downloads and select virtualbox for your platform
- Go to http://www.vagrantup.com/downloads.html and select vagrant for your platform


2. Initialization
--------------
Download [this](https://github.com/theotheu/vagrant-dev/archive/master.zip) winzip repository to your local desktop.


Unzip the archive.

_Windows users: follow the additional step in section 99 below._

`cd vagrant-dev-master`

`vagrant up`


NOTE: Never, ever start the vagrant box from within virtualbox. The only way you can start vagrant, is by executing ```vagrant up```



3. Login
-----
Mac/Linux users: `ssh vagrant@localhost -p 2222`

Windows users: use Putty.exe to access your virtual machine with the following
parameters:
   - IP address: `127.0.0.1`
   - port: `2222`
   - connection type: `SSH`
   - username: `vagrant`

Mac/Linux/Windows users: The password is `vagrant`


4. Directory mapping
-----------------
You can access directories on the virtual machine.

The following directories are mapped:

- ```/home/vagrant``` (virtual machine) -> ```vagrant-dev-master/home``` (your laptop)
- ```/var/www``` (virtual machine) ->  ```vagrant-dev-master/www``` (your laptop)


5. Port mapping
------------
The following ports are mapped:

Virtual machine on the left, your laptop on the right.

- 22 -> 2222 (ssh)
- 80 -> 10080 (apache)
- 3000 -> 13000 (node apps)
- 3306 -> 13306 (mysql)
- 27017 -> 17017 (mongo)

To see what apache is serving on your vagrant box, point your browser to http://localhost:10080


6. Stopping your machine
---------------------
When you execute `vagrant halt`, the machine is halted, but if you inspect with virtualbox, you will see that virtualbox did not kill the proces.

To really close the virtual machine and leaving no processes, the procedure is:

1. Execute in the virtual machine `sudo halt` (vagrant will ask for your vagrant password, which is `vagrant`). This will stop the machine.
2. In virtualbox, stop the machine.


99. Extra installation steps for Windows users
-------
-  Make sure you're using the latest releases of both VirtualBox for Windows and
   Vagrant for Windows. Earlier versions are likely to cause problems.

-  Once you've installed both VirtualBox and Vagrant, you'll have to make sure Vagrant
   can find the commands to control VirtualBox. This works by making sure **the PATH
   environment variable** point to the right directories:
   -  Find out in what directories on your harddisk both Vagrant and VirtualBox are installed.
   -  Write down the complete paths to those two those two directories. Add `\bin` the the Vagrant directory.<br> For example: if you've
      installed Vagrant in it's default location, that would be the path `C:\HashiCorp\Vagrant\bin`, and if VirtualBox is in it's default location, that would be
      `C:\Program Files\Oracle\VirtualBox`.
   -  change the PATH envoronment variable for your windows setup by adding both installation directories
      to it.
      -  use [this article](http://computertutorialsonline.com/change-path-environment-variable-in-windows-8)
         for guidance on how to change the path variable.
      -  keep in mind that teh PATH variable wants semi-colons '**;**' between direcories on the path. So the
         last part of the PATH should look like this (if you've installed everything in the default location:
         `;C:\HashiCorp\Vagrant\bin;C:\Program Files\Oracle\VirtualBox` (note the semi-colons).


99.1 Troubelshooting (windows)
--------

![Troubleshooting](http://i.imgur.com/reeoD1D.png)

1. Remove Oracle virtualbox
2. Download an older version, eg. [4.3.12 https://www.virtualbox.org/wiki/Download_Old_Builds_4_3](4.3.12 https://www.virtualbox.org/wiki/Download_Old_Builds_4_3)
3. New install 
4. Execute ```vagrant up```. ! :)


99.2 Troubleshooting (windows)
----------

![Troubleshooting](http://i.imgur.com/R77oCWZ.png)

This error appears when installing vagrant after virtualbox.

This is **not** an error and can be ignored. Just click OK.

99.3 Troubleshooting (windows)
----------

![Troubleshooting](http://i.imgur.com/pxgkMqE.png)

Happens in some installations after starting virtualbox.

This is **not** an error and can be ignored. Just click OK.

NOTE: Never, ever start the vagrant box from within virtualbox. The only way you can start vagrant, is by executing ```vagrant up```

















