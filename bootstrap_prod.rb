# call me via 
# ssh root@jeradphelps.com 'bash -s' < /Users/jbphelps/Dropbox/dokku/jeradphelps3.sh
# http://stackoverflow.com/questions/7048170/running-full-commands-through-remote-ssh

# Using pty here so we can stream output
require 'pty'
require './bootstrap_prod_helpers'

# execute these commands on the server to bootstrap our new box
cmd = "ssh root@jeradphelps.com sh < ./remote_commands.sh"
BootstrapProdHelpers.execute cmd

cmd = "sh ./local_commands.sh"
BootstrapProdHelpers.execute cmd










