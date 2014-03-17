# harfbuzz build with opentype, ucdn, freetype. dynamically links to ucdn and freetype.
export CC="i686-w64-mingw32-gcc -m64"
export CFLAGS="-O2 -s -static-libgcc"
export PLATFORM=mingw64
export LIBNAME=harfbuzz.dll
./build.sh
