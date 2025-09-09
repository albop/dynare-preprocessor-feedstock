#!/bin/bash

export BOOST_ROOT=$PREFIX
if [ "$(uname)" == "Darwin" ]; then
  meson setup --buildtype=release build_preproc -Dcpp_args='-D_LIBCPP_DISABLE_AVAILABILITY'
else
  meson setup --buildtype=release build_preproc
fi
meson compile -C build_preproc
mkdir -p $PREFIX/bin
cp build_preproc/src/dynare-preprocessor $PREFIX/bin/dynare-preprocessor
