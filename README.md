# FunFunAndMoreFun

After ubuntu installation

1. install openssh-server so that we can log in remote
sudo apt-get update
sudo apt-get install openssh-server

2. download nvidia cuda toolkit. I am installing version 9.blah.blah

3. To install it we need to down ui. The nvidia cuda install conflicts with x11 config which is used to run ui.
	2 ways to solve the problem. 
	1. use the ssh client to get in from another machine or
	2. before logging into the ubuntu ui ctrl + alt + f1/f2 => gets u to terminal

Step 4 installing cuda

Credits to -> https://askubuntu.com/questions/799184/how-can-i-install-cuda-on-ubuntu-16-04

There is an Linux installation guide. However, it is basically only those steps:

    Download CUDA: I used the 15.04 version and "runfile (local)". That is 1.1 GB.
    Check the md5 sum: md5sum cuda_7.5.18_linux.run. Only continue if it is correct.
 1.   Remove any other installation (sudo apt-get purge nvidia-cuda* - if you want to install the drivers too, then sudo apt-get purge nvidia-*.)
 2.       If you want to install the display drivers(*), logout from your GUI. Go to a terminal session (ctrl+alt+F2)
 3.       Stop lightdm: sudo service lightdm stop
 4.       Create a file at /etc/modprobe.d/blacklist-nouveau.conf with the following contents: 
		blacklist nouveau
		options nouveau modeset=0
 5.       Then do: sudo update-initramfs -u
 6.   sudo sh cuda_9.0.176_384.81_linux.run --override. Make sure that you say y for the symbolic link.
        Start lightdm again: sudo service lightdm start
    Follow the command-line prompts


