
.PHONY: force-build

all: dissertation.pdf propositions.pdf dissertation_print.pdf

force-build:


figs: figs/development_model_without_papers.pdf figs/development_model_just_papers.pdf

figs/development_model_without_papers.pdf:
	rsvg-convert -f pdf -o  figs/development_model_without_papers.pdf figs/development_model_without_papers.svg

figs/development_model_just_papers.pdf:
	rsvg-convert -f pdf -o  figs/development_model_just_papers.pdf figs/development_model_just_papers.svg

dissertation.pdf: figs force-build
	latexmk -xelatex dissertation
	makeglossaries dissertation

propositions.pdf: force-build
	latexmk -xelatex propositions

dissertation_print.pdf: dissertation.pdf
	gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dEmbedAllFonts=true -sOutputFile=dissertation_print.pdf -f dissertation.pdf

clean:
	rubber --clean dissertation.tex
	rm -f dissertation.pdf
