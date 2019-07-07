# harfbuzz build with opentype, aat, freetype. dynamically links to freetype.
cd src || exit 1

C="$C
hb-blob.cc
hb-buffer-serialize.cc
hb-buffer.cc
hb-common.cc
hb-face.cc
hb-font.cc
hb-map.cc
hb-ot-tag.cc
hb-set.cc
hb-shape.cc
hb-shape-plan.cc
hb-shaper.cc
hb-static.cc
hb-unicode.cc
hb-warning.cc
hb-aat-*.cc
hb-ot*.cc

-DHAVE_FREETYPE
hb-ft.cc

-DHAVE_FALLBACK
hb-fallback-shape.cc

hb-ucd.cc
"

${X}gcc -c -Os $C -DHAVE_INTEL_ATOMIC_PRIMITIVES \
	-I. -I../../freetype/include \
	-std=c++11 -fno-exceptions -fno-rtti -fvisibility-inlines-hidden
${X}gcc *.o -flto -shared -o ../../../bin/$P/$D \
	-Wl,--version-script=../harfbuzz.version -L../../../bin/$P $L -lfreetype
rm -f      ../../../bin/$P/$A
${X}ar rcs ../../../bin/$P/$A *.o
rm *.o
