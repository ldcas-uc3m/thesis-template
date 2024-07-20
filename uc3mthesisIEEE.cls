% Bachelor Thesis Template of the Universidad Carlos III de Madrid, IEEE style, loosely following doctoral thesis guidelines (https://uc3m.libguides.com/en/thesis/writing)
% Based on the University Library's Bachelor Thesis Template, found in https://www.overleaf.com/latex/templates/bachelor-thesis-template-uc3m-ieee-style/rtmtnzvxjnwt
% Made by Luis Daniel Casais Mezquida <https://github.com/ldcas-uc3m>

% LICENSE: Creative Commons CC BY 4.0

% WARNING: This Guide contains Library recommendations based mainly on the IEEE style, but you must always follow the guidelines of your TFG Tutor and the TFG regulations for your degree



\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uc3mthesisIEEE}[UC3M bachelor's thesis IEE template]

\RequirePackage{etoolbox}


%----------
% PACKAGE OPTIONS
%----------

% english
\newif\if@langen@pp\@langen@ppfalse  % check en language
\DeclareOption{en}{\@langen@pptrue}
% spanish
\newif\if@langes@pp\@langes@ppfalse  % check es language
\DeclareOption{es}{\@langes@pptrue}

\ExecuteOptions{en}  % defaults
\ProcessOptions\relax


%----------
% COLORS
%----------

% Color settings for cover and code listings
\RequirePackage[table]{xcolor}
\definecolor{azulUC3M}{HTML}{000e78}
\definecolor{gray97}{gray}{.97}
\definecolor{gray75}{gray}{.75}
\definecolor{gray45}{gray}{.45}



%----------
% DOCUMENT SETTINGS
%----------

\LoadClass[12pt,twoside,openright]{report}  % font: 12pt

\RequirePackage[a4paper,vmargin=2.5cm,hmargin=3cm]{geometry}
\RequirePackage{emptypage}  % removes headers/footers from empty pages

% narrow spacing
\renewcommand{\baselinestretch}{1.15}  % line spacing
\parskip=6pt  % paragraph spacing

% blue footnote line
\preto{\footnoterule}{\color{azulUC3M}}
\appto{\footnoterule}{\color{black}}


% PDF/A -- Important for its inclusion in e-Archive. PDF/A is the optimal format for preservation and for the generation of metadata: http://uc3m.libguides.com/ld.php?content_id=31389625.

% In the template we include the file OUTPUT.XMPDATA. You can download that file and include the metadata that will be incorporated into the PDF file when you compile the report.tex file. Then upload it back to your project.
\RequirePackage[a-1b]{pdfx}

% TODO: automate PDF/A generation (output.xmpdata): https://webpages.tuni.fi/latex/pdfa-guide.pdf



%----------
% LINKS
%----------

\RequirePackage{hyperref}
\hypersetup{
	colorlinks=true,
	linkcolor=black,  % links to parts of the document (e.g. index) in black
	citecolor=black,  % citations
	urlcolor=blue  % links to resources outside the document in blue
}



%----------
% MATH
%----------

\RequirePackage{amsmath, amssymb, amsfonts, amsthm, mathtools, textcomp}

% usefull macros
\DeclarePairedDelimiter\ceil{\lceil}{\rceil}
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor}



%----------
% ENCODING & FONTS
%----------

\RequirePackage{txfonts}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{mathptmx}  % times new roman
\RequirePackage{eurosym}  % \euro




%----------
% LANGUAGE
%----------

\if@langes@pp
	\RequirePackage[spanish,es-tabla]{babel}
	\RequirePackage[babel,spanish=spanish]{csquotes}

	\renewcommand{\bibname}{Referencias}
	\def\@acknowledgements@text{Dedicatoria}
	\def\@abstract@text{Resumen}
	\def\@keywords@text{Palabras clave}
	\def\@thesis@text{Trabajo Fin de Grado}
	\def\@author@text{Autor}
	\def\@advisor@text{Tutor}
	\def\@ccstring{Esta obra se encuentra sujeta a la licencia Creative Commons\\\textbf{Reconocimiento - No Comercial - Sin Obra Derivada}}
	\def\@table@caption{TABLA}
	\def\@pluralpostfix{es}
