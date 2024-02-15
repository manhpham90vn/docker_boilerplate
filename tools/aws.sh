pip install --upgrade pip
python -m pip install awscli awsebcli
cd /tmp
wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
unzip ./aws-sam-cli-linux-x86_64.zip -d sam-cli
cd sam-cli
sudo ./install
aws --version
eb --version
sam --version