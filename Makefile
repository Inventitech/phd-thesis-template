
.PHONY: force-build

all: dissertation.pdf propositions.pdf

force-build:


figs: figs/development_model_without_papers.pdf figs/development_model_only_papers.pdf

figs/development_model_without_papers.pdf:
	rsvg-convert -f pdf -o  figs/development_model_without_papers.pdf figs/development_model_without_papers.svg

figs/development_model_only_papers.pdf:
	rsvg-convert -f pdf -o  figs/development_model_only_papers.pdf figs/development_model_only_papers.svg

dissertation.pdf: figs force-build
	latexmk -xelatex dissertation
	makeglossaries dissertation

propositions.pdf: force-build
	latexmk -xelatex propositions

clean:
	rubber --clean dissertation.tex
	rm -f dissertation.pdf
