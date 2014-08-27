Installation of vagrant
-----------------------
- Go to https://www.virtualbox.org/wiki/Downloads and select virtualbox for your platform
- Go to http://www.vagrantup.com/downloads.html and select vagrant for your platform


Initialization
--------------
`git clone https://github.com/theotheu/vagrant-dev.git`

`cd vagrant-dev`

`vagrant up`

For windows users, see below.

Connecting
----------
`vagrant ssh`

Destroying
----------
`vagrant destroy`




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
