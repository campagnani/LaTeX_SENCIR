% !TeX program = xelatex
% !TeX encoding = UTF-8 Unicode
% !BIB program = biblatex

%#######################################################################
%#######################################################################
%####                                                               ####
%####               Template class for the SENCIR 2024              ####
%####                                                               ####
%####              UNIVERSIDADE FEDERAL DE MINAS GERAIS             ####
%####               Departamento de Engenharia Nuclear              ####
%####                                                               ####
%####                       Template Authors:                       ####
%####                   Thalles Oliveira Campagnani                 ####
%####                Jefferson Quintão Campos Duarte                ####
%####                     Álan Crístoffer e Sousa                   ####
%####                                                               ####
%#######################################################################
%#######################################################################

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sencir}[2024/05/25 SENCIR conference article template]

% This command has to be defined for every class
\newcommand{\headlinecolor}{\normalcolor}

\PassOptionsToPackage{english,spanish,brazil}{babel}
\PassOptionsToPackage{shortlabels}{enumitem}
\PassOptionsToPackage{hidelinks}{hyperref}

\LoadClass[11pt, hidelinks, oneside]{amsart}

% Declares options accepted by this class. No \RequirePackage allowed from now
% on. Since we cannot \RequirePackage inside \DeclareOption, we have to create a
% variable to hold whether the package should be loaded.
\newif\if@langen
\newif\if@langes

\DeclareOption{english}{\@langentrue}
\DeclareOption{espanish}{\@langestrue}

% Processes all options and puts us back into normal mode. \RequirePackage
% allowed again.
\ProcessOptions\relax

\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures=TeX}
% \renewcommand{\baselinestretch}{1.5} % Line height
\setmainfont[Path=fonts/,BoldFont={*-Bold},ItalicFont={*-Italic},BoldItalicFont={*-BoldItalic}]{TimesNewRoman}
\setmonofont[Path=fonts/,BoldFont={*-Bold},ItalicFont={*-Italic},BoldItalicFont={*-BoldItalic}]{JetBrainsMonoNLNerdFont}
\setmathrm{Latin Modern Math}

\if@langes
  \RequirePackage[output-complex-root=j,
    complex-root-position=after-number]{siunitx} % SI units
\else
  \if@langen
    \RequirePackage[output-decimal-marker=.,
      output-complex-root=j,
      complex-root-position=after-number]{siunitx} % SI units
  \else
    \RequirePackage[output-complex-root=j,
      complex-root-position=after-number]{siunitx} % SI units
  \fi
\fi

\RequirePackage[footskip=1.0cm, headsep=0.5cm, top=2.0cm, bottom=4.5cm, includefoot]{geometry}
\RequirePackage{hyperref}  % For hyperlinks
\RequirePackage{babel}     % For languages
\RequirePackage{csquotes}  % For languages (requeried by babel)
\RequirePackage{setspace}  % For single spacing
\RequirePackage{graphicx}  % Required for inserting images
\RequirePackage{fancyhdr}  % Required for custom headers
\RequirePackage{xcolor}    % Required for custom colors
\RequirePackage{fontspec}  % Define fonts
\RequirePackage{ragged2e}  % Justify or align paragraphs
\RequirePackage{titlesec}  % Customize the appearance of section titles, subsections, subsubsections
\RequirePackage{floatrow}  % Offers advanced functionalities for manipulating and customizing floating environments
\RequirePackage{booktabs}  % Provides commands to create high-quality tables in LaTeX
\RequirePackage{multirow}  % Allows you to create table cells that span multiple rows
\RequirePackage{caption}   % Provides advanced functionality to customize and format subtitles in floating environments
\RequirePackage{subfigure} % Oferece a capacidade de criar subfiguras dentro de uma única figura
\RequirePackage{adjustbox} % Provides commands to adjust and resize content boxes
\RequirePackage{siunitx}   % Used for typesetting of physical units and quantities
\RequirePackage{amsmath}   % Extends the mathematical functionalities of LaTeX
\RequirePackage{pgffor}
\RequirePackage[nameinlink]{cleveref}
\RequirePackage[style=ieee, natbib]{biblatex}

\numberwithin{equation}{section}
\linespread{1.0}

% Ensure reference font is consistent with rest of paper
\renewcommand*{\bibfont}{\small}

\pagestyle{fancy} % Header for all pages except the first

\def\abstract{
  \begingroup
  \par\fontsize{10}{10}\selectfont\bfseries\centering ABSTRACT
  \par\vspace{0.5\baselineskip}
  \normalfont\justify
}

\def\endabstract{\par\endgroup}

\graphicspath{{imgs/}} % Graphics should all go in the figs/ directory
% Adjust header height to avoid text overlapping
\setlength{\headheight}{80pt}
% Adjust footer height
\setlength{\footskip}{13pt}

\renewcommand{\headrulewidth}{0pt} % Remove the header row
\renewcommand{\footrulewidth}{0pt} % No separation line on the footer

% Table float box with bottom caption, box width adjusted to content
\newfloatcommand{captionedtablebox}{table}[][\FBwidth]

\titlespacing{\subsection}{0pt}{*1}{*1}
\titlespacing{\subsubsection}{0pt}{*1}{*1}

