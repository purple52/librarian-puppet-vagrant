# Librarian-puppet-vagrant

This is a little example framework that shows how you can use
[Librarian-puppet](https://github.com/rodjek/librarian-puppet) to manage
[Puppet](http://puppetlabs.com/) modules when provisioning a virtual manchine
managed using [Vagrant](http://vagrantup.com).

## Why?

No-one likes re-inventing the wheel, but using existing Puppet modules can be a
fiddle unless you use something to manage download and installation. If you're
using Vagrant and stand-alone Puppet to manage a VM, it can be even more of a fiddle. 
Do you clone the modules from various git repositories? Create them as submodules
in your own repository? Install them on the host, or on the guest?

Librarian-puppet can help by managing the Puppet modules used by your Vagrant
box. But, there is a problem: you can't use Puppet to install Librarian-puppet
because your Puppet manifests won't compile until your modules are installed.

## Solution

The simple solution implemented here uses a shell provisioner in your Vagrant
configuration to install and run Librarian-puppet before your Puppet provisioner runs.

## How to use

This repository is really just a template; copy the relevant files into your
own project. Here's a breakdown of what's required:

* `Vagrantfile` - the included example has three important sections:
    + A VirtualBox configuration line to allow symlinking in your Vagrant root
    + A shell provisioner definition
    + A Puppet provisioner definition
* `shell/main.sh` - a simple shell provisioner to install and run Librarian-puppet.
Note that it requires git to be installed on your VM, so either install it on your basebox
or add a line in the shell provisioner to install it; an example is in the file.
* `puppet/Puppetfile` - configuration describing what Puppet modules to install. See the
[Librarian-puppet](https://github.com/rodjek/librarian-puppet) project for details.
* `puppet/manifests/main.pp` - your main Puppet manifest.
* `puppet/.gitignore` - configured to ignore temporary directories and files created by Librarian-puppet.
* `puppet/modules/.gitignore` - to force an empty directory to be created for your modules to be installed in.
them. 
to

## Contribute

Patches and suggestions welcome.

## Issues

Please raise issues via the github issue tracker.

## License

Please see the [LICENSE](https://github.com/purple52/librarian-puppet-vagrant/blob/master/LICENSE)
file.
