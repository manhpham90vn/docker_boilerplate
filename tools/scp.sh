# copy file celery-worker.log from server to local use ssh key
scp -i ~/.ssh/aws.pem ec2-user@1.2.3.4:/var/log/celery-worker.log ~/celery-worker.log
