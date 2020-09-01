docker run -ti --rm \
    --net host \
    --privileged \
    -e LOCAL_UID=$(id -u $USER) \
    -e LOCAL_GID=$(id -g $USER) \
    -e USER=$USER \
    -e UART_GROUP_ID=20 \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix/:/tmp/.X11-unix \
    -v $HOME/.Xauthority:$HOME/.Xauthority \
    -v $HOME/docker/userhome:$HOME \
    -w $HOME \
    --shm-size=256m \
    ubuntu18
