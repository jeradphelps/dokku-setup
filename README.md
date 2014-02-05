### Dokku Setup

Configurable shell script for bootstrapping a rails app on dokku.

## Lots of Assumptions

1. OS 10.9 (or at least a unix shell)
2. A VPS is Ubuntu 12.04
4. A VPS configured with keyed auth and your key is: ~/.ssh/id_rsa.pub
2. A root deployment (https://github.com/progrium/dokku/wiki/Deploying-to-root-and-subdomains)
3. DNS records are setup
5. The master branch is the branch ready for deployment