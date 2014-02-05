# call me via 
# ssh root@jeradphelps.com 'bash -s' < /Users/jbphelps/Dropbox/dokku/jeradphelps3.sh
# http://stackoverflow.com/questions/7048170/running-full-commands-through-remote-ssh

# Using pty here so we can stream output
require 'pty'

# execute these commands on the server to bootstrap our new box
# cmd = "ssh root@jeradphelps.com sh < ./remote_commands.sh"
# PTY.spawn( cmd ) do |stdin, stdout, pid|
#   stdin.each { |line| print line }
# end

# puts `sh ./local_commands.sh`
cmd = "sh ./local_commands.sh"
BootstrapProdHelpers.execute cmd










class BootstrapProdHelpers
  def self.execute cmd
    PTY.spawn( cmd ) do |stdin, stdout, pid|
      stdin.each { |line| print line }
    end
  end
end