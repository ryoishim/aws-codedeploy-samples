#!/bin/bash

EXEC_DATE=`date +%Y%m%d%H%M%s`
TARGET_S3_PATH="s3://ryoishim/assets/"
TARGET_FILE_BASENAME="web_assets.zip"
TARGET_FILE_NAME="web_assets_${EXEC_DATE}.zip"

zip assets/${TARGET_FILE_NAME} index.html appspec.yml scripts/*
aws s3 cp assets/${TARGET_FILE_NAME} ${TARGET_S3_PATH}${TARGET_FILE_NAME}
aws s3 cp ${TARGET_S3_PATH}${TARGET_FILE_NAME} ${TARGET_S3_PATH}${TARGET_FILE_BASENAME} 
