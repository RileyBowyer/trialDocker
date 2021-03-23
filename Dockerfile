FROM osrf/ros:melodic-desktop-full AS base

RUN apt-get update

# Install System Dependencies
RUN apt-get install -y \
    python-catkin-tools \
    python-pip \
    xvfb \
    libboost-all-dev 

# Install ROS Dependencies
RUN apt-get install -y \
    ros-melodic-velodyne-simulator

RUN pip2 install \
    shapely

# Add DV workspace and build
RUN mkdir -p /ws/dv_ws
WORKDIR /ws/dv_ws

COPY src src
RUN catkin init
RUN catkin config --extend /opt/ros/melodic
RUN catkin build
RUN touch /root/.bashrc
RUN printf "Xvfb :1 -screen 0 1600x1200x16  & \nexport DISPLAY=:1.0 \nsource /ws/dv_ws/devel/setup.bash \nroslaunch fssim start.launch" >> /root/.bashrc