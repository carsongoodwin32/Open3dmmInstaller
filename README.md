# Open3dmmInstaller
Open Source 3D Movie Maker Installer

Currently only tested with Windows XP :)

# How to Use:
This initial version only works if you package everything into a folder named cd3 (complete 3dmovie folder,mmcat,pss,samples,etc). Eventually I think I'll probably just rewrite this in C and make it basically a drop in replacement for the setup.exe that's provided with the retail disk.

Basically tl;dr:
1. make a folder called cd3
2. make sure all the files are in there (if using the build by NCommander, you'll need to supplement a few files (.chk's, .exe's, a couple other things)
3. place the .bat right next to the cd3 folder and run it
4. You should get a similar result to using the official setup.exe (meaning 3DMM won't run and you'll either need to noCD patch it or copy the rest of the 3dmovie folder to the appropriate directory yourself)
5. ???
6. Profit

# Epilogue 

I don't claim that this code works 100%. I still need to see if there are any Windows 9x specific install quirks (to be honest I haven't looked much into it I just read a @Foone tweet that said that something like this hadn't been made yet and I wanted to try my hand at it.)

If you're reading this, @Foone, you do cool stuff and I like your tweets.

Thanks to everyone involved in the 3DMM open sourcing effort for preserving a part of history.
