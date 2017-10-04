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

Step 10: Even more fun part. Overclocking GPU's

Lets get the x11 configs going,

cat /etc/X11/xorg.conf
# nvidia-xconfig: X configuration file generated by nvidia-xconfig
# nvidia-xconfig:  version 384.81  (buildmeister@swio-display-x64-rhel04-18)  Sat Sep  2 02:28:25 PDT 2017

Section "ServerLayout"
    Identifier     "Layout0"
    Screen      0  "Screen0"
    InputDevice    "Keyboard0" "CoreKeyboard"
    InputDevice    "Mouse0" "CorePointer"
EndSection

Section "Files"
EndSection

Section "InputDevice"
    # generated from default
    Identifier     "Mouse0"
    Driver         "mouse"
    Option         "Protocol" "auto"
    Option         "Device" "/dev/psaux"
    Option         "Emulate3Buttons" "no"
    Option         "ZAxisMapping" "4 5"
EndSection

Section "InputDevice"
    # generated from default
    Identifier     "Keyboard0"
    Driver         "kbd"
EndSection

Section "Monitor"
    Identifier     "Monitor0"
    VendorName     "Unknown"
    ModelName      "Unknown"
    HorizSync       28.0 - 33.0
    VertRefresh     43.0 - 72.0
    Option         "DPMS"
EndSection

Section "Device"
    Identifier     "Device0"
    Driver         "nvidia"
    VendorName     "NVIDIA Corporation"
EndSection

Section "Screen"
    Identifier     "Screen0"
    Device         "Device0"
    Monitor        "Monitor0"
    DefaultDepth    24
    SubSection     "Display"
        Depth       24
    EndSubSection
EndSection


will return a list like so. Since the display is connected to only 1 of my display card it shows only 1 device and screen connfig. Lets generate configs for all gpus. In my case there are 2 nvidia 1070s

sudo nvidia-xconfig --enable-all-gpus
[sud0] => password here &

Using X configuration file: "/etc/X11/xorg.conf".
Backed up file '/etc/X11/xorg.conf' as '/etc/X11/xorg.conf.backup'
New X configuration file written to '/etc/X11/xorg.conf'

our new x11 config will looks like this,

cat /etc/X11/xorg.conf
# nvidia-xconfig: X configuration file generated by nvidia-xconfig
# nvidia-xconfig:  version 384.81  (buildmeister@swio-display-x64-rhel04-18)  Sat Sep  2 02:28:25 PDT 2017


Section "ServerLayout"
    Identifier     "Layout0"
    Screen      0  "Screen0"
    Screen      1  "Screen1" RightOf "Screen0"
    InputDevice    "Keyboard0" "CoreKeyboard"
    InputDevice    "Mouse0" "CorePointer"
EndSection

Section "Files"
EndSection

Section "InputDevice"

    # generated from default
    Identifier     "Mouse0"
    Driver         "mouse"
    Option         "Protocol" "auto"
    Option         "Device" "/dev/psaux"
    Option         "Emulate3Buttons" "no"
    Option         "ZAxisMapping" "4 5"
EndSection

Section "InputDevice"

    # generated from default
    Identifier     "Keyboard0"
    Driver         "kbd"
EndSection

Section "Monitor"
    Identifier     "Monitor0"
    VendorName     "Unknown"
    ModelName      "Unknown"
    HorizSync       28.0 - 33.0
    VertRefresh     43.0 - 72.0
    Option         "DPMS"
EndSection

Section "Monitor"
    Identifier     "Monitor1"
    VendorName     "Unknown"
    ModelName      "Unknown"
    HorizSync       28.0 - 33.0
    VertRefresh     43.0 - 72.0
    Option         "DPMS"
EndSection

Section "Device"
    Identifier     "Device0"
    Driver         "nvidia"
    VendorName     "NVIDIA Corporation"
    BoardName      "GeForce GTX 1070"
    BusID          "PCI:1:0:0"
EndSection

Section "Device"
    Identifier     "Device1"
    Driver         "nvidia"
    VendorName     "NVIDIA Corporation"
    BoardName      "GeForce GTX 1070"
    BusID          "PCI:6:0:0"
EndSection

Section "Screen"
    Identifier     "Screen0"
    Device         "Device0"
    Monitor        "Monitor0"
    DefaultDepth    24
    SubSection     "Display"
        Depth       24
    EndSubSection
EndSection

Section "Screen"
    Identifier     "Screen1"
    Device         "Device1"
    Monitor        "Monitor1"
    DefaultDepth    24
    SubSection     "Display"
        Depth       24
    EndSubSection
