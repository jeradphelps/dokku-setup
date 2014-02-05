### Dokku Setup

Configurable shell script for bootstrapping a rails app on dokku.

## Lots of Assumptions

1. OS 10.9 (or at least a unix shell)
2. Your VPS is Ubuntu 12.04
4. Your VPS configured with keyed auth and your key is: ~/.ssh/id_rsa.pub
2. You want a root deployment (https://github.com/progrium/dokku/wiki/Deploying-to-root-and-subdomains)
3. Your DNS records are setup
5. You want to deploy your master branch