curl -SL "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip" -o /tmp/aws-sam-cli-linux-arm64.zip
unzip /tmp/aws-sam-cli-linux-arm64.zip -d sam-cli-linux-arm64
sudo /tmp/sam-cli-linux-arm64/install --update