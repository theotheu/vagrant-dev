Installation of vagrant
-----------------------
- Go to https://www.virtualbox.org/wiki/Downloads and select virtualbox for your platform
- Go to http://www.vagrantup.com/downloads.html and select vagrant for your platform


Initialization
--------------
Download [this](https://github.com/theotheu/vagrant-dev/archive/master.zip) winzip repository to your local desktop.


Unzip the archive.

`cd vagrant-dev-master`

`vagrant up` 

Login 
-----
Mac/Linux users: ```ssh vagrant@localhost -p 2222```

For windows users, see below.


Port mapping
------------
The following ports are mapped: 

- 22 -> 2222 (ssh)
- 80 -> 10080 (apache)
- 3000 -> 13000 (node apps)
- 3306 -> 13306 (mysql)
- 27017 -> 17017 (mongo)

To see what apache is serving on your vagrant box, point your browser to http://localhost:10080


Stopping your machine
---------------------
When you execute `vagrant halt`, the machine is halted, but if you inspect with virtualbox, you will see that virtualbox did not kill the proces. 

To really close the virtual machine and leaving no processes, the procedure is:

1. Execute in the virtual machine `sudo halt` (vagrant will ask for your vagrant password, which is `vagrant`). This will stop the machine.
2. In virtualbox, stop the machine.


Windows
-------
Laatste versies van Virtualbox en Vagrant. Eerdere versies veroorzaken problemen.

de PATH omgevingsvariabele moet worden uitgebreid met het pad naar Virtualbox. Op mijn systeem nu b.v: 

```Path=C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\HashiCorp\Vagrant\bin;C:\Program Files\Oracle\VirtualBox```

(BTW: Ik startte een commandline box in Windows nadat ik Vagrant geinstalleerd had, en toen zat vagrant zelf ook nog niet in het PATH. Maar volgens Windows was dat wel zo. Ik sloot de commandline box, en startte een nieuwe. Dat was voldoende).

Gebruik [PUTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) om in te loggen:

`IP: 127.0.0.1`

`port: 2222`

`connection type: SSH`

`username: vagrant`

`password: vagrant`


