#!/bin/bash

echo Build caffe

cp Makefile.config caffe/

cd caffe

make all

echo Caffe build complete

echo Generating caffe.pb.h

protoc src/caffe/proto/caffe.proto --cpp_out=.
mkdir include/caffe/proto
mv src/caffe/proto/caffe.pb.h include/caffe/proto

echo caffe.pb.h generated

echo run test

make runtest

echo test complete

#echo Building TrimapDetector

#cd ../..

#cmake CMakeLists.txt

#make

echo build completed
