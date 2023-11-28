#!/usr/bin/env bash
set -x
if [ ! -d WebKit ]
then
  git clone -b Safari-611.1.5.1 --depth=1 https://github.com/WebKit/WebKit.git WebKit;
  pushd WebKit || exit;
  Tools/Scripts/build-jsc --jsc-only;
  popd || exit;
fi
