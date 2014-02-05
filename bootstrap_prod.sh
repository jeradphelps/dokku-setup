# call me via sh bootstrap_prod.sh

##############################
##############################
##############################
# configuration variables
# Each of these must be set!
##############################
##############################
##############################

# the ip address if your vps
REMOTE_IP_ADDRESS=123.45.6.789

# Where your rails app is located locally
# note this chokes on ~
APPLICATION_ROOT="/Users/username/Sites/mysite"

# if your site will be hosted at http://www.example.com
# this value would be "example"
HOSTNAME="example"

# your publish ssh key file
# note this chokes on ~
KEY_FILE_LOCATION="/Users/username/.ssh/id_rsa.pub"

# Execute our commands.  The remote_commands shell file gets executed on the remote server
# and bootstraps dokku
# ssh root@$REMOTE_IP_ADDRESS "sh" < remote_commands.sh

# these commands are run locally.  They upload your key, set up your remotes and push your app.
sh local_commands.sh $APPLICATION_ROOT $HOSTNAME $REMOTE_IP_ADDRESS $KEY_FILE_LOCATION






