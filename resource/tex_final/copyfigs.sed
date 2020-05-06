s/^.*\\includegraphics\(\[.*\]\)\?{\([a-zA-Z0-9/_]*\)\/\([a-zA-Z0-9_]*\).pdf}.*/cp $PWD\/\2\/\3.pdf cameraReady\/\2\//p
s/^.*\\includegraphics\(\[.*\]\)\?{\([a-zA-Z0-9_]*\).pdf}.*/cp $PWD\/Fig\/\2.pdf cameraReady\/Fig\//p
s/^.*\\includegraphics\(\[.*\]\)\?{\([a-zA-Z0-9/_]*\)\/\([a-zA-Z0-9_]*\).eps}.*/cp $PWD\/\2\/\3.eps cameraReady\/\2\//p
s/^.*\\includegraphics\(\[.*\]\)\?{\([a-zA-Z0-9/_]*\)\/\([a-zA-Z0-9_]*\).pstex}.*/cp $PWD\/\2\/\3.pstex cameraReady\/\2\//p
s/^.*\\includegraphics\(\[.*\]\)\?{\([a-zA-Z0-9/_]*\)\/\([a-zA-Z0-9_]*\)}.*/cp $PWD\/\2\/\3.eps cameraReady\/\2\//p
