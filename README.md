# FunFunAndMoreFun

After ubuntu installation

1. install openssh-server so that we can log in remote
sudo apt-get update
sudo apt-get install openssh-server

2. download nvidia cuda toolkit. I am installing version 9.blah.blah

3. To install it we need to down ui. The nvidia cuda install conflicts with x11 config which is used to run ui.
	2 ways to solve the problem. 
	1. use the ssh client to get in from another machine or
	2. before logging into the ubuntu ui ctrl + shift + f1/f2 => gets u to terminal

4. stop lightdm -> x11 ui 
	sudo service lightdm stop

5. now get on with cuda installation
	sudo sh cuda_9.0.176_384.81_linux.run

	 