\fi

\if@langen@pp
	\RequirePackage[english]{babel}
	\RequirePackage[babel,english=american]{csquotes}

	\renewcommand{\bibname}{References}
	\def\@acknowledgements@text{Acknowledgements}
	\def\@abstract@text{Abstract}
	\def\@keywords@text{Keywords}
	\def\@thesis@text{Bachelor Thesis}
	\def\@author@text{Author}
	\def\@advisor@text{Advisor}
	\def\@ccstring{This work is licensed under Creative Commons\\\textbf{Attribution - Non Commercial - Non Derivatives}}
	\def\@table@caption{TABLE}
	\def\@pluralpostfix{s}
\fi

\AtBeginEnvironment{quote}{\small}


%----------
% HEADERS & FOOTERS
%----------

\RequirePackage{fancyhdr}

\preto{\headrule}{\color{azulUC3M}}  % blue headrule
\preto{\footrule}{\color{azulUC3M}}  % blue footrule

% fix headheight
\if@langes@pp
	\setlength{\headheight}{16pt}
\else
	\setlength{\headheight}{15pt}
\fi
% \renewcommand{\chaptermark}[1]{\markboth{#1}{}}  % \leftmark with just chapter names

\makeatletter
% redefine \chaptermark to avoid \MakeUppercase
\renewcommand{\chaptermark}[1]{%
  \markboth{%
    \ifnum\c@secnumdepth>\m@ne
      \@chapapp~\thechapter.~~%
    \fi
  #1%
  }{}%
}

\fancypagestyle{fancy} {
	\fancyhf{}
	\fancyhead[LO]{\color{azulUC3M}\textsc{\leftmark}}  % chapter name
	\ifdef{\@shorttitle}  % title
		{\fancyhead[RE]{\color{azulUC3M}\textsc{\@shorttitle}}}
		{\fancyhead[RE]{\color{azulUC3M}\@title}}
	\fancyhead[LE,RO]{\color{azulUC3M}\thepage}  % page number
	\renewcommand{\headrulewidth}{0.4pt}
}

\makeatother


\fancypagestyle{noheader} {
  \fancyhf{}  % Clear header/footer
  \renewcommand{\headrulewidth}{0pt}  % No header rule
  \cfoot{\color{azulUC3M}\thepage}
}



%----------
% TITLES
%----------

\RequirePackage{titlesec}


% chapter
\titleformat{\chapter}[display]
	{\filcenter\color{azulUC3M}}  % format
	{  % label
		\vspace{2.5cm}
		% \titlerule[5pt]
		% \vspace{5pt}
		\titlerule[2pt]
		\vspace{1pc}
		\bfseries
		\Huge\MakeUppercase{\chaptertitlename} \thechapter
	}
	{1pc}  % separator (between label and title body)
	{  % before-title
		\thispagestyle{noheader}
		\titlerule[2pt]
		\Huge\MakeUppercase
	}
	[]  % after-title
\titlespacing*{\chapter}  % * for no indent
	{0em}  % left margin
	{0em}  % vspace above
	{2cm}  % vspace below

% section
\titleformat{\section}
	{\large\bfseries\color{azulUC3M}}  % format
	{\thesection.}  % label
	{1pc}  % separator
	{}
\titlespacing*{\section}
	{0pt}  % left margin
	{2em}  % vspace above
	{1em}  % vspace below

% subsection
\titleformat{\subsection}
	{\normalsize\bfseries\color{azulUC3M}}
	{\thesubsection.}
	{5pt}
	{}
\titlespacing*{\subsection}
	{0pt}  % left margin
	{1.5em}  % vspace above
	{0.5em}  % vspace below

% subsubsection
\titleformat{\subsubsection}
	{\normalsize\bfseries\color{azulUC3M}}
	{\thesubsubsection.}
	{}
	{}
\titlespacing*{\subsubsection}
	{0em}  % left margin
	{1em}  % vspace above
	{0em}  % vspace below



%----------
% TOC
%----------

\RequirePackage{titletoc}
\RequirePackage[titles]{tocloft}

\setcounter{tocdepth}{2}  % until subsection

% pagestyle
\tocloftpagestyle{noheader}

% fix bug where middle pages don't get the style
\preto{\tableofcontents}{\pagestyle{noheader}}
\preto{\listoffigures}{\pagestyle{noheader}}
\preto{\listoftables}{\pagestyle{noheader}}


% chapters
\makeatletter
\titlecontents{chapter}
	[-5pt]  % left margin
	{\addvspace{1pc}}  % above
	{  % before with label
		\hypersetup{hidelinks}
		\bfseries
		\color{azulUC3M}
		\@chapapp~\thecontentslabel.\enspace  % label
	}
	{  % before without label
		\hypersetup{hidelinks}
		\bfseries
		\color{azulUC3M}
	}
	{  % filler and page
		\color{azulUC3M}
		% \titlerule*[.7pc]{.}%
		\hfill
		\hypersetup{hidelinks}
		\bfseries
		\contentspage
	}
\makeatother

% sections
\titlecontents{section}
	[5pt]  % left margin
	{}  % above
	{\contentsmargin{0pt}\thecontentslabel.\enspace}  % before with label
	{\contentsmargin{0pt}}  % before without label
	{\titlerule*[.7pc]{.}\contentspage}  % filler and page

% subsections
\titlecontents{subsection}[10pt]
	{}
	{\contentsmargin{0pt} \thecontentslabel.\enspace}
	{\contentsmargin{0pt}}
	{\titlerule*[.7pc]{.}\contentspage}

% blue colors for chapters
\renewcommand{\cftchapfont}{\hypersetup{hidelinks}\bfseries\color{azulUC3M}}
\renewcommand{\cftchappagefont}{\bfseries\color{azulUC3M}}



%----------
% TABLES
%----------

\RequirePackage{array}
\RequirePackage{multirow}  % combine cells
\RequirePackage{caption}  % customize the title of tables and figures
% \RequirePackage{float}
\usepackage{floatrow} % use \ttabbox{\caption{}\label{}}{<tabular>} and \ffigbox{\caption{}\label{}}{<graphic>} to align the table/figure captions according to the defined style
\RequirePackage{tablefootnote}  % allow footnotes from text in tables (\tablefootnote)
\RequirePackage{threeparttable}  % fancier tables (with tablenotes)
\RequirePackage{booktabs}  % \toprule, \bottomrule
\RequirePackage{adjustbox}  % a better \resizebox: \begin{adjustbox}{max width=\textwidth} \end{adjustbox}



% new type of column for tables
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}  % custom width and centered content
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}  % custom width and right aligned


