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
 7. once done it will complain about nouveau - lets restart

 8.  once restarted lets kill lightdm : step 3
 9.  then, sudo sh cuda_9.0.176_384.81_linux.run --override -> This time the installation will complete successfully

u will see a summary like so

===========
= Summary =
===========

Driver:   Installed
Toolkit:  Installed in /usr/local/cuda-9.0
Samples:  Installed in /home/avenger, but missing recommended libraries

Please make sure that
 -   PATH includes /usr/local/cuda-9.0/bin
 -   LD_LIBRARY_PATH includes /usr/local/cuda-9.0/lib64, or, add /usr/local/cuda-9.0/lib64 to /etc/ld.so.conf and run ldconfig as root

To uninstall the CUDA Toolkit, run the uninstall script in /usr/local/cuda-9.0/bin
To uninstall the NVIDIA Driver, run nvidia-uninstall

Please see CUDA_Installation_Guide_Linux.pdf in /usr/local/cuda-9.0/doc/pdf for detailed information on setting up CUDA.

Yeyyyy!!! now cuda 9 is installed !!

You can run nvidia-smi 

Tue Oct  3 23:09:09 2017       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 384.81                 Driver Version: 384.81                    |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  GeForce GTX 1070    Off  | 00000000:01:00.0 Off |                  N/A |
|  0%   38C    P0    33W / 151W |      0MiB /  8110MiB |      2%      Default |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID   Type   Process name                             Usage      |
|=============================================================================|
|  No running processes found                                                 |
+-----------------------------------------------------------------------------+



Pooofff that was a long step4. Dont worry thats the hardest step. It will be fun from now on.

Step5: Lets get claymore

url = https://github.com/nanopool/Claymore-Dual-Miner/releases/download/v10.0/Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal.AMD.NVIDIA.GPU.Miner.v10.0.-.LINUX.tar.gz

wget <url> => brings the tar.gz

Step6: Lets extract

tar xvf <tar.gz> file

step7: starting with eth config

modify the stat_only_eth.bash 

this line => ./ethdcrminer64 -epool eth-eu1.nanopool.org:9999 -ewal YOUR_WALLET/YOUR_WORKER/YOUR_EMAIL -epsw x -mode 1 -ftime 10 

should look like this,

./ethdcrminer64 -epool eth-eu1.nanopool.org:9999 -ewal 0xa90221e1ee66582dfd1bafc7c534e9e7ed6ab7ea/avenger/pravinpuma@gmail.com -epsw x -mode 2 -ftime 10

be sure to change the eth_address!!! If not thank you for donations :) Highly appreciate it.


step 8: lets fix teh pools

in the above command lets change the pool

i am in us-west hence switching the pool to => eth-us-west1.nanopool.org:9999

and my epools.txt looks like,

#POOL: eth-us-west1.nanopool.org:9999, WALLET: YOUR_WALLET/YOUR_WORKER/YOUR_EMAIL, PSW: x, WORKER: , ESM: 0, ALLPOOLS: 0
POOL: eth-us-east1.nanopool.org:9999, WALLET: YOUR_WALLET/YOUR_WORKER/YOUR_EMAIL, PSW: x, WORKER: , ESM: 0, ALLPOOLS: 0
POOL: eth-eu1.nanopool.org:9999, WALLET: YOUR_WALLET/YOUR_WORKER/YOUR_EMAIL, PSW: x, WORKER: , ESM: 0, ALLPOOLS: 0
POOL: eth-eu2.nanopool.org:9999, WALLET: YOUR_WALLET/YOUR_WORKER/YOUR_EMAIL, PSW: x, WORKER: , ESM: 0, ALLPOOLS: 0
POOL: eth-asia1.nanopool.org:9999, WALLET: YOUR_WALLET/YOUR_WORKER/YOUR_EMAIL, PSW: x, WORKER: , ESM: 0, ALLPOOLS: 0

commented first one since am passing it as a param for ethdcrminer64


Step 9:

Now lets start the run and let it rain some ether

./start_only_eth.bash 

logs will look like this,

ETH: 10/03/17-23:27:04 - SHARE FOUND - (GPU 0)
ETH: Share accepted (165 ms)!
ETH: 10/03/17-23:27:09 - New job from eth-us-west1.nanopool.org:9999
ETH - Total Speed: 26.561 Mh/s, Total Shares: 2, Rejected: 0, Time: 00:00
ETH: GPU0 26.561 Mh/s

which means that we mean business!!


