#!/bin/bash
begin=$(pwd)
cd $HOME
sed '/^*color*/d' .Xresources > .Xresources.tmp
cat .cache/wal/colors.Xresources | grep ^*color* >> .Xresources.tmp
cp .Xresources.tmp .Xresources
cd $begin