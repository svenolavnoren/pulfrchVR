# pulfrichVR
pulfrichVR is a small, practical tool for creating high-quality stereo 3D-360 images from 360° video clips.
Workflow (high level):
1) Export 360 video from Insta360 Studio
2) Use pulfrichVR for frame stepping, set Left/Right frames and movement direction
3) Export: the app writes reproducible ffmpeg scripts per image ("negatives")
4) Run pending jobs in the built-in workshop / bat runner


## Windows quick start

Background: All my testing this far been done using Linux Mint and Windows 11. Both those with 64-bit x86 hardware. ARM I haven't yet tried. A shorter test on my older laptop with Windows 10 slipped by and that just worked. I hope and believe it will run well out-of-the-box with the majority of modern Windows- or Linux versions when your Python environment is set up. PulfrichVR.py is designed with the goal of silently just work and let you create. 

1. Install **Python 3.11 or later** from python.org  
2. Download the latest pulfrichVR zip and extract it to a folder (e.g. `C:\pulfrichVR`)
3. Make sure the folder contains:
   - `pulfrichVR_0.9-087.py`
   - `requirements.txt`
   - `run_pulfrichVR.bat`
   -  ffmpeg.exe` and ffprobe.exe  /Note: Any good version of ff...exe should be fine. Bundled are my tried and tested versions.
4. Double-click `run_pulfrichVR.bat`

On first run, the script will:

- create a local `.venv` next to the files
- install PySide6 from `requirements.txt`
- start pulfrichVR

On subsequent runs, it will simply start pulfrichVR immediately.




## Linux quick start

Tested on Linux Mint / Ubuntu-like systems.

1. Make sure you have Python 3.11 or later installed
2. Install ffmpeg via your package manager, for example:

   ```bash
   sudo apt install ffmpeg


Clone the repository and enter the folder:

   ```bash
   git clone https://github.com/svenolavnoren/pulfrichVR.git
   cd pulfrichVR


Make the launcher script executable (only once):

   ```bash
   chmod +x run_pulfrichVR.sh


Run pulfrichVR:

   ```bash
   ./run_pulfrichVR.sh


On first run the script will create a local .venv and install PySide6.
On subsequent runs it will just start pulfrichVR directly.


