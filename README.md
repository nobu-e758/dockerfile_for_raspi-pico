Dockerfile for RaspberryPi Pico.

## Usage 

```bash
$ docker build -t rppico-dev .
$ docker run -it rppico-dev /bin/bash
(docker)$ cd blink
(docker)$ mkdir build
(docker)$ cd build
(docker)$ cmake ..
(docker)$ make
```
