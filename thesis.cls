% Inspired by https://github.com/Robinbux/CODE-Bachelor-Thesis-Template
\ProvidesClass{thesis}[]

% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

%-------------------------------------------------------------------------------
%  META information
%-------------------------------------------------------------------------------


\newcommand*{\exposeTitle}[1]{\def\@exposeTitle{#1}}
\newcommand*{\exposeType}[1]{\def\@exposeType{#1}}
\newcommand*{\name}[1]{\def\@name{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\studyProgram}[1]{\def\@studyProgram{#1}}
\newcommand*{\semester}[1]{\def\@semester{#1}}
\newcommand*{\enrollmentNumber}[1]{\def\@enrollmentNumber{#1}}
\newcommand*{\supervisorOne}[1]{\def\@supervisorOne{#1}}
\newcommand*{\supervisorTwo}[1]{\def\@supervisorTwo{#1}}

%-------------------------------------------------------------------------------
%  Packages
%-------------------------------------------------------------------------------

\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{enumitem}
\RequirePackage{xifthen}
\RequirePackage{advdate}
\RequirePackage[ddmmyyyy]{datetime}
\RequirePackage[
    style=ieee
]
{biblatex}
\RequirePackage[english]{babel}
\RequirePackage{csquotes}
\RequirePackage{setspace}
\RequirePackage{hyperref}
\RequirePackage{cleveref}
\RequirePackage{caption}
\RequirePackage{subfig}
\RequirePackage[official]{eurosym}
\RequirePackage{tabularx}
\RequirePackage{xspace}
\RequirePackage[nottoc,numbib]{tocbibind}

\hypersetup{
    colorlinks=true,
    linkcolor=black,
    filecolor=black,
    urlcolor=black,
    citecolor=black,
    linktoc=all,
    breaklinks=true,
}

%-------------------------------------------------------------------------------
%  Styles as required
%-------------------------------------------------------------------------------

\geometry{left=3.0cm, top=3.5cm, right=3.5cm, bottom=2.0cm, footskip=.5cm}

% Line spacing
\setstretch{1.5}

% More space between footnote and text, as I think it is too short otherwise
\addtolength{\skip\footins}{2pc plus 5pt}

% Footnote size
\renewcommand{\footnotesize}{\fontsize{10pt}{12pt}\selectfont}

% Order references alphabetically


\addbibresource{references.bib}


%-------------------------------------------------------------------------------
%  Custom Commands
%-------------------------------------------------------------------------------

% Print BT title
\newcommand{\printExposeTitle}{
    \emph{\textbf{"\@exposeTitle"}}
}

%\newcommand*{\figuretitle}[1]{
%    {\centering
%    \textbf{#1}
%    \par\medskip}
%}


% Datetime seperator
\renewcommand{\dateseparator}{.}

\renewcommand*{\maketitle}[0]{%
  \newpage
  \makebox[\textwidth]{\includegraphics[width=300pt]{resources/code-logo.png}}
  \vskip 6em%
  \begin{center}
  %{\fontsize{30}{0}\selectfont\textbf{\@exposeTitle}}\\
  \parbox[c][3cm][c]{\textwidth}{\centering\fontsize{30}{18}\selectfont\textbf{\@exposeTitle}}
  \vskip 8em%
  {\fontsize{30}{0}\selectfont\@exposeType}\\
  \end{center}%
  \vspace*{\fill}
  \begin{description}[labelwidth=10em,leftmargin =\labelwidth, font=\sffamily]
    \item[Name:] \@name
    \item[Email:] \@email
    \vskip 1em
    \hrule
    \item[Study Program:] \@studyProgram 
    \item[Semester:] \@semester 
    \item[Enrollment Number:] \@enrollmentNumber
    \vskip 1em
    \hrule
    \item[Supervisor One:] \@supervisorOne 
    
    \ifthenelse{\isundefined{\@supervisorTwo}}%
        {}%
        {%
         \item[Supervisor Two:] \@supervisorTwo 
       }
        \vskip 2em
    \item[Date:]\today
  \end{description}
}


\newenvironment{schedule}
  {\par\longdate\renewcommand{\item}{\par%
    \stepcounter{mycntr}\ifnum\value{mycntr}>3\relax%
      \setcounter{mycntr}{0}\AdvanceDate[3]%
    \else
      \AdvanceDate[2]%
    \fi\today\quad}
  }{\par}
\newcounter{mycntr}

% Make paragraph behave as subsubsubsection
\makeatletter
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
            {-2.5ex\@plus -1ex \@minus -.25ex}%
            {1.25ex \@plus .25ex}%
            {\normalfont\normalsize\bfseries}}
\makeatother
\setcounter{secnumdepth}{4} % how many sectioning levels to assign numbers to
\setcounter{tocdepth}{4}    % how many sectioning levels to show in ToC

\newcommand{\FixedSensorRobot}{\hyperref[sec:fixrob]{Fixed-sensor robot}\xspace}
\newcommand{\fixedSensorRobot}{\hyperref[sec:fixrob]{fixed-sensor robot}\xspace}
\newcommand{\FixRob}{\hyperref[sec:fixrob]{FixRob}\xspace}

\newcommand{\TurningSensorRobot}{\hyperref[sec:turnrob]{Turning-sensor robot}\xspace}
\newcommand{\turningSensorRobot}{\hyperref[sec:turnrob]{turning-sensor robot}\xspace}
\newcommand{\TurnRob}{\hyperref[sec:turnrob]{TurnRob}\xspace}

