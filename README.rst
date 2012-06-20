###########################
marmelune.vagrantboxbuilder
###########################

Automate the creation of `Vagrant base boxes`_.

.. warning:: This work is experimental.


*********
Resources
*********

* `Code repository`_
* `Bugtracker`_


*****
Usage
*****

* Install `VirtualBox`_ and `Vagrant`_.
* Install marmelune.vagrantboxbuilder. As an example with
  ``pip install git+https://github.com/benoitbryon/marmelune.vagrantboxbuilder.git``
* You got a ``vagrantboxbuilder`` command.
* Get or create an operating system ISO which installs Vagrant requirements. As
  an example, you can use `marmelune.debianisobuilder`_'s and its `preseed file
  for Vagrant`_.
* Optionally get or create a `Vagrantfile`_. As an example, use the `sample
  Vagrantfile`_ at marmelune.vagrantboxbuilder.
* Run
  ``vagrantboxbuilder --iso=path/to/installer.iso --vagrant-file=path/to/Vagrantfile --vagrant-box=path/to/output.box``
* You got a .box file.


*****************
How does it work?
*****************

Vagrantboxbuilder...

* creates a temporary virtual machine in VirtualBox.
* boots the VM on the iso file.
* waits for the installation to finish (user interaction required). The
  installation is "finished" when Vagrant stuff is installed on the machine and
  the machine is shutdown.
* packages the box.
* destroys the temporary VM from VirtualBox.


**********
Contribute
**********

* Install prerequisites:

  * `VirtualBox`_ version 4.1.10 (other versions have not been tested)
  * `Vagrant`_ version 1.0.2 (other versions have not been tested)

* Clone the `code repository`_
* ``cd marmelune.vagrantboxbuilder``
* ``make install``


**********
References
**********

.. `Vagrant base boxes`: http://vagrantup.com/v1/docs/base_boxes.html
.. `Code repository`:
    https://github.com/benoitbryon/marmelune.vagrantboxbuilder
.. `Bugtracker`: 
    https://github.com/benoitbryon/marmelune.vagrantboxbuilder/issues
.. `VirtualBox`: https://www.virtualbox.org/
.. `Vagrant`: http://vagrantup.com/
.. `marmelune.debianisobuilder`:
    https://github.com/benoitbryon/marmelune.debianisobuilder
.. `preseed file for Vagrant`:
   https://raw.github.com/benoitbryon/marmelune.debianisobuilder/master/etc/preseed-squeeze-vagrant-fr.cfg
.. `Vagrantfile`: http://vagrantup.com/v1/docs/vagrantfile.html
.. `sample Vagrantfile`:  
   https://raw.github.com/benoitbryon/marmelune.vagrantboxbuilder/master/etc/Vagrantfile
