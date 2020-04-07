#!/bin/bash

mkdir -p ./src/_proto/cloudstate
mkdir -p ./src/_proto/google/api

echo "Compiling protobuf definitions"

OUT_DIR="./src/_proto"
PROTOC_GEN_TS_PATH="./node_modules/.bin/protoc-gen-ts"


echo "Compile cloudstate entity key"

echo "Compile Betting House Service"
protoc \
    --plugin="protoc-gen-ts=${PROTOC_GEN_TS_PATH}" \
    --js_out="import_style=commonjs,binary:${OUT_DIR}" \
    --ts_out="service=grpc-web:${OUT_DIR}" \
    --proto_path="." \
    -I node_modules/cloudstate/proto/google/api/ \
    -I node_modules/cloudstate/proto/ \
    -I ./node_modules/cloudstate/protoc/include \
    bettinghouse.proto domain.proto

echo "Compiling Betting House Service"
protoc \
  --proto_path="node_modules/cloudstate/proto/" \
  --include_imports \
  --proto_path=node_modules/cloudstate/proto \
  --proto_path=node_modules/cloudstate/protoc/include \
  --descriptor_set_out=user-function.desc \
  --proto_path=. \
      bettinghouse.proto
