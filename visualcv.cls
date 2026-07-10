%% visualcv.cls -- an original single-column CV class for CV-Kit.
%% Written from scratch for this project (not derived from any third-party CV
%% class). Clean, monochrome, single-column layout. Use and modify freely.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{visualcv}[2026/07/09 v1.0 Visual CV single-column class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage[margin=1.6cm]{geometry}
\RequirePackage[T1]{fontenc}
\RequirePackage[scaled]{helvet}
\renewcommand{\familydefault}{\sfdefault}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{enumitem}
\RequirePackage{ragged2e}
\RequirePackage[hidelinks]{hyperref}

% -- palette (override with \definecolor after \documentclass if desired) --
\definecolor{vcvink}{HTML}{000000}
\definecolor{vcvemph}{HTML}{2E2E2E}
\definecolor{vcvbody}{HTML}{666666}

\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{2pt}
\RaggedRight
\color{vcvbody}

\setlist[itemize]{leftmargin=1.2em,itemsep=2pt,topsep=2pt,parsep=0pt,label=\textbullet}

% -- identity --
\newcommand{\theName}{}
\newcommand{\theTagline}{}
\newcommand{\theInfo}{}
\newcommand{\name}[1]{\renewcommand{\theName}{#1}}
\newcommand{\tagline}[1]{\renewcommand{\theTagline}{#1}}
\newcommand{\personalinfo}[1]{\renewcommand{\theInfo}{#1}}

\newcommand{\vcvsep}{\hspace{0.35em}\textbullet\hspace{0.35em}}
\newcounter{vcvinfo}
\newcommand{\vcvitem}[1]{\ifnum\value{vcvinfo}>0\vcvsep\fi#1\stepcounter{vcvinfo}}
\newcommand{\email}[1]{\vcvitem{#1}}
\newcommand{\phone}[1]{\vcvitem{#1}}
\newcommand{\location}[1]{\vcvitem{#1}}
\newcommand{\linkedin}[1]{\vcvitem{#1}}
\newcommand{\github}[1]{\vcvitem{#1}}

% -- round photo (right of the header) --
\newif\ifvcvphoto
\newcommand{\thePhotoSize}{4cm}
\newcommand{\thePhotoFile}{}
\newcommand{\photoR}[2]{\vcvphototrue\renewcommand{\thePhotoSize}{#1}\renewcommand{\thePhotoFile}{#2}}
\newcommand{\vcvphotobox}{\ifvcvphoto
  \tikz\path[fill overzoom image={\thePhotoFile}] circle[radius=\dimexpr\thePhotoSize/2\relax];\fi}

% -- header --
\newcommand{\makecvheader}{%
  \noindent
  \begin{minipage}[c]{\ifvcvphoto\dimexpr\linewidth-\thePhotoSize-0.6cm\relax\else\linewidth\fi}
    {\color{vcvink}\fontsize{24}{27}\selectfont\bfseries\theName\par}%
    \vspace{2pt}{\color{vcvemph}\itshape\theTagline\par}%
    \vspace{4pt}{\small\setcounter{vcvinfo}{0}\theInfo\par}%
  \end{minipage}%
  \ifvcvphoto\hfill\begin{minipage}[c]{\thePhotoSize}\raggedleft\vcvphotobox\end{minipage}\fi
  \par\vspace{8pt}}

% -- section heading: uppercase + rule --
\newcommand{\cvsection}[1]{%
  \vspace{10pt}{\color{vcvink}\large\bfseries\MakeUppercase{#1}\par}%
  \vspace{1pt}{\color{vcvink}\hrule height 1.2pt}\vspace{5pt}}

% -- event: {title}{company}{dates}{location} --
\newcommand{\cvevent}[4]{%
  \vspace{4pt}{\color{vcvemph}\bfseries #1\par}%
  {\small #2\vcvsep #4\vcvsep #3\par}\vspace{2pt}}

% -- thin separator between events --
\newcommand{\divider}{\vspace{2pt}{\color{vcvbody!40}\hrule height 0.4pt}\vspace{4pt}}

\endinput
