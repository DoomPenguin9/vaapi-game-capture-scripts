Some simple scripts for recording gameplay with sound on Linux using FFMPEG VAAPI and kmsgrab.

# Requirements
+ An AMD GPU(R9 Fury or newer)
+ libva-mesa-driver
+ tmux
+ ffmpeg

# Usage
By default, this is setup for 1440p@60fps capture at a bitrate of 60 000kbps, you can change the bitrate by changing `-b:v 60M` to whatever you want your bitrate to be. I recommend adding the scripts to your `$PATH` so that you can execute them from anywhere. To do this, open your .bashrc(or.zshrc if you are using zsh for your shell) and paste the folioing at the end of the file:

```
export PATH=$PATH:"/home/$USER/vaapi-game-capture-scripts:$PATH"
alias vpcapture="recording-script.sh"
alias vpmerge="merging.sh"

```

Now you can run the recording script by opening a terminal, starting `tmux`, typing `vpcapture`, and pressing enter. To stop the recording, press Ctrl + C to kill each of the 2 processes running in the terminal. Then you can navigate to directory where you saved your recordings and run `vpmerge` to put the audio and video files together and (optionally)delete the original separate files. 
