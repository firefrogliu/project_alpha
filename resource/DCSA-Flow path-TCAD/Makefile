TOP = biochip_arch_syn_final_v2
TEMPLATES = sig-alternate-05-2015.cls
FIGDIR = Fig/

FIGOBJS = $(patsubst %.svg,%.pdf_tex,$(wildcard $(FIGDIR)*.svg))\
          $(patsubst %.asy,%.eps,$(wildcard $(FIGDIR)*.asy))

$(TOP).pdf: *.tex *.bib $(TEMPLATES) $(FIGOBJS) 
	pdflatex $(TOP)
	bibtex $(TOP)
	pdflatex $(TOP)
	pdflatex $(TOP)

%.pdf_tex: %.svg
	inkscape -D -z --file=$(patsubst %.pdf_tex,%.svg,$@) --export-pdf=$(patsubst %.pdf_tex,%.pdf,$@) --export-latex

%.eps: %.asy
	asy -cd $(FIGDIR) $(patsubst $(FIGDIR)%,%,$<)

clean:
	rm -f $(TOP).pdf $(TOP).dvi $(TOP).aux $(TOP).log $(TOP).blg $(TOP).bbl

	
	


