Using the template
------------------

This is the TU Delft dissertation template for LaTeX. It is designed to work
with all versions of LaTeX, but if you want to adhere to the TU Delft house
style, you need to use XeLaTeX, as it supports TrueType and OpenType fonts. The
document can be compiled with

  xelatex dissertation
  bibtex chapter-1/chapter-1
  xelatex dissertation
  xelatex dissertation

Or by selecting the 'XeLaTeX' and 'BibTeX' options in your favorite TeX editing
program, respectively. Note that you have to run bibtex for every chapter.

A sample document, as well as documentation for template options, can be found
in example.pdf. An example with the native LaTeX fonts, compiled using the
'nativefonts' option (or with pdflatex), can be found in
example-nativefonts.pdf. This example also has the print option turned on.

A separate document is available for the propositions. It can be generated with

  xelatex propositions

or simply with the 'XeLaTeX' option in TeXworks or an equivalent program.



Installation on Windows
-----------------------

This dissertation template has been tested to work with the most recent version
of MiKTeX at the time of this writing (2.9). The following packages are required
on top of a basic MiKTeX installation to make full use of the template:

  caption, fancyhdr, filehook, footmisc, fourier, l3kernel, l3packages,
  lettrine, metalogo, mptopdf, ms, natbib, pgf, realscripts, tipa, titlesec,
  tocbibind, unicode-math, url, xcolor, xetex-def

Note that MiKTeX will generally automatically install these packages if they are
missing from your installation.



Installation on Linux (Debian/Ubuntu)
-------------------------------------

Recent versions of Debian, and derived distributions such as Ubuntu, use the TeX
Live system. Install the following packages to make full use of the this
template:

  texlive, texlive-fonts-extra, texlive-math-extra, texlive-lang-dutch,
  texlive-lang-english, texlive-latex-extra, texlive-xetex

