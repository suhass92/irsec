#!/bin/bash
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1484120AC4E9F8A1A577AEEE97A80C63C9D8B80B
sudo add-apt-repository "deb [arch=amd64] https://osquery-packages.s3.amazonaws.com/xenial xenial main"
sudo apt-get update
sudo apt-get install osquery

curl https://raw.githubusercontent.com/suhass92/irsec/master/osquery/osquery.conf > osquery.conf
curl https://raw.githubusercontent.com/suhass92/irsec/master/osquery/fim.conf > fim.conf

sudo cp osquery.conf /etc/osquery/
sudo cp fim.conf /usr/share/osquery/packs/
sudo systemctl start osqueryd
