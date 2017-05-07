Dockerfiles for Banshee
================

- Dockerfile

sudo docker run -d --net=host -e NIC=eth0 -e LOG_DST=172.17.0.1:24224 mztn/banshee
