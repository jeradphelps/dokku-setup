APPLICATION_ROOT=$1
HOSTNAME=$2
REMOTE_IP_ADDRESS=$3
KEY_FILE_LOCATION=$4

GIT_REMOTE_NAME=$HOSTNAME"prod"
APP_NAME=$HOSTNAME".com"

cd $APPLICATION_ROOT

# send your key out to your server.
cat "$KEY_FILE_LOCATION" | ssh root@$REMOTE_IP_ADDRESS "sshcommand acl-add dokku $HOSTNAME"

# Add a remote
git remote rm $GIT_REMOTE_NAME
git remote add $GIT_REMOTE_NAME dokku@$REMOTE_IP_ADDRESS:$APP_NAME

# Push it real good.
git push $GIT_REMOTE_NAME master

# set our domains using the domain plugin
# NOTE do not ssh to the server and run this as root.
ssh dokku@$REMOTE_IP_ADDRESS domains:set $APP_NAME www.$APP_NAME

