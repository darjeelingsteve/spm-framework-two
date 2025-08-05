set -euo pipefail

echo "XCFramework build args: $@"

if [ $# -ne 6 ]; then
  echo ""
  echo "Error: Requires a semantic version number, project, and scheme to be specified."
  echo ""
  echo "Usage: "
  echo "archive.sh -v semantic.version.number"
  echo "           -p Project.xcodeproj"
  echo "           -s SchemeName"
  echo ""
  exit 1
fi

while getopts v:p:s: option
do
  case "${option}"
  in
    v) VERSION=${OPTARG};;
    p) PROJECT=${OPTARG};;
    s) SCHEME=${OPTARG};;
  esac
done

version_regex_pattern="^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)?$"

if [[ ! "$VERSION" =~ $version_regex_pattern ]]; then
	echo "Invalid version number: \"$VERSION\"" 1>&2 
	exit -1
fi

buildXCFramework() {
	# iOS Devices
	xcodebuild archive \
	    -project "$1.xcodeproj/" \
	    -scheme "$2" \
	    -archivePath "./xcframeworkarchives/$1/ios.xcarchive" \
	    -sdk iphoneos \
	    -xcconfig ./xcframework-build.xcconfig \
	    | tee xcodebuild-raw.log \
	    | xcbeautify --renderer github-actions

	# iOS Simulator
	xcodebuild archive \
	    -project "$1.xcodeproj/" \
	    -scheme "$2" \
	    -archivePath "./xcframeworkarchives/$1/ios_sim.xcarchive" \
	    -sdk iphonesimulator \
	    -xcconfig ./xcframework-build.xcconfig \
	    | tee xcodebuild-raw.log \
	    | xcbeautify --renderer github-actions

	# Create XCFramework
	xcodebuild -create-xcframework \
	    -framework "./xcframeworkarchives/$1/ios.xcarchive/Products/Library/Frameworks/$1.framework" \
	    -debug-symbols "$(pwd -P)/xcframeworkarchives/$1/ios.xcarchive/dSYMs/$1.framework.dSYM" \
	    -framework "./xcframeworkarchives/$1/ios_sim.xcarchive/Products/Library/Frameworks/$1.framework" \
	    -debug-symbols "$(pwd -P)/xcframeworkarchives/$1/ios_sim.xcarchive/dSYMs/$1.framework.dSYM" \
	    -output "./Build/$1.xcframework" \
	    | tee xcodebuild-raw.log \
	    | xcbeautify --renderer github-actions
}

buildXCFramework $PROJECT $SCHEME
