#!/bin/sh
# Copyright 2018 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

PROJECT_NAME=grpc-loadbalancing-demo2018

docker build -t gcr.io/${PROJECT_NAME}/greeter_server ../helloworld-csharp


# Need to run "gcloud auth configure-docker" before we can push the image

docker push gcr.io/${PROJECT_NAME}/greeter_server:latest



# Previously need to configure via  https://cloud.google.com/container-engine/docs/clusters/operations

#gcloud config set container/cluster demo-cluster-1
#gcloud container clusters --project=${PROJECT_NAME} --zone=us-central1-a get-credentials demo-cluster-1


kubectl create -f backend-all.yaml
