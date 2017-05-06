FROM mapillary/opensfm

VOLUME /data

ENV folderData ""
ENV command ""

CMD /source/OpenSfM/bin/opensfm ${command} "/data/${folderData}"
