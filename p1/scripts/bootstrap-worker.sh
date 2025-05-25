#!/usr/bin/env bash

curl -sfL https://get.k3s.io | sh -s - agent --token-file /vagrant/token-file --server https://192.168.56.110:6443
