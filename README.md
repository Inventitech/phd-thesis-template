# Improved TU Delft PhD Thesis Template

This is an improved version of the TU Delft PhD thesis template, versioned `ff9d073` (from July 2nd, 2015). It makes a number of improvements to increase both printing and on-screen quality, as well as reduce printing costs.

Specifically, it makes these key improvements over the TU Delft house style:

- It actually compiles (well, at least on the tested Linux systems).
- The page specification are much better suited to printing, by increasing the offset width so that text does not go into binding fold of the book too much. It also centers the text on the page much better in a printed book.
- It uses much nicer fonts for on- and off-screen readability, namely Libertinus for regular text and (https://fonts.google.com/specimen/Inconsolata)[Inconsolata] for monospaced texts such as source code listings.
- The dissertation comes with a much larger list of already incorporated packages, in the correct order (note that some LaTeX package orders are incompatible).
- It reduces the number of pages that need color, thus reducing printing costs, while pertaining TU Delft's signature blue for key elements such as chapter titles.
- It makes for more crisp printing, by converting 90% gray anthracite to a fully black tone. Gray scale values between 30% and 90% typically look blury in print because the printer simply uses less ink to print them. To cater for this, the header text size was reduced to not interfere with the text flow.
- It keeps a consistent style of reporting page numbers on top of pages.
- The screen and print versions of the PDF resemble each other more, while pertaining the benefits of each format (for example, for on-screen PDFs, no offset binding adjustment is needed).
- The propositions page can now fit a bigger amount of text. Moreover, the format of the propositions page now fits inside the thesis, instead of being the same size (which would stand outside the printed book).
- It includes commands to generate ready-to-be-printed PDFs with all fonts being embedded, a typical requirement to publish PDFs.