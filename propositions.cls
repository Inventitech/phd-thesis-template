\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{propositions}[2018/11/13 v2.0 TU Delft dissertation class by MB]
%% Changes over the 2013/07/08 v1.0 TU Delft dissertation class by Moritz Beller, moritzbeller -AT- gmx -DOT- de

\newif\if@nativefonts
\DeclareOption{nativefonts}{\@nativefontstrue}
\newif\if@print
\DeclareOption{print}{\@printtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\LoadClass[10pt]{book}

\RequirePackage{fontawesome}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{txfonts}
\RequirePackage{mathptmx}

%% English is the default language, but Dutch is used for some sections.
\RequirePackage[dutch,english]{babel}
\RequirePackage{calc}
\RequirePackage[nooneline,footnotesize]{caption}
%\RequirePackage{chapterbib}
\RequirePackage{etaremune}
\RequirePackage{fancyhdr}
\RequirePackage[flushmargin,hang]{footmisc}
\RequirePackage{ifpdf}
\RequirePackage{ifxetex}
\ifxetex
    \RequirePackage[xetex]{geometry}
    \RequirePackage[xetex,bookmarks=false,hidelinks]{hyperref}
    \RequirePackage{fontspec}
    \RequirePackage{xltxtra}
    \defaultfontfeatures{Ligatures=TeX}
\else
    \ifpdf
        \RequirePackage[pdftex]{geometry}
        \RequirePackage[pdftex,bookmarks=false,hidelinks]{hyperref}
    \else
        \RequirePackage[dvips]{geometry}
        \RequirePackage[hypertex,bookmarks=false,hidelinks]{hyperref}
        \fi
    \RequirePackage[utf8]{inputenc}
\fi
\RequirePackage{rotating}
\RequirePackage{tablefootnote}
\RequirePackage{lettrine}
\RequirePackage{metalogo}
\RequirePackage[sectionbib,numbers,sort&compress]{natbib}
\RequirePackage[noindentafter]{titlesec}
\RequirePackage{titletoc}
%\RequirePackage[nottoc]{tocbibind}
\RequirePackage[usenames,dvipsnames,svgnames,table,xcdraw]{xcolor}
%\RequirePackage[table]{xcolor}
\RequirePackage{tikz}

%% If the document is not compiled with XeLaTeX, we need to use the native
%% fonts.
\ifxetex\else
    \@nativefontstrue
\fi

\if@nativefonts
    %% The native font is Utopia Regular with Fourier math. We use Latin Modern
%% as a fallback, since Utopia lacks support for sans-serif and monospace.

 \RequirePackage{libertine}
    \RequirePackage{libertinust1math}
    \RequirePackage[T1]{fontenc}
    \RequirePackage[utf8]{inputenc}
    
    %% \RequirePackage{fourier}
    %% The style for titles is small caps.
    \def\titlefont{\rmfamily}
    \def\titleshape{\scshape}
    \def\titlestyle{\titlefont\titleshape\bfseries}
    \if@print
        \def\headerstyle{\titlefont\titleshape\bfseries}
    \else
        \def\headerstyle{\titlefont\titleshape}
        \fi
\else
    %% The TU Delft house style fonts are Bookman Old Style (serif) for titles
    %% and Tahoma (sans-serif) for text. Apart from these, we use Courier New
    %% for monospace and Cambria for math.
    \RequirePackage{unicode-math}

    \setmainfont[Path = fonts/libertinus/, ItalicFont=libertinusserif-italic.otf, BoldFont=libertinusserif-bold.otf, BoldItalicFont=libertinusserif-bolditalic.otf]{libertinusserif-regular.otf}
    \setsansfont[Path = fonts/libertinus/, BoldFont=libertinussans-bold.otf, ItalicFont=libertinussans-italic.otf]{libertinussans-regular.otf}
    \setmathfont[Path = fonts/libertinus/]{libertinusmath-regular.otf}
    \setmonofont[Scale=MatchLowercase, Path=fonts/inconsolata/]{Inconsolata-Regular.ttf}
    %% The default style for text is Tahoma (sans-serif).
    %\renewcommand*\familydefault{\sfdefault}
    %% The default style for titles is Bookman Old Style (serif).
    \def\titlefont{\rmfamily}
    \def\titleshape{}
    \if@print
        \def\titlestyle{\titlefont\titleshape\bfseries}
    \else
        \def\titlestyle{\titlefont\titleshape}
    \fi
    \def\headerstyle{\titlestyle}
\fi

%% Define the TU Delft house style colors.
\definecolor{tudelft-cyan}{cmyk}{1,0,0,0}
\definecolor{tudelft-black}{cmyk}{0,0,0,1}
\definecolor{tudelft-white}{cmyk}{0,0,0,0}
\definecolor{tudelft-sea-green}{cmyk}{0.54,0,0.32,0}
\definecolor{tudelft-green}{cmyk}{1,0.15,0.4,0}
\definecolor{tudelft-dark-blue}{cmyk}{1,0.66,0,0.4}
\definecolor{tudelft-purple}{cmyk}{0.98,1,0,0.35}
\definecolor{tudelft-turquoise}{cmyk}{0.82,0,0.21,0.08}
\definecolor{tudelft-sky-blue}{cmyk}{0.45,0,0.06,0.06}
\definecolor{tudelft-lavendel}{cmyk}{0.45,0.2,0,0.07}
\definecolor{tudelft-orange}{cmyk}{0.02,0.56,0.84,0}
\definecolor{tudelft-warm-purple}{cmyk}{0.58,1,0,0.02}
\definecolor{tudelft-fuchsia}{cmyk}{0.19,1,0,0.19}
\definecolor{tudelft-bright-green}{cmyk}{0.36,0,1,0}
\definecolor{tudelft-yellow}{cmyk}{0.02,0,0.54,0}

%% Use TU Delft cyan as the color for titles, unless the 'print' option is
%% specified, in which case we use anthracite, a dark gray, which is also used
%% for the thumb indices.
\definecolor{anthracite}{cmyk}{0,0,0,0.8}
\if@print
    \colorlet{title}{anthracite}
\else
    \colorlet{title}{tudelft-cyan}
\fi
\colorlet{thumb}{anthracite}

%% Set the paper size to 17 by 24 cm, approximately halfway between A4 and A5.
\if@print
    %% In print mode we add a 3 mm bleed on the outside of the page.
    \geometry{
        papersize = {173mm,246mm},
        layoutsize = {167mm,240mm},
        layoutoffset = {3mm,3mm},
        bindingoffset = -3mm
    }
\else
    \geometry{papersize={148mm,210mm}}
\fi
%% We decrease the margins slightly from the default (scale = 0.7).
\geometry{hscale=0.8,vscale=0.8}

%% Redefine the title command to accept an optional subtitle.
\renewcommand*\title[2][]{%
    \def\@subtitle{#1}%
    \def\@title{#2}%
    %% Add the title to the PDF meta data.
    \hypersetup{pdftitle=#2}%
}
%% Redefine the author command to accept a first and last name, and to add the
%% full name to the PDF meta data.
\renewcommand*\author[2]{%
    \def\@firstname{#1}%
    \def\@lastname{#2}%
    \hypersetup{pdfauthor=#1\ #2}%
}

%% Remove the header and page number on empty pages.
\def\cleardoublepage{%
    \clearpage%
    \if@twoside%
        \ifodd\c@page%
        \else%
            \thispagestyle{empty}%
            \vspace*{\fill}%
            \newpage%
        \fi%
    \fi%
}

\if@print%
    \newcommand*\cropmarks{%
        \ifodd\c@page%
            \begin{tikzpicture}[remember picture,overlay]
                \draw ($(current page.north east)+(0mm,-3mm)$) -- ($(current page.north east)+(-2mm,-3mm)$);
                \draw ($(current page.north east)+(-3mm,0mm)$) -- ($(current page.north east)+(-3mm,-2mm)$);
                \draw ($(current page.south east)+(0mm,3mm)$) -- ($(current page.south east)+(-2mm,3mm)$);
                \draw ($(current page.south east)+(-3mm,0mm)$) -- ($(current page.south east)+(-3mm,2mm)$);
            \end{tikzpicture}%
        \else%
            \begin{tikzpicture}[remember picture,overlay]
                \draw ($(current page.north west)+(0mm,-3mm)$) -- ($(current page.north west)+(2mm,-3mm)$);
                \draw ($(current page.north west)+(3mm,0mm)$) -- ($(current page.north west)+(3mm,-2mm)$);
                \draw ($(current page.south west)+(0mm,3mm)$) -- ($(current page.south west)+(2mm,3mm)$);
                \draw ($(current page.south west)+(3mm,0mm)$) -- ($(current page.south west)+(3mm,2mm)$);
            \end{tikzpicture}%
        \fi%
    }
\else
    \newcommand*\cropmarks{}
\fi%

%%% Thumb indices consist of white text on a rectangular colored background. The
%%% font-size is 75% of the size of thumb height.
\newif\ifthumb
\newlength\thumbheight
\setlength\thumbheight{24pt}
\newlength\thumbedge
\setlength\thumbedge{4pt}
\newlength\thumbhspace
\setlength\thumbhspace{36pt}
\newlength\thumbvspace
\setlength\thumbvspace{2\thumbheight}

\newlength\thumbwidth
\setlength\thumbwidth{36pt}
\newlength\thumbspacing
\setlength\thumbspacing{2\thumbheight}

%% We need the TikZ library calc to calculate the coordinates of the thumb
%% indices.
\usetikzlibrary{calc}

%% The lthumb command prints the current chapter number in a thumb index on the
%% left (even) page.
\newcommand*\lthumb{%
    \ifthumb%
        \begin{tikzpicture}[remember picture,overlay]
            \coordinate (top margin) at (0pt,1in+\topmargin+\headheight+\headsep);
            \coordinate (left margin) at (1in+\evensidemargin,0pt);
            %% Calculate the corners of the thumb index based on the current
            %% chapter number.
            \coordinate (top left) at ($(current page.north west)-(top margin)-(0pt,\value{chapter}\thumbvspace-\thumbvspace)$);
            \coordinate (bottom right) at ($(top left)+(left margin)-(\thumbhspace,\thumbheight)$);
            %% Shift the left edge to prevent the rounded corner from showing.
            \coordinate (top left) at ($(top left)-(\thumbedge,0pt)$);
            %% Draw the thumb index.
            \fill[fill=thumb,rounded corners=\thumbedge](top left) rectangle (bottom right);
            %% Print the chapter number at the center right in the thumb index.
            \coordinate (center right) at ($(bottom right)+(0pt,0.5\thumbheight)$);
            \node at (center right)[anchor=east,inner sep=2\thumbedge]{
                \titlefont\bfseries\color{tudelft-white}
                \fontsize{0.75\thumbheight}{0.75\thumbheight}\selectfont
                \thechapter
            };
        \end{tikzpicture}%
    \fi%
}

%% rthumb draws a thumb index on the right (odd) page.
\newcommand*\rthumb{%
    \ifthumb%
        \begin{tikzpicture}[remember picture,overlay]
            \coordinate (top margin) at (0pt,1in+\topmargin+\headheight+\headsep);
            \coordinate (right margin) at (1in+\evensidemargin,0pt);
            %% Calculate the corners of the thumb index based on the current
            %% chapter number.
            \coordinate (top right) at ($(current page.north east)-(top margin)-(0pt,\value{chapter}\thumbvspace-\thumbvspace)$);
            \coordinate (bottom left) at ($(top right)-(right margin)-(-\thumbhspace,\thumbheight)$);
            %% Shift the left right to prevent the rounded corner from showing.
            \coordinate (top right) at ($(top right)+(\thumbedge,0pt)$);
            %% Draw the thumb index.
            \fill[fill=thumb,rounded corners=\thumbedge](top right) rectangle (bottom left);
            %% Print the chapter number at the center right in the thumb index.
            \coordinate (center left) at ($(bottom left)+(0pt,0.5\thumbheight)$);
            \node at (center left)[anchor=west,inner sep=2\thumbedge]{
                \titlefont\bfseries\color{tudelft-white}
                \fontsize{0.75\thumbheight}{0.75\thumbheight}\selectfont
                \thechapter
            };
        \end{tikzpicture}%
    \fi%
}

%% Page style for empty pages.
\fancypagestyle{empty}{%
    \fancyhf{}
    \renewcommand*\headrulewidth{0pt}
    \renewcommand*\footrulewidth{0pt}
    \fancyhead{\cropmarks}
}

%% Page style for title pages.
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand*\headrulewidth{0pt}
    \renewcommand*\footrulewidth{0pt}
    \fancyhead{\cropmarks}
    \fancyfoot[C]{\titlefont\thepage}
}

%% Fancy style for the main matter.
\fancypagestyle{mainmatter}{%
    \fancyhf{}
    %% Page numbers on the top left and top right.
    \fancyhead[LE]{\cropmarks\lthumb\titlefont\color{thumb}\thepage}
    \fancyhead[RO]{\cropmarks\rthumb\titlefont\color{thumb}\thepage}
    %% Chapter name on the left (even) page.
    \fancyhead[RE]{\titlefont\titleshape\color{thumb}\nouppercase{\leftmark}}
    %% Section name on the right (odd) page.
    \fancyhead[LO]{\titlefont\titleshape\color{thumb}\nouppercase{\rightmark}}
}

%% The mainmatter style is default for normal pages.
\pagestyle{mainmatter}

%% Print the current chapter and section at the top of the page in cyan.
\renewcommand*\chaptermark[1]{\markboth{\color{thumb}\thechapter\ #1}{}}
\renewcommand*\sectionmark[1]{\markright{\color{thumb}\thesection\ #1}}

%% The setheader command can be used to print the title of unnumbered chapters
%% in the page header.
\newcommand*\setheader[1]{\markboth{\color{thumb}#1}{\color{thumb}#1}}

%% Change the headrule command (from fancyhdr.sty) to draw the line below the
%% header in the title color.
\renewcommand*\headrule{%
    \if@fancyplain%
        \let\headrulewidth\plainheadrulewidth%
    \fi%
    {\color{thumb}\hrule\@height\headrulewidth\@width\headwidth}%
    \vskip-\headrulewidth%
}

%% Draw the line above a footnote in the title color as well.
\renewcommand*\footnoterule{%
    \vspace*{-3pt}%
    {\color{thumb}\hrule width 0.5\textwidth height 0.4pt}%
    \vspace*{2.6pt}%
}

%% A part title starts with a huge (96pt) bold black number, flushed to the
%% right, followed by the part name on the next line in the title color.
\titleformat{\part}[display]
    {\flushright\titlestyle}
    {\fontsize{96pt}{96pt}\selectfont\bfseries\thepart}
    {0pt}
    {\Huge\color{title}}
%% Separate the title from the text by two empty lines.
\titlespacing{\part}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, the part name is preceded by an empty line, printed
%% in bold, and not followed by a line of dots.
\dottedcontents{part}[0em]{\vspace{\baselineskip}\titlefont\bfseries}{1.5em}{0pc}

%% Chapter titles have the same layout as parts.
\titleformat{\chapter}[display]
    {\flushright\titlestyle}
    {\fontsize{84pt}{84pt}\selectfont\bfseries\thechapter}
    {0pt}
    {\Huge\color{title}}
\titlespacing{\chapter}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, a chapter is similar to a part, except that it is
%% preceded by half an empty line.
\dottedcontents{chapter}[1.5em]{\vspace{0.5\baselineskip}\titlefont\bfseries}{1.5em}{0pc}

%% Section titles start with the number in bold, followed by the name printed
%% in the title color.
\titleformat{\section}
    {\Large\bfseries\headerstyle}
    {\thesection\ }
    {0pt}
    {\color{black}}
%% Sections are preceded by an empty line.
\titlespacing{\section}{0pt}{\baselineskip}{0pt}
%% In the table of contents, section names are followed by a line of dots 8pt
%% apart.
\dottedcontents{section}[3.8em]{\titlefont}{2.3em}{8pt}

%% Subsection titles have the same layout as section titles, except in a smaller
%% font.
\titleformat{\subsection}
    {\large\bfseries\headerstyle}
    {\thesubsection\ }
    {0pt}
    {\color{black}}
\titlespacing{\subsection}{0pt}{\baselineskip}{0pt}
\dottedcontents{subsection}[7em]{\titlefont}{3.2em}{8pt}

%% Subsubsections have the same font and color as sections and subsections, but
%% are not preceded by a number.
\titleformat{\subsubsection}
    {\bfseries\headerstyle}
    {}
    {0pt}
    {\color{black}}
%% Subsubsections are preceded by an empty line and do not appear in the table
%% of contents.
\titlespacing{\subsubsection}{0pt}{\bigskipamount}{0pt}

%% Color the bullets of the itemize environment and make the symbol of the third
%% level a diamond instead of an asterisk.
\renewcommand*\labelitemi{\color{black}\textbullet}
\renewcommand*\labelitemii{\color{black}--}
\renewcommand*\labelitemiii{\color{black}$\diamond$}
\renewcommand*\labelitemiv{\color{black}\textperiodcentered}

%% The dedication is vertically centered on a separate page and flushed to the
%% right.
\newcommand\dedication[1]{%
    \thispagestyle{empty}%
    \vspace*{\fill}%
    \begin{flushright}%
        #1%
    \end{flushright}%
    \vspace*{\fill}%
    \cleardoublepage%
}

%% Define an unnumbered footnote command.
\def\blfootnote{\xdef\@thefnmark{}\@footnotetext}

%% The authors environment is used to display the authors of a chapter on the
%% title page. This is only necessary if multiple people contributed
%% significantly to the chapter.
\newcommand*\authors[1]{%
    \begin{center}%
        {\Large\bfseries #1}%
    \end{center}%
    \vspace{2\baselineskip}%
}

%% The epigraph environment can be used to to add a quote to the title page of
%% a chapter.
\newcommand\epigraph[3][2\baselineskip]{%
    \begin{flushright}%
        {\rmfamily\itshape #2}%
        \vskip 0.5\baselineskip%
        #3%
    \end{flushright}%
    \vspace{#1}%
}

%% The abstract environment is used for the abstract of a chapter.
\newenvironment{abstract}{%
    \list{}{\leftmargin\rightmargin}%
    \item%
    \relax%
    \rmfamily\itshape%
}{%
    \endlist%
}

%% Define a drop command which can be used to generate drop caps at the
%% beginning of a section.
\renewcommand*\LettrineTextFont{\titleshape}
\newcommand*\dropcap[2]{
    \lettrine[lines=2,findent=0.2em,nindent=0pt]{\color{black} #1}{#2}%
}

%% Create an unnumbered reference section.
\addto\captionsenglish{\renewcommand*\bibname{\color{black}References}}
\newcommand*\references[1]{%
    \bibliographystyle{dissertation}%
    \bibliography{#1}%
}

%% Hyperlinks are cyan, except in print mode, when they are all black.
\hypersetup{
    colorlinks = false
}

