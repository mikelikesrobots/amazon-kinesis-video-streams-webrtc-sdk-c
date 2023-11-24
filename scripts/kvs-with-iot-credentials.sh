#!/bin/bash
export KVSSINK_PATH=PATH
export AWS_IOT_CORE_CREDENTIAL_ENDPOINT=ENDPOINT
export AWS_IOT_CORE_CA_PATH=certs/cert.pem
export AWS_IOT_CORE_CERT=CERT
export AWS_IOT_CORE_PRIVATE_KEY=PRIV
export AWS_IOT_CORE_ROLE_ALIAS=ALIAS
export AWS_IOT_CORE_THING_NAME=NAME
export AWS_REGION=REGION
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$KVSSINK_PATH

gst-launch-1.0 nvarguscamerasrc do-timestamp=TRUE ! \
    nvv4l2h264enc ! \
    h264parse ! \
    video/x-h264,stream-format=avc,alignment=au,profile=baseline,width=1280,height=720,framerate=25/1 ! \
    kvssink \
        stream-name="$AWS_IOT_CORE_THING_NAME" \
        aws-region="$AWS_REGION" \
        iot-certificate=" \
            iot-certificate, \
            endpoint=$AWS_IOT_CORE_CREDENTIAL_ENDPOINT, \
            cert-path=$AWS_IOT_CORE_CERT, \
            key-path=$AWS_IOT_CORE_PRIVATE_KEY, \
            ca-path=$AWS_IOT_CORE_CA_PATH, \
            role-aliases=$AWS_IOT_CORE_ROLE_ALIAS"
