# pulfrichVR
pulfrichVR is a small, practical tool for creating high-quality stereo 3D-360 images from 360° video clips.
Workflow (high level):
1) Export 360 video from Insta360 Studio
2) Use pulfrichVR for frame stepping, set Left/Right frames and movement direction
3) Export: the app writes reproducible ffmpeg scripts per image ("negatives")
4) Run pending jobs in the built-in workshop / bat runner

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
and download a full build for Windows.
Notice: Make sure you select the full build. That way libsvtav1 will be included into your ffmpeg.exe.

Make sure your PATH includes the FFmpeg bin folder. Alternatively, copy ffmpeg.exe and ffprobe.exe manually to your pulfrichVR folder.

Double-click 
```bash
run_pulfrichVR.bat
```
   
When running it for the very first time it will:

create a local .venv virtual environment next to the files, install Python dependencies from requirements.txt (PySide6 6.7+) and launch pulfrichVR.py.

After that, when python is in place, it will serve as a shortcut and just launch pulfrichVR.py.

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
On subsequent runs it will just start pulfrichVR.py.


