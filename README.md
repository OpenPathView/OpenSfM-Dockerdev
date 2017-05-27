# Open SFM treatment docker image
We use [Mapillary's OpenSFM tools](https://github.com/mapillary/OpenSfM) to generate path between our photosphere and implement in the futur improved transition between our pictures.

This DockerFile simply add a command entry point to Mapillary OpenSFM docker file.

## How to use it

### Get mapillary/opensfm image
First you need to get mapillary/opensfm image, to do so you will need to clone [their repository](https://github.com/mapillary/OpenSfM) and build their docker image with the tag *mapillary/opensfm*.
```bash
git clone git@github.com:mapillary/OpenSfM.git
cd OpenSfM
docker build -t mapillary/opensfm .
```

Check the image is correctly build :
```bash
docker images
```

### Create the OPV/OpenSFM docker image

Clone this repository and build it's docker image.
```bash
git clone git@github.com:OpenPathView/OpenSfM-Dockerdev.git
cd OpenSfM-Dockerdev/
docker build -t opv/opensfm-dev .
```

### Configure the shared folder

OpenSfM's data are stored in $DATADIR. You have an [exemple set of data here](https://github.com/mapillary/OpenSfM/tree/master/data).

```bash
export DATADIR=fullPath/mapillary/OpenSfM/data
docker create -v $DATADIR:/data --name opensfmstore opv/opensfm-dev /bin/true
```

### Start the treatment

if the data you want to treat is in $DATADIR/$FOLDERNAME:

```bash
export FOLDERNAME=berlin
docker run -e folderData=$FOLDERNAME -e command=extract_metadata --volumes-from opensfmstore opv/opensfm-dev
```

### Commands
Commands are : 'extract_metadata', 'detect_features', 'match_features', 'create_tracks', 'reconstruct', 'mesh', 'undistort', 'compute_depthmaps', 'export_ply', 'export_openmvs', 'export_visualsfm'

TODO document those commands.
