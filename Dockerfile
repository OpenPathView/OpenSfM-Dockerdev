FROM mapillary/opensfm

VOLUME /data

ENV folderData ""

CMD /source/OpenSfM/bin/run_all "/data/${folderData}"
