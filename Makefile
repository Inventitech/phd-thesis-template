
.PHONY: force-build

all: dissertation.pdf

force-build:


figs: figs/development_model_without_papers.pdf figs/development_model_only_papers.pdf

figs/development_model_without_papers.pdf:
	rsvg-convert -f pdf -o  figs/development_model_without_papers.pdf figs/development_model_without_papers.svg

figs/development_model_only_papers.pdf:
	rsvg-convert -f pdf -o  figs/development_model_only_papers.pdf figs/development_model_only_papers.svg

dissertation.pdf: figs force-build
	xelatex dissertation
	makeglossaries dissertation
	bibtex dissertation
	xelatex dissertation
	xelatex dissertation

propositions.pdf: force-build
	xelatex propositions
	xelatex propositions

clean:
	rubber --clean dissertation.tex
	rm -f dissertation.pdf