EndSection

Now it has both the devices.


Step 11: Lets set the coolbits option

This will allow us to overclock gpus. 

sudo nvidia-xconfig -a --cool-bits=28 

thats it.  as simple as that.

now out xorg.conf will have coolbits set

Section "Screen"
    Identifier     "Screen0"
    Device         "Device0"
    Monitor        "Monitor0"
    DefaultDepth    24
    Option         "Coolbits" "28"
    SubSection     "Display"
        Depth       24
    EndSubSection
EndSection

Section "Screen"
    Identifier     "Screen1"
    Device         "Device1"
    Monitor        "Monitor1"
    DefaultDepth    24
    Option         "Coolbits" "28"
    SubSection     "Display"
        Depth       24
    EndSubSection
EndSection

 
Step: 12 finally overclocking.

After adding coolbits. We need a restart.

now lets create a bin file with this, +1300 memclock & +100 cpu clock

nvidia-settings -c :0 -a '[gpu:0]/GPUMemoryTransferRateOffset[3]=1300'
nvidia-settings -c :0 -a '[gpu:1]/GPUMemoryTransferRateOffset[3]=1300'
nvidia-settings -c :0 -a '[gpu:0]/GPUGraphicsClockOffset[3]=100'
nvidia-settings -c :0 -a '[gpu:1]/GPUGraphicsClockOffset[3]=100


this will print a confirmation like Attribute set to 1300

now our miner will # better 

ETH - Total Speed: 53.063 Mh/s, Total Shares: 1, Rejected: 0, Time: 00:02
ETH: GPU0 26.518 Mh/s, GPU1 26.545 Mh/s
GPU0 t=69C fan=45%, GPU1 t=68C fan=44%
ETH: 10/04/17-00:18:33 - New job from eth-us-west1.nanopool.org:9999
ETH - Total Speed: 53.044 Mh/s, Total Shares: 1, Rejected: 0, Time: 00:02
ETH: GPU0 26.514 Mh/s, GPU1 26.530 Mh/s
ETH: 10/04/17-00:18:45 - SHARE FOUND - (GPU 1)
ETH: Share accepted (167 ms)!
GPU0 t=70C fan=46%, GPU1 t=69C fan=44%
GPU0 t=71C fan=46%, GPU1 t=70C fan=45%
GPU0 t=73C fan=47%, GPU1 t=71C fan=46%
ETH: 10/04/17-00:20:17 - New job from eth-us-west1.nanopool.org:9999
ETH - Total Speed: 62.676 Mh/s, Total Shares: 2, Rejected: 0, Time: 00:04
ETH: GPU0 31.198 Mh/s, GPU1 31.478 Mh/s

#jumpled from 26.5 to 31.2 => 18.8 percent better #rate

i am going to do  better and set it to 1400 now,


ETH - Total Speed: 62.869 Mh/s, Total Shares: 5, Rejected: 0, Time: 00:07
ETH: GPU0 31.417 Mh/s, GPU1 31.451 Mh/s
GPU0 t=76C fan=50%, GPU1 t=75C fan=49%
GPU0 t=76C fan=50%, GPU1 t=75C fan=49%
GPU0 t=76C fan=50%, GPU1 t=75C fan=49%
GPU0 t=75C fan=50%, GPU1 t=75C fan=49%
ETH: 10/04/17-00:25:26 - New job from eth-us-west1.nanopool.org:9999
ETH - Total Speed: 63.609 Mh/s, Total Shares: 5, Rejected: 0, Time: 00:09
ETH: GPU0 31.791 Mh/s, GPU1 31.818 Mh/s
ETH: 10/04/17-00:25:39 - New job from eth-us-west1.nanopool.org:9999
ETH - Total Speed: 63.589 Mh/s, Total Shares: 5, Rejected: 0, Time: 00:09
ETH: GPU0 31.755 Mh/s, GPU1 31.834 Mh/s


This is just a marginal increase. so am planning to stick with 1300 for now.

step 13: reduce power


sudo nvidia-smi -i 0 -pl 100
sudo nvidia-smi -i 1 -pl 100

current #rate:
ETH - Total Speed: 62.889 Mh/s, Total Shares: 14, Rejected: 0, Time: 00:16
ETH: GPU0 31.441 Mh/s, GPU1 31.447 Mh/s

so reducing power had no effect on #rate!!! Thats super coolW

special thanks to->

https://gist.github.com/bsodmike/369f8a202c5a5c97cfbd481264d549e9

