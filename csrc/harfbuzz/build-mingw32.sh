# harfbuzz build with opentype, ucdn, freetype. dynamically links to ucdn and freetype.
export CFLAGS="-O2 -s -static-libgcc"
export PLATFORM=mingw32
export LIBNAME=harfbuzz.dll
./build.sh
