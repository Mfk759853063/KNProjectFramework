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
rm -rf $UNIVERSAL_OUTPUTFOLDER/Libs

mkdir $simBuildDir
mkdir $osBuildDir
mkdir $UNIVERSAL_OUTPUTFOLDER
mkdir $UNIVERSAL_OUTPUTFOLDER/Libs

xcodebuild -scheme $PROJECT_NAME -sdk iphonesimulator -configuration "release" -derivedDataPath $simBuildDir
xcodebuild -scheme $PROJECT_NAME -sdk iphoneos -configuration "release" -derivedDataPath $osBuildDir

lipo -create -output "$UNIVERSAL_OUTPUTFOLDER/$PROJECT_NAME.framework" "$simBuildDir/Build/Products/Release-iphonesimulator/$PROJECT_NAME.framework/$PROJECT_NAME" "$osBuildDir/Build/Products/Release-iphoneos/$PROJECT_NAME.framework/$PROJECT_NAME"

#复制第三方文件
cp -R $dir/KNProjectFramework/KNVenders/ $UNIVERSAL_OUTPUTFOLDER/Libs
