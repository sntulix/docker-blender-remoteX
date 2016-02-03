# Docker + Blender for remote X Server

# require
* Docker
* X Server for Windows
  * Xming or VcXsrv or MobaXterm
* env DISPLAY=\<docker host ip\>:\<display no\>[.screen no]

# get
```
git clone https://github.com/sntulix/docker-blender-remote_x.git
Docker build -t local/blender-remote_x docker-blender-remote_x
```

# run
```
#start X Server before launch blender.
#modify "DISPLAY=192.168.99.1:0", "-v /c/Users/xyz:/mnt/home" for your environment.
docker run -it --rm -e DISPLAY=192.168.99.1:0 -v /c/Users/xyz:/mnt/home local/blender-remote_x blender/blender
```

# note
* env LIBGL_ENABLE_INDIRECT=1 enabled

# todo
* check 3D Hardware Accelaration with remote X.
