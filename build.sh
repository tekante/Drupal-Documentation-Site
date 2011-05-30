#!/bin/sh

if [ $# -eq 0 ]; then
  echo Usage $0 [--dev] target_build_dir
  exit -1
fi

if [ "$1" = "--dev" ]; then
  DEV='--working-copy'
  TARGET=$2
else
  DEV=
  TARGET=$1
fi

if [ -z "$TARGET" ]; then
  echo Usage $0 [--dev] target_build_dir
  exit -2
fi

drush make $DEV docs.make $TARGET

if [ ! -z "$DEV" ]; then
  CALLPATH=`dirname $0`
  PWD=`pwd`
  BASE=`echo $PWD/$CALLPATH | sed "s/\/\.//"`
  pushd .
  ln -s $BASE $TARGET/profiles/docs
  cd $TARGET/sites/default
  if [ -e ../../../settings.php ]; then
    ln -s ../../../settings.php .
  fi
  if [ -e ../../../files ]; then
    ln -s ../../../files .
  fi
  popd
fi

pushd .
cd $TARGET/sites/all/modules/contrib/grammar_parser
sed "s/7.x/6.x/g" grammar_parser.info > grammar_parser.tmp
mv grammar_parser.tmp grammar_parser.info
popd
