
What are packages? You may know them as Chrome, Photoshop, etc and they are, but what they really are just lots and lots of files that have been compiled into one.

Repositories are just a central storage location for packages. There are tons of repositories that hold lots of packages and best of all they are all found on the internet, no silly installation disks. Your machine doesn't know where to look for these repositories unless you explicitly tell it where to look

Your distribution already comes with pre-approved sources to get packages from and this is how it installs all the base packages you see on your system. On a Debian system, this sources file is the **/etc/apt/sources.list** file. Your machine will know to look there and check for any source repositories you added.


=> Package dependencies: 

In Linux, these dependencies are often other packages or shared libraries. Shared libraries are libraries of code that other programs want to use and don't want to have to rewrite for themselves.


=> Compile Source code: 

1. Before doing anything, read the README or INSTALL file inside the package
2. Mostly basic make compilation will be used
3. There will be a configure script, which checks for dependencies on your system. 
4. Inside the package, a Makefile will be present, that contains the rules to build the software. This file is used by the make command
5. sudo make install - this copies the correct files to the correct locations
6. To uninstall the package - sudo make uninstall

- one disadvantage is that, there may be hundreds of directories, files copied during the installation process, and sudo make uninstall doesnt remove everything. So to make this easier checkinstall is used.
			sudo checkinstall

- this will basically build a .deb package which makes it easier to remove the package later on