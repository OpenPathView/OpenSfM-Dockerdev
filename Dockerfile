FROM mapillary/opensfm

VOLUME /data

# not a root-user (I hope your id is 1000)
RUN useradd -u 1000 opensfm
USER opensfm

ENV folderData ""
ENV command ""


CMD /source/OpenSfM/bin/opensfm ${command} "/data/${folderData}"
