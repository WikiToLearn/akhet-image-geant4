FROM        akhet/ubuntu-16-04-plasma

# general
RUN apt-get update && apt-get install -y apt-file && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete
RUN apt-get update && apt-get install -y wget && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete
RUN apt-get update && apt-get install -y zlib1g-dev && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete
RUN apt-get update && apt-get install -y tcl8.4 && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete
RUN apt-get update && apt-get install -y tk8.4 && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete

# general - development
RUN apt-get update && apt-get install -y build-essential && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete
RUN apt-get update && apt-get install -y g++ && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete
RUN apt-get update && apt-get install -y autoconf && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete
RUN apt-get update && apt-get install -y automake && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete
RUN apt-get update && apt-get install -y cmake && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete

# OpenGL libraries
RUN apt-get update && apt-get install -y mesa-utils && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete
RUN apt-get update && apt-get install -y libgl1-mesa-dri && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete
RUN apt-get update && apt-get install -y libgl1-mesa-glx && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete
RUN apt-get update && apt-get install -y libglu1-mesa-dev && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete

# x11 libraries
RUN apt-get update && apt-get install -y libxt-dev && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete
RUN apt-get update && apt-get install -y libxmu-dev && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete
RUN apt-get update && apt-get install -y libx11-dev && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete

# xerces libraries
RUN apt-get update && apt-get install -y libexpat1-dev && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete
RUN apt-get update && apt-get install -y libxerces-c-dev && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete

# qt libraries
RUN apt-get update && apt-get install -y libqt4-dev && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete
# RUN apt-get update && apt-get install -y qtbase5-dev && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete

# motif libraries
RUN apt-get update && apt-get install -y libmotif-dev && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete && find /var/log/ -type f -delete

# build commands
RUN wget http://geant4.cern.ch/support/source/geant4.10.02.p01.tar.gz && \
    tar zxvf geant4.10.02.p01.tar.gz && rm /geant4.10.02.p01.tar.gz && \
    mkdir /geant4-build && cd /geant4-build && \
    cmake -DGEANT4_BUILD_MULTITHREADED=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/geant4.10.02 \
        -DGEANT4_INSTALL_DATA=ON \
        -DGEANT4_USE_OPENGL_X11=ON -DGEANT4_USE_QT=ON -DGEANT4_USE_XM=ON \
        -DGEANT4_USE_GDML=ON \
        /geant4.10.02.p01/ && \
    make -j && make install && \
    mv /geant4-build/CMakeCache.txt /opt/geant4.10.02/ && \
    rm -rf /geant4-build && rm -rf /geant4.10.02.p01
RUN echo source /opt/geant4.10.02/bin/geant4.sh  >> /etc/bash.bashrc
