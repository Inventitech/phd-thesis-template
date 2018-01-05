
.PHONY: force-build

all: dissertation.pdf

force-build:

dissertation.pdf: force-build
	pdflatex dissertation
	makeglossaries dissertation
	bibtex dissertation
	pdflatex dissertation
	pdflatex dissertation

propositions.pdf: force-build
	pdflatex propositions
	pdflatex propositions

clean:
	rubber --clean dissertation.tex
	rm -f dissertation.pdf
