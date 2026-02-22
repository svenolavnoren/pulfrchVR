# pulfrichVR
pulfrichVR is a small, practical tool for creating high-quality stereo 3D-360 images from 360° video clips.
Workflow (high level):
1) Export 360 video (e.g. from Insta360 Studio)
2) Use pulfrichVR for frame stepping, set Left/Right frames and movement direction
3) Export: the app writes reproducible ffmpeg scripts per image ("negatives")
4) Run pending jobs in the built-in workshop / bat runner
