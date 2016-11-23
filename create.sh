#!/bin/bash -ue

script_dir=$(cd $(dirname $0); pwd)

cat ${script_dir}/.vimrc_normal ${script_dir}/.vimrc_neo > ${script_dir}/.vimrc
