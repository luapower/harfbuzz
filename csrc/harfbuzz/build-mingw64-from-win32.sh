# harfbuzz build with opentype, ucdn, freetype. dynamically links to ucdn and freetype.
export CC=i686-w64-mingw32-gcc
export CFLAGS="-m64 -O2 -s -static-libgcc"
export PLATFORM=mingw64
export LIBNAME=harfbuzz.dll
./build.sh
