# harfbuzz build with opentype, ucdn, freetype. dynamically links to ucdn and freetype.
# TODO: remove the __MINGW32__ hack
export CC=gcc
export CFLAGS="-O2 -s -static-libgcc -DHAVE_INTEL_ATOMIC_PRIMITIVES -D__MINGW32__"
export PLATFORM=linux32
export LIBNAME=libharfbuzz.so
./build.sh