% Table layout for engineering
\captionsetup[table]{
	format=plain,
	justification=centering,
	singlelinecheck=off,
	labelsep=newline,
	% width=.8\linewidth,
	font=small,
	position=top,
	labelfont={bf,sc,color=azulUC3M},
	textfont=sc
}
\floatsetup[table]{style=plaintop}


%----------
% FIGURES
%----------

\RequirePackage{graphicx}
\RequirePackage{svg}
\RequirePackage{subcaption}  % \begin{subfigure}, etc.

\graphicspath{{img/}}  % Images folder

% Figures layout for engineering
\captionsetup[figure]{
	format=hang,
	name=Fig.,
	justification=RaggedRight,
	singlelinecheck=off,
	labelsep=period,
	font=small,
	position=bottom,
	labelfont={bf,color=azulUC3M},
}



%----------
% FOOTNOTES
%----------

\RequirePackage{chngcntr}  % continuous numbering of footnotes
\counterwithout{footnote}{chapter}

% blue footnote line
\preto{\footnoterule}{\color{azulUC3M}}
\appto{\footnoterule}{\color{black}}



%----------
% CODE LISTINGS
%----------

\RequirePackage{listings}
% more information in  https://es.wikibooks.org/wiki/Manual_de_LaTeX/Listados_de_código/Listados_con_listings

