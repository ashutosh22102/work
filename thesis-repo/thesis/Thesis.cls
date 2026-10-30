%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Thesis LaTeX Template - THESIS CLASS FILE
%
% This template has been downloaded from:
% http://www.latextemplates.com
%
% This class file defines the structure and design of the template. 
%
% There is one part of this file that needs to be filled out - the variables
% dictating the document particulars such as the author name, university
% name, etc. You will find these in the commented "DOCUMENT VARIABLES"
% section below.
%
% The other two easily-editable sections are the margin sizes and abstract.
% These have both been commented for easy editing. Advanced LaTeX
% users will have no trouble editing the rest of the document to their liking.
%
% Original header:
%% This is file `Thesis.cls', based on 'ECSthesis.cls', by Steve R. Gunn
%% generated with the docstrip utility.
%%
%% Created by Steve R. Gunn, modified by Sunil Patel: www.sunilpatel.co.uk
%% Further modified by www.latextemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{Thesis}
              [2007/22/02 v1.0
   LaTeX document class]
\def\baseclass{book}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}
\def\@checkoptions#1#2{
  \edef\@curroptions{\@ptionlist{\@currname.\@currext}}
  \@tempswafalse
  \@tfor\@this:=#2\do{
    \@expandtwoargs\in@{,\@this,}{,\@curroptions,}
    \ifin@ \@tempswatrue \@break@tfor \fi}
  \let\@this\@empty
  \if@tempswa \else \PassOptionsToClass{#1}{\baseclass}\fi
}
\@checkoptions{12pt}{{10pt}{11pt}{12pt}} % SRH guideline 4.1.4: 12 point text
\PassOptionsToClass{a4paper}{\baseclass}
\ProcessOptions\relax
\LoadClass{\baseclass}
\newcommand\bhrule{\typeout{------------------------------------------------------------------------------}}

% Declaration of honor: placed at the very end and not listed in the
% table of contents (guideline 4.1.1)
\newcommand\Declaration[1]{
\btypeout{Declaration of Honor}
\clearpage
\thispagestyle{plain}
\null\vfil
%\vskip 60\p@
\begin{center}{\fontsize{14}{17}\selectfont\bfseries Declaration of Honor\par}\end{center}
%\vskip 60\p@
{\normalsize #1}
\vfil\vfil\null
%\cleardoublepage
}

\newcommand\btypeout[1]{\bhrule\typeout{\space #1}\bhrule}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space \number\year}
\usepackage{setspace}
\onehalfspacing
\setlength{\parindent}{0pt}
\setlength{\parskip}{2.0ex plus0.5ex minus0.2ex}
\RequirePackage{iftex}
\ifPDFTeX
  \RequirePackage[utf8]{inputenc} % Allows the use of international characters (e.g. Umlauts)
\fi

%----------------------------------------------------------------------------------------
%	MARGINS - SRH guideline 4.1.4: 2.5 cm on all sides, DIN A4, single-sided
%----------------------------------------------------------------------------------------
\RequirePackage[a4paper,margin=2.5cm,headheight=15pt,headsep=0.6cm]{geometry}
%----------------------------------------------------------------------------------------
\raggedbottom
\setlength{\topskip}{1\topskip \@plus 5\p@}
\doublehyphendemerits=10000       % No consecutive line hyphens.
\brokenpenalty=10000              % No broken words across columns/pages.
\widowpenalty=9999                % Almost no widows at bottom of page.
\clubpenalty=9999                 % Almost no orphans at top of page.
\interfootnotelinepenalty=9999    % Almost never break footnotes.
\usepackage{fancyhdr}
\usepackage{titlesec}
% SRH guideline 4.1.5: 14pt bold / 12pt bold / 12pt normal / 12pt italic,
% all numbered, no period after the last number
\titleformat{\chapter}[hang]
    {\fontsize{14}{17}\selectfont\bfseries}{\thechapter}{1em}{}
\titlespacing*{\chapter}{0pt}{0pt}{12pt}

\titleformat{\section}[hang]
    {\normalsize\bfseries\raggedright}{\thesection}{1em}{}
\titlespacing*{\section}{0pt}{12pt}{6pt}

\titleformat{\subsection}[hang]
    {\normalsize\mdseries}{\thesubsection}{1em}{}
\titlespacing*{\subsection}{0pt}{10pt}{0pt}

\titleformat{\subsubsection}[hang]
    {\normalsize\itshape}{\thesubsubsection}{1em}{}
\titlespacing*{\subsubsection}{0pt}{8pt}{0pt}

\titleformat{\paragraph}[runin]
    {\normalsize\itshape}{\theparagraph}{1em}{}
\titlespacing*{\paragraph}{0pt}{0pt}{1em}

\lhead[\rm\thepage]{\fancyplain{}{\sl{\rightmark}}}
\rhead[\fancyplain{}{\sl{\leftmark}}]{\rm\thepage}
\chead{}\lfoot{}\rfoot{}\cfoot{}
\pagestyle{fancy}
% Chapter opening pages: page number top right as on all other pages (guideline 4.1.4)
\fancypagestyle{plain}{\fancyhf{}\fancyhead[R]{\thepage}\renewcommand{\headrulewidth}{0pt}}
\renewcommand{\chaptermark}[1]{\btypeout{\thechapter\space #1}\markboth{\@chapapp\ \thechapter\ #1}{\@chapapp\ \thechapter\ #1}}
\renewcommand{\sectionmark}[1]{}
\renewcommand{\subsectionmark}[1]{}
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\usepackage{amsmath,amsfonts,amssymb,amscd,amsthm,xspace}
\theoremstyle{plain}
\newtheorem{example}{Example}[chapter]
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{axiom}[theorem]{Axiom}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\theoremstyle{remark}
\newtheorem{remark}[theorem]{Remark}
\usepackage[centerlast,small,sc]{caption}
\setlength{\captionmargin}{20pt}
\newcommand{\fref}[1]{Figure~\ref{#1}}
\newcommand{\tref}[1]{Table~\ref{#1}}
\newcommand{\eref}[1]{Equation~\ref{#1}}
\newcommand{\cref}[1]{Chapter~\ref{#1}}
\newcommand{\sref}[1]{Section~\ref{#1}}
\newcommand{\aref}[1]{Appendix~\ref{#1}}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\dbltopfraction}{.85}
\renewcommand{\floatpagefraction}{0.75}
\renewcommand{\dblfloatpagefraction}{.75}
\setcounter{topnumber}{9}
\setcounter{bottomnumber}{9}
\setcounter{totalnumber}{20}
\setcounter{dbltopnumber}{9}
\usepackage{graphicx}
\usepackage{epstopdf}
\usepackage{booktabs}
\usepackage{rotating}
\usepackage{listings}
\usepackage{lstpatch}
\lstset{captionpos=b,
        frame=tb,
        basicstyle=\scriptsize\ttfamily,
        showstringspaces=false,
        keepspaces=true}
\lstdefinestyle{matlab} {
        language=Matlab,
        keywordstyle=\color{blue},
        commentstyle=\color[rgb]{0.13,0.55,0.13}\em,
        stringstyle=\color[rgb]{0.7,0,0} }
\usepackage[pdfpagemode={UseOutlines},bookmarks=true,bookmarksopen=true,
   bookmarksopenlevel=0,bookmarksnumbered=true,hypertexnames=false,
   colorlinks,linkcolor={blue},citecolor={blue},urlcolor={red},
   pdfstartview={FitV},unicode,breaklinks=true]{hyperref}
\pdfstringdefDisableCommands{
   \let\\\space
}
\newcommand*{\supervisor}[1]{\def\supname{#1}}
\newcommand*{\thesistitle}[1]{\def\ttitle{#1}}
\newcommand*{\examiner}[1]{\def\examname{#1}}
\newcommand*{\degree}[1]{\def\degreename{#1}}
\newcommand*{\authors}[1]{\def\authornames{#1}}
\newcommand*{\addresses}[1]{\def\addressnames{#1}}
\newcommand*{\university}[1]{\def\univname{#1}}
\newcommand*{\UNIVERSITY}[1]{\def\UNIVNAME{#1}}
\newcommand*{\department}[1]{\def\deptname{#1}}
\newcommand*{\DEPARTMENT}[1]{\def\DEPTNAME{#1}}
\newcommand*{\group}[1]{\def\groupname{#1}}
\newcommand*{\GROUP}[1]{\def\GROUPNAME{#1}}
\newcommand*{\faculty}[1]{\def\facname{#1}}
\newcommand*{\FACULTY}[1]{\def\FACNAME{#1}}
\newcommand*{\subject}[1]{\def\subjectname{#1}}
\newcommand*{\keywords}[1]{\def\keywordnames{#1}}

%----------------------------------------------------------------------------------------
%	DOCUMENT VARIABLES
%	Fill in the lines below to update the thesis template
%	If you wish to cite each of the variables defined below, look at the
%	section above for the citation command e.g. \examiner{} below is
%	defined as \examname above so you cite it as \examname
%----------------------------------------------------------------------------------------

\thesistitle{From AI Capabilities to Sustainable Competitive Advantages: A Dynamic Capabilities Perspective in E-Commerce and Platform-Based Digital Business} % Your thesis title - used on the title page and in the PDF metadata
%-------------------------------------------------
\supervisor{} % Your supervisor's name - not printed on the title page
%-------------------------------------------------
\examiner{} % Your examiner's name - this is not currently used anywhere in the template, cite it with \examname if you want it
%-------------------------------------------------
\degree{Master of Arts in International Business and Leadership} % Your degree name - used on the title page
%-------------------------------------------------
\authors{} % Your name - used in the PDF metadata only
%-------------------------------------------------
\addresses{} % Your contact e-mail - not printed on the title page
%-------------------------------------------------
\newcommand*{\matriculation}[1]{\def\matrnumber{#1}}
\matriculation{} % Your matriculation number - not printed on the title page
%-------------------------------------------------
\subject{International Business and Leadership} % Your subject area - used in the PDF metadata
%-------------------------------------------------
\keywords{AI capabilities, dynamic capabilities, sustainable competitive advantage, e-commerce, digital platforms} % Keywords - used in the abstract and PDF metadata
%-------------------------------------------------   
% \university{\texorpdfstring{\href{https://www.hochschule-heidelberg.de} % Your university's URL
%                 {SRH Hochschule Heidelberg}} % Your university's name - this is currently used in the title page
%                 {SRH Hochschule Heidelberg}}
\university{SRH Hochschule Heidelberg}
%-------------------------------------------------   
\UNIVERSITY{\texorpdfstring{\href{https://www.hochschule-heidelberg.de} % Your university's URL
                {SRH HOCHSCHULE HEIDELBERG}} % Your university's name in capitals - this is currently used in the abstract page
                {SRH HOCHSCHULE HEIDELBERG}}
%-------------------------------------------------                
% \department{\texorpdfstring{\href{https://www.hochschule-heidelberg.de/de/hochschule/fakultaeten/fakultaet-fuer-information-medien-und-design/} % Your department's URL
%                 {School of Information, Media and Design}} % Your department's name - used in the title page and abstract
%                 {School of Information, Media and Design}}

\department{Faculty of Business} % Your faculty/department - used on the title page (guideline 4.1.2)
%-------------------------------------------------
\DEPARTMENT{FACULTY OF BUSINESS} % Your department's name in capitals - this is not currently used anywhere in the template, cite it with \DEPTNAME if you want it
%-------------------------------------------------                
\group{\texorpdfstring{\href{Research Group Web Site URL Here (include http://)} % Your research group's URL
                {Research Group Name}} % Your research group's name - this is currently used in the title page 
                {Research Group Name}}
%-------------------------------------------------                
\GROUP{\texorpdfstring{\href{Research Group Web Site URL Here (include http://)} % Your research group's URL
                {RESEARCH GROUP NAME (IN BLOCK CAPITALS)}} % Your research group's name in capitals - this is not currently used anywhere in the template, cite it with \GROUPNAME if you want it
                {RESEARCH GROUP NAME (IN BLOCK CAPITALS)}}
%-------------------------------------------------                
\faculty{International Business and Leadership} % Your study programme - this is not currently used anywhere in the template
%-------------------------------------------------                
\FACULTY{INTERNATIONAL BUSINESS AND LEADERSHIP} % this is not currently used anywhere in the template
%-------------------------------------------------

\renewcommand\maketitle{
  \btypeout{Title Page}
  \hypersetup{pdftitle={\@title}}
  \hypersetup{pdfsubject=\subjectname}
  \hypersetup{pdfauthor=\authornames}
  \hypersetup{pdfkeywords=\keywordnames}
  \thispagestyle{empty}
  \begin{titlepage}
    \let\footnotesize\small
    \let\footnoterule\relax
    \let \footnote \thanks
    \setcounter{footnote}{0}
    \null\vfil
    \vskip 60\p@
    \begin{center}
      \setlength{\parskip}{0pt}
      {\large\textbf{\UNIVNAME}\par}
      \vfill
      {\huge \bf \@title \par}
      \vfill
      {\LARGE by \par}
      \smallskip
      {\LARGE \authornames \par}
      \vfill
      {\large A thesis submitted in partial fulfillment for the \par}
      {\large degree of \degreename \par}
      \bigskip
      \bigskip
      {\large in the \par}
      {\large \facname \par}
      {\large \deptname \par} 
      \bigskip
      \bigskip
      \bigskip
      {\Large \@date \par}
      \bigskip
    \end{center}
    \par
    \@thanks
    \vfil\null
  \end{titlepage}
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \cleardoublepage
}
%----------------------------------------------------------------------------------------
%	ABSTRACT PAGE DESIGN
%----------------------------------------------------------------------------------------
\newenvironment{abstract}
{
  \btypeout{Abstract Page}
  \thispagestyle{plain} % Roman page number from here on (guideline 4.1.4)
  \null\vfil
  \begin{center}
    \setlength{\parskip}{0pt}
    %{\normalsize \UNIVNAME \par} % University name in capitals
    \bigskip
    {\fontsize{14}{17}\selectfont\bfseries Abstract\par}
    \bigskip
  \end{center}
}
%----------------------------------------------------------------------------------------
{
  \vfil\vfil\vfil\null
  \cleardoublepage
}
\addtocounter{secnumdepth}{1}
\setcounter{tocdepth}{3} % guideline 4.1.3: max. 3-4 heading levels
\newcounter{dummy}
\newcommand\addtotoc[1]{
\refstepcounter{dummy}
\addcontentsline{toc}{chapter}{#1}}
\renewcommand\tableofcontents{
\btypeout{Table of Contents}
%\addtotoc{Contents}
\begin{spacing}{1.055}{
    \setlength{\parskip}{0.5pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}
    \@starttoc{toc}
    \if@restonecol\twocolumn\fi
   \cleardoublepage
}\end{spacing}
}
\renewcommand\listoffigures{
\btypeout{List of Figures}
\addtotoc{List of Figures}
\begin{spacing}{1}{
    \setlength{\parskip}{1pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}
              {\MakeUppercase\listfigurename}}
    \@starttoc{lof}
    \if@restonecol\twocolumn\fi
    \cleardoublepage
}\end{spacing}
}
\renewcommand\listoftables{
\btypeout{List of Tables}
\addtotoc{List of Tables}
\begin{spacing}{1}{
    \setlength{\parskip}{1pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename
      \@mkboth{
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}
    \@starttoc{lot}
    \if@restonecol\twocolumn\fi
    \cleardoublepage
}\end{spacing}
}
\newcommand\listsymbolname{Abbreviations}
\usepackage{longtable}
\newcommand\listofsymbols[2]{
\btypeout{\listsymbolname}
\addtotoc{\listsymbolname}
    \chapter*{\listsymbolname
      \@mkboth{
          \MakeUppercase\listsymbolname}{\MakeUppercase\listsymbolname}}
\begin{longtable}[c]{#1}#2\end{longtable}\par
    \cleardoublepage
}
\newcommand\listconstants{Physical Constants}
\usepackage{longtable}
\newcommand\listofconstants[2]{
\btypeout{\listconstants}
\addtotoc{\listconstants}
    \chapter*{\listconstants
      \@mkboth{
          \MakeUppercase\listconstants}{\MakeUppercase\listconstants}}
\begin{longtable}[c]{#1}#2\end{longtable}\par
    \cleardoublepage
}
\newcommand\listnomenclature{Symbols}
\usepackage{longtable}
\newcommand\listofnomenclature[2]{
\btypeout{\listnomenclature}
\addtotoc{\listnomenclature}
    \chapter*{\listnomenclature
      \@mkboth{
          \MakeUppercase\listnomenclature}{\MakeUppercase\listnomenclature}}
\begin{longtable}[c]{#1}#2\end{longtable}\par
    \cleardoublepage
}
\newcommand\acknowledgements[1]{
\btypeout{Acknowledgements}
\thispagestyle{plain}
\begin{center}{\fontsize{14}{17}\selectfont\bfseries Acknowledgements\par}\end{center}
{\normalsize #1}
\vfil\vfil\null

}
\newcommand\dedicatory[1]{
\btypeout{Dedicatory}
\thispagestyle{plain}
\null\vfil
\vskip 60\p@
\begin{center}{\Large \sl #1}\end{center}
\vfil\null
\cleardoublepage
}
% Front matter ends: remember the last Roman page number so that the
% bibliography and appendices continue in Roman numerals (guideline 4.1.4)
\newcounter{romanpage}
\let\thesis@mainmatter\mainmatter
\renewcommand\mainmatter{%
  \clearpage
  \setcounter{romanpage}{\value{page}}%
  \thesis@mainmatter}
\renewcommand\backmatter{%
  \clearpage
  \pagenumbering{roman}%
  \setcounter{page}{\value{romanpage}}%
  \btypeout{\bibname}}
\endinput

