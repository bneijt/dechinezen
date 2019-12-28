#!/bin/bash
set -e
. ~/.bashrc_gcloud
#gcloud auth configure-docker
docker build . --tag gcr.io/dechinezen/www
docker push gcr.io/dechinezen/www

# gcloud builds submit --tag gcr.io/dechinezen/www (will time out)
# gcloud beta run deploy --image gcr.io/mywebsite-239106/hello
