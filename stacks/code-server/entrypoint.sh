#!/bin/bash
# Login as user (simulate initial login)
#sudo -u coder -i

sudo -su coder dumb-init fixuid -q /usr/bin/code-server --bind-addr 0.0.0.0:8080 .

