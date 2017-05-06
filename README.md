# Create the docker image

`docker build -t opv/opensfm-dev`

# Configure the shared folder 

If OpenSfM's data are stored in $DATADIR

`docker create -v $DATADIR:/data --name opensfmstore opv/opensfm-dev /bin/true
`

# Start the treatment

if the data you want to treat is in $DATADIR/$FOLDERNAME:

`docker run -e folderData=$FOLDERNAME --volumes-from opensfmstore opv/opensfm-dev`
