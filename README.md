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

### Create the docker image

Build a docker image.
```bash
docker build -t opv/opensfm-dev .
```

### Configure the shared folder

If OpenSfM's data are stored in $DATADIR. You have an [exemple set of data here](https://github.com/mapillary/OpenSfM/tree/master/data).

```bash
export DATADIR=mapillary/OpenSfM/data
docker create -v $DATADIR:/data --name opensfmstore opv/opensfm-dev /bin/true
```

### Start the treatment

if the data you want to treat is in $DATADIR/$FOLDERNAME:

```bash
export FOLDERNAME=berlin
docker run -e folderData=$FOLDERNAME --volumes-from opensfmstore opv/opensfm-dev
```
