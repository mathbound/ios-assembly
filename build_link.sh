cc -target arm64-apple-macos  -c hello.s -o hello.o
cc -target arm64-apple-macos  hello.o -o hello -e _start -lc
