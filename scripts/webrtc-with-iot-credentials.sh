#!/bin/bash
export AWS_IOT_CORE_CREDENTIAL_ENDPOINT=ENDPOINT
export AWS_IOT_CORE_CERT=CERT
export AWS_IOT_CORE_PRIVATE_KEY=PRIV
export AWS_IOT_CORE_ROLE_ALIAS=ALIAS
export AWS_IOT_CORE_THING_NAME=NAME
./build/samples/kvsWebrtcClientMasterGstSample $AWS_IOT_CORE_THING_NAME video-only-storage nvargussrc
