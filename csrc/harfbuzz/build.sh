# harfbuzz build with opentype, ucdn, freetype. dynamically links to ucdn and freetype.

[ "$PLATFORM" ] || exit 1 # this is a template script

cd src

# pre-processing step: convert *.rl -> *.hh with ragel
for f in `ls *.rl`; do
	if [ ! -f "${f%.*}.hh" ]; then
		ragel "$f" -e -F1 -o "${f%.*}.hh"
	fi
done

$CC $CFLAGS -shared -o ../../../bin/$PLATFORM/$LIBNAME \
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
	-I../../freetype/include \
	-I../../ucdn \
	-L../../../bin/$PLATFORM \
	-lucdn \
	-lfreetype \
	-fno-exceptions -fno-rtti
