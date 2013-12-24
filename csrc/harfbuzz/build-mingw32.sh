# harfbuzz build with opentype, ucdn, freetype. dynamically links to ucdn and freetype.


cd src || exit 1

for f in `ls *.rl`; do
	if [ ! -f "${f%.*}.hh" ]; then
		ragel "$f" -e -F1 -o "${f%.*}.hh"
	fi
done

gcc \
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
	-L../../../bin/mingw32 -lucdn -lfreetype \
	-fno-exceptions -fno-rtti \
	-O3 -s -shared -static-libgcc -o ../../../bin/mingw32/harfbuzz.dll
