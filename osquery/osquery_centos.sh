#!/bin/bash

sudo rpm -ivh https://osquery-packages.s3.amazonaws.com/centos7/noarch/osquery-s3-centos7-repo-1-0.0.noarch.rpm
sudo yum install osquery

curl https://raw.githubusercontent.com/suhass92/irsec/master/osquery/osquery.conf > osquery.conf

sudo cp osquery.conf > /etc/osquery/

sudo systemctl start osqueryd
