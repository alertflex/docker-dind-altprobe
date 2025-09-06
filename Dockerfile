FROM cruizba/ubuntu-dind:jammy-latest

RUN apt-get update && apt-get install -y libdaemon-dev libboost-all-dev libapr1-dev libaprutil1-dev python3-pip wget
RUN python3 -m pip install pytest requests
RUN wget https://github.com/alertflex/altprobe/releases/download/v1.0.5/altprobe_1.0-5.deb 
RUN dpkg -i altprobe_1.0-5.deb && ldconfig

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
