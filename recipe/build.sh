#!/usr/bin/env bash

set -e
set -x

if [ "$(uname)" == "Darwin" ]; then
  # See https://conda-forge.org/docs/maintainer/knowledge_base.html#newer-c-features-with-old-sdk
  CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
fi

meson setup --buildtype=release build_preproc -Dcpp_link_args='-pthread'

meson compile -C build_preproc
mkdir -p $PREFIX/bin
cp build_preproc/src/dynare-preprocessor $PREFIX/bin/dynare-preprocessor
