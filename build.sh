# Constants
PROJECT_NAME='KNProjectFramework'
dir=`pwd`
simBuildDir=$dir/build-sim
osBuildDir=$dir/build-os
#自定义的用来存放最后合并的framework
UNIVERSAL_OUTPUTFOLDER=$dir/universal
rm -rf $simBuildDir
rm -rf $osBuildDir
rm -rf $UNIVERSAL_OUTPUTFOLDER

mkdir $simBuildDir
mkdir $osBuildDir
mkdir $UNIVERSAL_OUTPUTFOLDER

xcodebuild -scheme $PROJECT_NAME -sdk iphonesimulator -configuration "release" -derivedDataPath $simBuildDir
xcodebuild -scheme $PROJECT_NAME -sdk iphoneos -configuration "release" -derivedDataPath $osBuildDir

lipo -create -output "$UNIVERSAL_OUTPUTFOLDER/$PROJECT_NAME.framework" "$simBuildDir/Build/Products/Release-iphonesimulator/$PROJECT_NAME.framework/$PROJECT_NAME" "$osBuildDir/Build/Products/Release-iphoneos/$PROJECT_NAME.framework/$PROJECT_NAME"
