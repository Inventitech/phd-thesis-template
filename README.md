# Improved TU Delft PhD Thesis Template

This is an improved version of the [TU Delft PhD thesis
template,](https://www.tudelft.nl/en/tu-delft-corporate-design/downloads/)
versioned `ff9d073` (dissertation template from July 2nd, 2015). It
features a number of changes to increase both on- and off-screen
(printing) quality, as well as reduce printing costs. The layout is
very well-readable, but rather close to the low limits for font size
and page utilization (i.e., if anything, I would recommend to increase
font size or page margins).

Specifically, it makes these key improvements over the TU Delft
dissertation house style: It ...

- actually compiles (well, at least on the tested Linux systems).
- makes the page layout much better suited to printing, because of an increased binding offset width. Text does not go into the binding fold of the book. The writable part of the page is also centered better when printed.
- uses much nicer fonts for on- and off-screen readability, namely [Libertinus](https://github.com/libertinus-fonts/libertinus) for regular text and [Inconsolata](https://fonts.google.com/specimen/Inconsolata) for mono-spaced elements such as source code listings.
- comes with a large list of already included packages, placed in a compatible order (some LaTeX package orders cause hard-to-debug compile errors).
- reduces the number of pages that need color, thus reducing printing costs, while pertaining TU Delft's signature blue for key elements such as chapter titles.
- makes for more crisp printing, by converting 90% gray anthracite to a fully black tone. Gray scale values between 30% and 90% typically look blurry or faint in print because the printer simply uses less ink to print them. To cater for this, the header text size was reduced to not interfere with the running text below.
- keeps a consistent style of reporting page numbers on top of pages.
- makes the screen and print versions of the PDF resemble each other more, while keeping the respective benefits of each format (for example, for on-screen PDFs, no offset binding adjustment is needed).
- makes the propositions page now fit a bigger amount of text. Moreover, the format of the propositions page now fits inside the thesis, instead of being the same size (which would stand out!).
- changes a couple of questionable defaults, such as the copyright notice by the author.
- includes commands to generate ready-to-be-printed PDFs with all fonts embedded, a typical requirement to publish PDFs.