% Custom listing
\lstdefinestyle{estilo}{
	frame=Ltb,
	framerule=0pt,
	aboveskip=0.5cm,
	framextopmargin=3pt,
	framexbottommargin=3pt,
	framexleftmargin=0.4cm,
	framesep=0pt,
	rulesep=.4pt,
	backgroundcolor=\color{gray97},
	rulesepcolor=\color{black},
	%
	basicstyle=\ttfamily\footnotesize,
	keywordstyle=\bfseries,
	stringstyle=\ttfamily,
	showstringspaces = false,
	commentstyle=\color{gray45},
	%
	% numbers=left,
	% numbersep=15pt,
	% numberstyle=\tiny,
	% numberfirstline = false,
	breaklines=true,
	xleftmargin=\parindent
}

\captionsetup*[lstlisting]{font=small, labelsep=period}

\lstset{style=estilo}
\renewcommand{\lstlistingname}{\uppercase{Código}}



%----------
% COVER
%----------

\RequirePackage{listofitems}
\RequirePackage{xspace}
\RequirePackage{xifthen}  % \isempty

\makeatletter

% setup variables
\newcommand{\advisors}[1] {
	\readlist*\@advisors{#1}
}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\subject}[1]{\gdef\@subject{#1}}
\newcommand{\place}[1]{\gdef\@place{#1}}
\newcommand{\shorttitle}[1]{\gdef\@shorttitle{#1}}

\newcommand{\makecover} {  % requires \degree, \subject, \author, \course, \title, \advisors, \place, \date

	\pagenumbering{roman}  % roman numerals are used in the numbering of the pages preceding the body of the work

	\begin{titlepage}
		\color{azulUC3M}
		\begin{center}
			\begin{figure}[H]  % UC3M Logo
				\includesvg[width=\textwidth]{uc3m_logo.svg}
			\end{figure}
			%
			\vspace{1.5cm}
			\begin{Large}
				\@degree\\
				\vspace{2cm}
				\textsl{\@thesis@text}
				\bigskip
			\end{Large}

			{\Huge ``\@title''}\\
			% \vspace*{0.5cm}
			\medskip
			\rule{10.5cm}{0.1mm}\\
			% \vspace*{0.3cm}
			\medskip
			\Large\textit{\@author@text}\\
			{\LARGE \@author}\\
			% \vspace*{0.3cm}
			\medskip
			%
			\begin{Large}
				\if\listlen\@advisors[]1  % only one advisor
					\textit{\@advisor@text}\\
				\else
					\textit{\@advisor@text\@pluralpostfix}\\
				\fi
				\foreachitem\z\in\@advisors[]{
					\z\\
				}
				% \vspace*{1cm}
				\bigskip
				\@place\\
				\@date\\
			\end{Large}
		\end{center}
		%
		\vfill
		\color{black}
		% IF OUR WORK IS TO BE PUBLISHED UNDER A CREATIVE COMMONS LICENSE, INCLUDE THESE LINES. IS THE RECOMMENDED OPTION.
		\includegraphics[width=4.2cm]{creativecommons.png}\\ % Creative Commons Logo
		\smallskip
		\small\@ccstring
	\end{titlepage}

}

\makeatother



%----------
% EPIGRAPH
%----------

\RequirePackage{epigraph}

% patch epigraph internal commands, with the etoolbox package
\makeatletter
\newlength\epitextskip
\pretocmd{\@epitext}{\em}{}{}
\apptocmd{\@epitext}{\em}{}{}
\patchcmd{\epigraph}{\@epitext{#1}\\}{\@epitext{#1}\\[\epitextskip]}{}{}  % space in between text and source
\patchcmd{\epigraph}{\@episource{#2}}{\textbf{\@episource{--- #2}}}{}{}  % bold on source
\makeatother

% epigraph config
\setlength\epigraphrule{0pt}
\setlength\epitextskip{2ex}
\setlength\epigraphwidth{.5\textwidth}


% \makeepigraph{quote}{author}{source}
\newcommand{\makeepigraph}[3] {
  \blankpage

	\thispagestyle{empty}

	\vspace*{\fill}

	\ifblank{#3}
		{\epigraph{#1}{#2}}  % no source
		{\epigraph{#1}{#2, \textit{#3}}}

	\vspace*{\fill}
}



%----------
% ACKNOWLEDGEMENTS
%----------

\makeatletter
\newenvironment{acknowledgements}
	{  % begin definition
		\pagestyle{noheader}
		\chapter*{\@acknowledgements@text}
	}
	{\cleardoublepage}  % end definition
\makeatother


%----------
% ABSTRACT
%----------

\makeatletter
\renewenvironment{abstract}
	{  % begin definition
		\pagestyle{noheader}
		\chapter*{\@abstract@text}
	}
	{\cleardoublepage\pagestyle{noheader}}  % end definition

% TODO: automate keywords, inserting automatic separators

\newcommand{\keywords}[1]{
	\vfill
	\textbf{\@keywords@text:} #1%
}

\newcommand*\bigcdot{\mathpalette\bigcdot@{.5}}
\newcommand*\bigcdot@[2]{\mathbin{\vcenter{\hbox{\scalebox{#2}{$\m@th#1\bullet$}}}}}

\makeatother

\newcommand{\sep}{$\bigcdot$\xspace}



%----------
% THESIS
%----------

\newenvironment{thesis}
	{  % begin definition
		\cleardoublepage
		\pagestyle{fancy}
		\pagenumbering{arabic}  % numbering with Arabic numerals for the rest of the document
	}
	{\pagestyle{noheader}}  % end definition



%----------
% GLOSSARY
%----------
\RequirePackage[acronym,toc,style=altlistgroup]{glossaries}
\renewcommand*{\glsnamefont}[1]{\color{azulUC3M}#1}  % blue entry names
\renewcommand*{\glslistgroupheaderfmt}[1]{\color{azulUC3M}#1}  % blue letter index
\preto{\printglossaries}{\pagestyle{noheader}}

%----------
% BIBLIOGRAPHY
%----------

\RequirePackage[backend=biber, style=ieee, isbn=false, sortcites, maxbibnames=6, minbibnames=1]{biblatex} % IEEE citation style
\preto{\printbibliography}{\pagestyle{noheader}}

% force break of lines when necessary
\setcounter{biburlnumpenalty}{9000}
\setcounter{biburlucpenalty}{9000}
\setcounter{biburllcpenalty}{9000}



%----------
% APPENDIXES
%----------

\RequirePackage[header,title]{appendix}

% set appendix name in TOC
\makeatletter
\BeforeBeginEnvironment{appendices}{%
	\addtocontents{toc}{\protect\renewcommand{\protect\@chapapp}{\appendixname}}
}
\makeatother

\AtBeginEnvironment{appendices}{%
	\cleardoublepage
	\pagenumbering{gobble}  % remove appendices have no page numbers
	\setcounter{footnote}{0}  % reset footnote counter
}


%----------
% MACROS
%----------

\newcommand{\blankpage} {
	\clearpage  % blank page
	\thispagestyle{empty}
	\mbox{}
	\newpage
}

