SUBM_NAME := j_fpva_test_final
AUX_FILES := IEEEtran.cls port_testvector_number.dat hole_wall_path.dat hole_wall_cut.dat
BIO_FILE := biographies.tex
PHOTO_DIR := photos
FIGURE_DIR := Fig

# According to TCAD Guidelines
cameraReady: cameraReady/$(SUBM_NAME).pdf cameraReady/allFigsTables.pdf cameraReady/allCaptions.pdf packfigs packbios


cameraReady/$(SUBM_NAME).pdf: cameraReady/$(SUBM_NAME).tex copyfigs copybios
	cd cameraReady; pdflatex $(SUBM_NAME).tex
	cd cameraReady; pdflatex $(SUBM_NAME).tex
	cd cameraReady; pdflatex $(SUBM_NAME).tex

cameraReady/$(SUBM_NAME).tex: *.tex
	cd cameraReady; for i in $(AUX_FILES); do cp ../$$i .; done
	./flatex.py -s $(SUBM_NAME).tex cameraReady/$(SUBM_NAME).tex
        
copyfigs.sh: cameraReady/$(SUBM_NAME).tex
	sed -nf copyfigs.sed <  cameraReady/$(SUBM_NAME).tex > copyfigs.sh
        
copyfigs: copyfigs.sh
	rm -rf cameraReady/$(FIGURE_DIR); mkdir -p cameraReady/$(FIGURE_DIR); bash copyfigs.sh
        
packfigs: copyfigs
	cd cameraReady; rm figures.zip; zip figures.zip $(FIGURE_DIR)/*
        
cameraReady/figs.tex: cameraReady/$(SUBM_NAME).tex
	sed -nf allFigs.sed < cameraReady/$(SUBM_NAME).tex > cameraReady/figs.tex
        
cameraReady/tables.tex: cameraReady/$(SUBM_NAME).tex
	sed -nf allTables.sed < cameraReady/$(SUBM_NAME).tex > cameraReady/tables.tex

cameraReady/allFigsTables.pdf:cameraReady/$(SUBM_NAME).pdf allFigsTables.tex copyfigs cameraReady/figs.tex cameraReady/tables.tex
	cd cameraReady; pdflatex ../allFigsTables.tex
	cd cameraReady; pdflatex ../allFigsTables.tex
	cd cameraReady; pdflatex ../allFigsTables.tex
        
cameraReady/figCaptions.tex: cameraReady/$(SUBM_NAME).tex
	sed -n '/\\begin{figure\**}/,/\\end{figure\**}/ s/^.*\\caption{\(.*\)}/\\begin{figure}[t]\\caption{\1}\\end{figure}\n\n/p' < cameraReady/$(SUBM_NAME).tex > cameraReady/figCaptions.tex
        
cameraReady/tabCaptions.tex: cameraReady/$(SUBM_NAME).tex
	sed -n '/\\begin{table\**}/,/\\end{table\**}/ s/^.*\\caption{\(.*\)}/\\begin{table}[t]\\caption{\1}\\end{table}\n\n/p' < cameraReady/$(SUBM_NAME).tex > cameraReady/tabCaptions.tex
        
cameraReady/allCaptions.pdf:cameraReady/$(SUBM_NAME).pdf allCaptions.tex cameraReady/tabCaptions.tex cameraReady/figCaptions.tex
	cd cameraReady; pdflatex ../allCaptions.tex
	cd cameraReady; pdflatex ../allCaptions.tex
	cd cameraReady; pdflatex ../allCaptions.tex
        
copybios:
	rm -rf cameraReady/$(PHOTO_DIR); mkdir -p cameraReady/$(PHOTO_DIR); cp $(PHOTO_DIR)/* cameraReady/$(PHOTO_DIR)

packbios: copybios
	cp $(BIO_FILE) cameraReady
	cd cameraReady; rm biographies.zip; zip biographies.zip $(PHOTO_DIR)/* $(BIO_FILE)

