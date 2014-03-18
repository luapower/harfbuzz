# harfbuzz build with opentype, ucdn, freetype. dynamically links to ucdn and freetype.
export CC=gcc
export CFLAGS="-O2 -s -static-libgcc"
export PLATFORM=mingw64
export LIBNAME=harfbuzz.dll
./build.sh
