# run ssh-agent
eval `ssh-agent`

# add ssh key
ssh-add ./ssh

# check
ssh-add -L