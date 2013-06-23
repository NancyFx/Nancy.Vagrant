Nancy.Vagrant
=============

Vagrant scripts for quickly setting up a Linux/Mono environment, on Windows or Mac OX, for testing/bugfixing Mono releated issues with Nancy.

Using these scripts you can run the Nancy build and tests in either a Mono 2.x, or Mono 3.x Linux environment, without any knowledge of Linux, and while still being able to edit the files in Visual Studio (or your editor of choice) on your local machines. The scripts are designed to lower the bar when it comes to resolving problems Mono problems with pull requests.

Initial Setup / Prerequisites
=============================

1. Install Vagrant from http://www.vagrantup.com/
2. Install VirtualBox - NOTE: If you are running on Windows 8 please make sure not to install the network drivers, as explained in this post: http://www.grumpydev.com/2013/06/19/windows-8-hyper-v-virtualbox-vagrant-and-hanging-on-boot/

Getting Started
===============

There's a few steps here, but it's very very straightforward. All commands that you have to type are in quotes - but don't type the quotes :-)

1. Either clone this repository locally, or manually grab the vagrantfile and bootstrap.sh from the folder representing the version of Mono you want to test on.
2. Drop to a command prompt - we'd recomment using something like [Console2](http://sourceforge.net/projects/console/) if you're going to do a lot of command line work.
3. Switch to the directory containing the vagrantfile and bootstrap.sh
4. Type `vagrant up`  - this will download a base virtual machine and set it up for you. It takes a few minutes, so go grab a beverage of your choosing.
5. Once that's finished, clone (or copy) your Nancy repository into the same directory as the vagrantfile and bootstrap.sh. This directory is going to be shared between the host machine (your actual machine), and the virtual machine that you're going to be using to run the build.
6. Type `vagrant ssh` - this will connect to the virtual machine and drop you to a Linux command prompt with some simple instructions.
7. Type `cd Nancy` (or whatever the directory is called where your repository is cloned to)
8. Type `rake mono` - this will build the solution and run all the tests. If a test fails, or something fails to build, just scroll up the build log until you can see what went wrong. There's a lot of output generated, but it should be obvious what's gone wrong.
9. Fire up Visual Studio on your local machine (or your editor of choice), open the SLN from the directory you cloned it to (the one that also contains the vagrantfile and bootstrap.sh) and make any edits you need to fix the problem, or help narrow it down.
10. Go back to step 8 and repeat - because the directory is shared between the host and the virtual, any changes you make locally will be automatically picked up by the build inside the virtual machine.
11. When you're all fixed, type `exit` into the virtual machine command prompt and it will drop you back into your local command prompt. Commit your changes to git as you would normally and you're all done.

When You're Finished
====================

When you're all done fixing the issue, you have two alternatives. You can run `vagrant destroy`, which will completely delete the virtual machine and clear up all the disk space, but next time you want to use it you will have to wait while it's recreated. The other option is `vagrant halt`, which will stop the virtual machine but not delete it. It will continue to take up some disk space, but next time you want to use it the `vagrant up` command will be much faster.

Some Things To Note
===================

If you want to move around inside the virtual machine there's some very simple unix commands/things you will need to know.

* Case sensitivity - the file system is case sensitive, so `cd nancy` is not the same thing as `cd Nancy` - if it tells you a file or folder doesn't exist, check your casing.
* `ls` - shows the files in the current directory, it's the equivilent of `dir` in the Windows command prompt.
* `cd` - changes directory, bear in mind the case sensitivity issue above, and the fact you have to put a space after the `cd` (which you don't have to in Windows). Also the directory separator is a forward slash `/` not a backslash `\` like it is on Windows.
* If you want to get back to the shared directory (where the vagrantfile, bootstrap.sh and your cloned code is), just type `cd /vagrant`

