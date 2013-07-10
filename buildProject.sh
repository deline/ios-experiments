#pod install 

/usr/local/xctool/xctool \
-workspace ios-experiments.xcworkspace \
-scheme ios-experiments \
-arch i386 \
-sdk iphonesimulator \
ONLY_ACTIVE_ARCH=NO \
clean build test