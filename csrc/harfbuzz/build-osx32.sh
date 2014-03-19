# harfbuzz build with opentype, ucdn, freetype. dynamically links to ucdn and freetype.
# TODO: remove the __MINGW32__ hack
export CC="gcc -arch i386"
export CFLAGS="-O2 -DHAVE_INTEL_ATOMIC_PRIMITIVES -D__MINGW32__"
export PLATFORM=osx32
export LIBNAME=libharfbuzz.dylib
./build.sh
