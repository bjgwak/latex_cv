% Created by Murat Can Karacabey
% this is inspired by Michael Pollind's Awesome CV
% Created from scratch as a much simpler alternative to it to actually learn LaTeX.
% Might be interpreted as an easier-to-edit or easier-to-understand-what-is-going-on version of it.
% MODIFIED FOR LAYOUT IMPROVEMENTS (3rd iteration)
\author{Murat Can Karacabey}
\RequirePackage[dvipsnames]{xcolor}
\LoadClass[11pt]{article} % Base font size is 11pt
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{muratcan_cv}[2020/04/15 Muratcan CV Class (Layout Modified v3)]

\usepackage{fontspec}
\usepackage{xeCJK}
\xeCJKsetup{%
CJKspace=true,%
CJKecglue={}%
}

\setCJKmainfont{Noto Sans CJK KR}%
[Ligatures=TeX,BoldFont={*-Bold},AutoFakeSlant] % Ensure your Noto Sans CJK KR supports bold small caps or fakes it well
\setCJKmonofont{Noto Sans Mono CJK KR}

\setmainfont{Noto Sans CJK KR}

\RequirePackage{etoolbox}
\RequirePackage{pgffor}
\RequirePackage{titlesec}
\RequirePackage{tikz}
\RequirePackage[left=0.75in,top=0.3in,right=0.75in,bottom=0.6in]{geometry}
\RequirePackage{hyperref}
\RequirePackage{fontawesome}
\RequirePackage{mfirstuc}
\RequirePackage{ifthen}
\RequirePackage{lipsum}
\RequirePackage{array}

\pagestyle{empty}

