
# # send your key out to your server.
# cat ~/.ssh/id_rsa.pub | ssh root@jeradphelps.com "sshcommand acl-add dokku jeradphelps"

# # Add a remote
# git remote rm jeradphelpsprod
# git remote add jeradphelpsprod dokku@107.170.27.117:jeradphelps.com

# # Push it real good.
# git push jeradphelpsprod master

# # set our domains using the domain plugin
# # NOTE do not ssh to the server and run this as root.
# ssh dokku@jeradphelps.com domains:set jeradphelps.com www.jeradphelps.com

echo "hi"
echo "hi"
echo "hi"
echo "hi"
echo "hi"
echo "hi"
echo "hi"
echo "hi"
echo "hi"