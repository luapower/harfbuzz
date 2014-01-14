# harfbuzz build with opentype, ucdn, freetype. dynamically links to ucdn and freetype.
# TODO: remove the __MINGW32__ hack

cd src || exit 1

for f in `ls *.rl`; do
	if [ ! -f "${f%.*}.hh" ]; then
		ragel "$f" -e -F1 -o "${f%.*}.hh"
	fi
done

gcc $CFLAGS -shared -o ../../../bin/linux32/libharfbuzz.so \
	hb-blob.cc \
	hb-buffer.cc \
	hb-buffer-serialize.cc \
	hb-common.cc \
	hb-set.cc \
	hb-font.cc \
	hb-face.cc \
	hb-fallback-shape.cc \
	hb-shape-plan.cc \
	hb-shape.cc \
	hb-shaper.cc \
	hb-tt-font.cc \
	hb-unicode.cc \
	hb-warning.cc \
	\
	-DHAVE_OT \
	hb-ot*.cc \
	\
	-DHAVE_UCDN \
	hb-ucdn.cc \
	\
	-DHAVE_FREETYPE \
	hb-ft.cc \
	\
	-I. \
	-DHAVE_INTEL_ATOMIC_PRIMITIVES \
	-I../../freetype/include \
	-I../../ucdn \
	-L../../../bin/linux32 \
	-lucdn \
	-D__MINGW32__ \
	-lfreetype \
	-fno-exceptions -fno-rtti
