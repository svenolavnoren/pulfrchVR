# pulfrichVR
pulfrichVR is a small, practical tool for creating high-quality stereo 3D-360 images from 360° video clips.
Workflow (high level):

1) Shoot a video with Insta 360 where the camera is moving horisontally in a calm non-moving environment. 
2) Export 360 video with Insta360 Studio
3) Step trough the video, find Left eye and Right eye, click camera movement direction, press E.   
4) For each export (E) a new bat file is created. This bat file is your master or negative.
5) 360 bat runner helps you manage your negatives and transform them into jpg images whenever you like.
6) Copy to a VR device. My tried and tested combo: Meta quest 3 and Skybox VR video player.


## Windows quick start

Background: pulfrichVR has been tested on Windows 11 and Linux Mint on 64-bit x86 hardware.  
ARM is untested for now.

1. Install Python 3.11 or newer from [python.org](https://www.python.org/downloads/).

2. Download the latest `pulfrichVR...windows.zip` from the **Releases** page of this repository and unzip it, for example to:

```text
C:\pulfrichVR
```

This folder should contain:
```text 
pulfrichVR.py, run_pulfrichVR.bat, requirements.txt, LICENSE, NOTICE, README.md
```
Install FFmpeg:

Go to [ffmpeg.org](https://ffmpeg.org/download.html)
and download a full build for Windows. By selecting a full build you ensure your ffmpeg has libsvtav1.

Make sure your PATH includes the FFmpeg bin folder. Or copy ffmpeg.exe and ffprobe.exe manually to your pulfrichVR folder.

Double-click 
```bash
run_pulfrichVR.bat
```
   
When running it the very first time it will:

create a local .venv virtual environment next to the files, install Python dependencies from requirements.txt and launch pulfrichVR.py.

After that it will work as a shortcut and just launch pulfrichVR.py.

<br><br>

## Linux quick start

Tested on Linux Mint / Ubuntu-like systems.

1. Make sure you have Python 3.11 or later installed
2. Install ffmpeg via your package manager, for example:

```bash
sudo apt install ffmpeg
```

Clone the repository and enter the folder:

```bash
git clone https://github.com/svenolavnoren/pulfrichVR.git
cd pulfrichVR
```


Make the launcher script executable (only once):

```bash
chmod +x run_pulfrichVR.sh
```

Run pulfrichVR:

```bash
./run_pulfrichVR.sh
```

On first run it will create a local .venv and install PySide6 and start pulfrichVR.
After that it will just launch pulfrichVR.py.