% Header settings for the first page
\fancypagestyle{pagefirst}
{
    \fancyhf{} % Clean header and footer
    \fancyhead[L]
    {%
        \vspace{-1.5cm} % Vertical adjust
        \hspace{-1.0cm} % Vertical adjust
        \begin{minipage}[c]{0.14\textwidth}
            \includegraphics[width=\linewidth]{logo_SENCIR.png}
        \end{minipage}%
    }
    \fancyhead[R]
    {
        \hspace{2.2cm} % Horizontal adjust
        \hspace{+1.0cm} % Vertical adjust
        \begin{minipage}[t]{0.9\textwidth}
        {
            \color{black!50!white} % Define a cor azul claro
            \fontsize{10}{10}\selectfont \textbf{\itshape{Semana Nacional de Engenharia Nuclear e da Energia e Ciências das Radiações - VII SENCIR}}  \\
            \fontsize{9}{9}\selectfont \textbf{\itshape{Belo Horizonte, 12 a 14 de
            novembro de 2024}}
        }
        \end{minipage}
    }
}

% Header settings for all pages except the first
\fancyhf{}
\fancyhead[L]
{%
    \vspace{-1.5cm} % Vertical adjust
    \hspace{-1.0cm} % Vertical adjust
    \begin{minipage}[c]{0.14\textwidth}
        \includegraphics[width=\linewidth]{logo_SENCIR.png}
    \end{minipage}%
}
\fancyhead[R]
{
    \hspace{2.2cm} % Horizontal adjust
    \hspace{+1.0cm} % Vertical adjust
    \begin{minipage}[t]{0.9\textwidth}
    {
        \color{black!50!white} % Define a cor azul claro
        \fontsize{10}{10}\selectfont \textbf{\itshape{Semana Nacional de Engenharia Nuclear e da Energia e Ciências das Radiações - VII SENCIR}}  \\
        \fontsize{9}{9}\selectfont \textbf{\itshape{Belo Horizonte, 12 a 14 de
        novembro de 2024}}
    }
    \end{minipage}
}
\fancyfoot[R]{
  \begin{minipage}[b]{0.98\textwidth}
    \vspace{-1.5cm} \hspace{15.0cm} \thepage
  \end{minipage}%
} % Number page in the upper rightcorner

\newcommand\preamble{%
  \justifying
  \sloppy
  \graphicspath{{imgs/}}
  \captionsetup{justification=centering}
  \hypersetup{
    unicode=true,
    pdftitle={\@title},
    pdfsubject={\@title},
    pdfauthor={\getauthor{1}},
    pdfstartview={FitH}
  }%
}

\newcounter{authors}
\newcommand\addauthor[2]{%
  \stepcounter{authors}%
  \csdef{author\theauthors}{#1}%
  \csdef{authorinst\theauthors}{#2}%
}
\newcommand\getauthor[1]{\csuse{author#1}}
\newcommand\getauthorinst[1]{\csuse{authorinst#1}}
\newcommand\getauthors{\foreach \i in {1,...,\theauthors}{\getauthor{\i}\textsuperscript{\getauthorinst{\i}}\ifnum\i=\theauthors\@\else,\ \fi}}

\newcounter{keywords}
\newcommand\addkeyword[1]{%
  \stepcounter{keywords}%
  \csdef{keyword\thekeywords}{#1}%
}
\newcommand\getkeyword[1]{\csuse{keyword#1}}
\newcommand\getkeywords{\foreach \i in {1,...,\thekeywords}{\getkeyword{\i}\ifnum\i=\thekeywords\@\else,\ \fi}}

\newcounter{institutions}
\newcommand\addinstitution[2]{%
  \stepcounter{institutions}%
  \csdef{institutioni\theinstitutions}{#1}%
  \csdef{institution\theinstitutions}{#2}%
}
\newcommand\getinstitution[1]{\csuse{institution#1}}
\newcommand\getinstitutions{\foreach \i in {1,...,\theinstitutions}{\textsuperscript{\csuse{institutioni\i}} \getinstitution{\i}\\}}

\newcommand\setemail[1]{%
  \csdef{cemail}{#1}%
}
\newcommand\getemail{%
  \csuse{cemail}%
}

\newcommand\setid[1]{%
  \csdef{id}{#1}%
}
\newcommand\getid[1]{%
  \csuse{id}%
}

\let\oldmaketitle\maketitle

\renewcommand{\maketitle}{
  \let\MakeUppercase\uppercase
  \if@langes
    \selectlanguage{spanish}%
    \sisetup{locale=FR}%
  \else
    \if@langen
      \selectlanguage{english}%
      \sisetup{locale=US}%
    \else
      \selectlanguage{brazil}%
      \sisetup{locale=DE}%
    \fi
  \fi
  \setlength{\parindent}{0pt} % No space in each paragraph
  \titleformat{\subsubsection}{\normalfont}{\thesubsubsection.}{0.3em}{} % \subsection space
  \titleformat{\subsection}{\normalfont}{\thesubsection.}{0.3em}{} % \subsection space
  \titleformat{\section}[hang]{\normalfont}{\thesection.}{0.3em}{\MakeUppercase} % \section space
  \begin{flushright}
    Id.: \getid{}
  \end{flushright}
  \oldmaketitle{}
  \begin{center}
    \vspace*{-0.4cm}
    \textbf{\getauthors}\vspace*{0.3cm}
    \\[0.25ex]
    {
    \small
    \getinstitutions{}
    \getemail{}
    }
    \thispagestyle{empty} % Start page numbering on second page
    \vspace*{.1in}
  \end{center}
  \thispagestyle{pagefirst}%
  {\fontsize{10}{10}\selectfont \textbf{Keywords:} {\getkeywords{}}}%
  \vspace{0.5cm}%
}
