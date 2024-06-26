#!/usr/bin/env bash

CDIR="$(cd "$(dirname "$0")" && pwd)"
build_dir=$CDIR/build

while getopts A:K:q option
do
  case "${option}"
  in
    q) QUIET=1;;
    A) ARCH=${OPTARG};;
    K) KERNEL=${OPTARG};;
  esac
done

rm -rf $build_dir
mkdir -p $build_dir

for f in entrypoint.sh
do
    cp $CDIR/$f $build_dir/
done

version='0.94.2'
arch='x86_64'
target='unknown-linux-gnu'
tarname="nu-${version}-${arch}-${target}.tar.gz"
url="https://github.com/nushell/nushell/releases/download/${version}/${tarname}"
#
cd $build_dir
#
[ $QUIET ] && arg_q='-q' || arg_q=''
[ $QUIET ] && arg_s='-s' || arg_s=''
[ $QUIET ] && arg_progress='' || arg_progress='--show-progress'
#
if [ -x "$(command -v wget)" ]; then
  wget $arg_q $arg_progress $url -O $tarname
elif [ -x "$(command -v curl)" ]; then
  curl $arg_s -L $url -o $tarname
else
  echo Install wget or curl
  exit 1;
fi
#
tar -xf $tarname
rm $tarname
mkdir bin
bash -c "mv nu-${version}-${arch}-${target}/nu bin/nu"
