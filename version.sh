#!/bin/sh
IFS=':' read -a array <<< "${CODEBUILD_BUILD_ID}"
PROJECT=${array[0]}
VERSION_DATE=`date +"%Y%m%d_Build%H%M"`
PREFIX=""
case $PROJECT in
	FISN_Staging)
		PREFIX="rc"
		;;

	FISN_Production)
		PREFIX="v"
		;;
esac

export USE_VERSION="$PREFIX$VERSION_DATE"
