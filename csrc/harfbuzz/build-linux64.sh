# harfbuzz build with opentype, ucdn, freetype. dynamically links to ucdn and freetype.
# TODO: remove the __MINGW32__ hack
export CC=gcc
export CFLAGS="-O2 -s -static-libgcc -fPIC -DHAVE_INTEL_ATOMIC_PRIMITIVES -D__MINGW32__"
export PLATFORM=linux64
export LIBNAME=libharfbuzz.so
./build.sh