%Setup
\newcommand*{\setname}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\setaddress}[1]{\def\@address{#1}}
\newcommand*{\setmobile}[1]{\def\@mobile{#1}}
\newcommand*{\setposition}[1]{\def\@position{#1}}
\newcommand*{\setmail}[1]{\def\@mail{#1}}
\newcommand*{\setthemecolor}[1]{\def\@themecolor{#1}}
\newcommand*{\setlinkedinaccount}[1]{\def\@linkedinaccount{#1}}
\newcommand*{\setgithubaccount}[1]{\def\@githubaccount{#1}}

\newcommand*{\setcompanyname}[1]{\def\@companyname{#1}}
\newcommand*{\setcontactperson}[1]{\def\@contactperson{#1}}
\newcommand*{\setclaimedposition}[1]{\def\@claimedposition{#1}}

\hypersetup{
    colorlinks=true,
    urlcolor=cyan,
}

% Header
\newcommand\headerview{
\begin{minipage}{0.45\linewidth}
    \center \name \\[0.05cm]
    \contact
\end{minipage}
\hfill
\begin{minipage}{0.25\linewidth}
    \IfFileExists{images/me.png}{%
        \includegraphics[width=0.66\linewidth]{images/me.png}%
    }{%
        \IfFileExists{images/me.jpg}{%
            \includegraphics[width=0.66\linewidth]{images/me.jpg}%
        }{%
            \textcolor{red}{Image not found: images/me}%
        }%
    }%
\end{minipage}%
}

\newsavebox{\picbox}
\newcommand{\profpic}[2]{%
    \savebox{\picbox}{%
    \includegraphics[scale=#1]{#2}}%
    \tikz\node [draw, circle,%
    line width=4pt, color=white,%
    minimum width=\wd\picbox,minimum height=\ht\picbox,%
    path picture={ \node at (path picture bounding box.center)%
    {\usebox{\picbox}};}]%
    {};}

\newcommand{\githubview}{\href{\@linkedinaccount}{\faLinkedinSquare\ \footnotesize linkedin}}
\newcommand{\linkedinview}{\href{\@githubaccount}{\faGithubSquare\ \footnotesize github}}

\newcommand{\name}{%
    {\large \@firstname \ \textsc{\@lastname}}
}

\newcommand{\contact}{% % User redefines this in cv.tex
        {\small \@address  \cps \@mobile \\ \@mail%
        \\%
        \linkedinview \cps \githubview \\
        } %
}

\newcommand\coverletter[1]{
\\  \coverlettersubview
\section{} \vspace{1ex}
\textbf{ Dear \@contactperson, \\[0.1cm]}
  #1
}

\newcommand\coverlettersubview{
\begin{tabular}{>{\scshape \bfseries \color{\@themecolor}}l  >{\small }l}
Company: & \@companyname \\
Position: & \@claimedposition \\
\end{tabular}
}

% Helper commands
\newcommand\ruleafter[1]{#1~{\color{black!60!\@themecolor}\hrulefill}}
\newcommand{\cps}{{\color{\@themecolor} \quad\textbar\quad}}
\newcommand{\cpshalf}{{\color{\@themecolor} \hspace{0.2em}\textbar\hspace{0.2em}}}
\newcommand{\coloredbullet}{{\color{\@themecolor} \textbullet}}

% Edit section styles
\titleformat{\section}
  {\Large\bfseries\scshape\raggedright\color{\@themecolor}} % Section title font: Large, Bold, SmallCaps, Color
  {}{0em}
  {\ruleafter}
\titlespacing*{\section}{0pt}{2.0ex plus 0.2ex minus .2ex}{1.0ex plus 0.2ex minus .2ex}

% Textview commands
\newcommand{\experience}[2]{%
  \mbox { \hspace{1em} \scshape #1 }%
}

\newcommand{\datetext}[1]{%
{\itshape  \footnotesize \mdseries  \color{black!60!\@themecolor} #1 }
}

\newlength{\explanationbreakskip}
\setlength{\explanationbreakskip}{4pt}

\newcommand{\datedexperience}[2]{%
    \noindent%
    {\normalsize%
    % MODIFIED: Added \bfseries to make the dated experience title bold
    \mbox{\hspace{1em}\bfseries\scshape#1}%
    }%
    \hfill \datetext{#2}\\[\explanationbreakskip]%
}

\newcommand{\explanation}[1]{%
    \mbox { \scshape \hspace{1.7em} \footnotesize #1}\\[0pt]%
}

\newcommand{\explanationdetail}[1]{%
    \hspace*{2.5em}%
    \begin{minipage}[t]{\dimexpr\linewidth-2.5em\relax}%
        \setlength{\parskip}{3pt}%
        \footnotesize #1%
    % MODIFIED: Increased vertical space after explanationdetail block to 2.5ex from 1.5ex
    \end{minipage}\\[2.5ex]%
}

\newcommand{\itemwithtext}[1]{%
    \begin{minipage}{\linewidth} \footnotesize \item #1 \end{minipage}
}

\newcommand{\addblocktext}[2]{% Summary block
  \section{#1}
  \vspace{0.5ex}
  \noindent
  \begin{minipage}{\linewidth}
      \setlength{\parskip}{0.5\baselineskip}%
      \small #2 % Summary text font: small
  \end{minipage}
  \vspace{2ex}
}

\newcommand\createskill[2]{%
    \textsc{\textbf{#1}} & #2
}

\newcommand\createtablecontent[1]{%
    \foreach \x [count=\xi] in {#1} {\ifthenelse{\xi=1}{\x}{\\ \x}}
}

\newcommand\createskillsanothertry[1]{%not used
  \begin{tabular}{r|l}
      \createtablecontent{#1}
    \end{tabular}
}

\newcommand\createskills[1]{% Skills table
  \vspace{0.5ex}
  \noindent
  \begin{tabular}{@{}r@{ \hspace{1.5em}}l@{}}
    \makeatletter
    \@for\thisitem:=#1\do{\thisitem\\[0.5ex]}
    \makeatother
  \end{tabular}
  \vspace{2ex}
}

\newcommand\createbullets[1]{%
    \renewcommand{\labelitemi}{\coloredbullet}
  \begin{itemize}
    \makeatletter
    \@for\thisitem:=#1\do{\itemwithtext{\thisitem}}
    \makeatother
  \end{itemize}
}

\newcommand\createfootnote{%
  \renewcommand{\footnotesize}{\fontsize{7pt}{11pt}\selectfont}
    \renewcommand\footnoterule{\rule{0.3\linewidth}{0.5pt}}
    \let\thefootnote\relax\footnote{\today\ / \href{https://github.com/muratcankaracabey/latex_cv}{source code}}}
