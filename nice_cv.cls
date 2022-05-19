\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nice_cv}[2020/09/07 My custom CV class]

\DeclareOption{10pt}{\def\aku@ptsize{0}}
\DeclareOption{11pt}{\def\aku@ptsize{1}}
\DeclareOption{12pt}{\def\aku@ptsize{2}}

\ExecuteOptions{12pt}
\ProcessOptions
\PassOptionsToClass{1\aku@ptsize pt}{article}
\LoadClass[twocolumn]{article}

\RequirePackage{titlesec}
\RequirePackage{calc}
\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{xcolor}
\RequirePackage{array,booktabs}
\RequirePackage{cuted}


% remove page mark
\pagestyle{empty}

%%%%%%%%%%%&&&&&&
%  page format  %
%%%%%%%%%%&&&&&&&

\setlength\parindent{0pt}
\setlength\tabcolsep{0pt}

\def\@columnmargin{2in}

\RequirePackage{geometry}
\geometry{
   total={6in,10in},
   left=2cm,
   top=0cm,
   bottom=2cm,
   right=2cm
}

%%%%%%%%%%%
%  fonts  %
%%%%%%%%%%&

\RequirePackage{xifthen}
\RequirePackage{roboto}
\RequirePackage[default]{sourcesanspro}

\RequirePackage{fontspec}
\RequirePackage[default]{raleway}

\newfontfamily\Raleway{Raleway}
\newfontfamily\Roboto{Roboto Light}
\newfontfamily\RobotoMed{Roboto}
\newfontfamily\RobotoThin{Roboto Thin}

\RequirePackage{xparse}

%\setmainfont{Roboto Thin}
\setmainfont{Source Sans Pro}

\definecolor{cvblue}{RGB}{31,73,125}

\newcommand{\cvdeffont}{
	%\roboto
	\raggedright\RobotoThin\fontsize{10pt}{10pt}\selectfont
}

\newcommand{\cvdescfont}{
	%\roboto
	\Raleway\fontsize{10pt}{9pt}\selectfont
}

\newcommand{\cvmedfont}{
	%\roboto
	\Raleway\fontsize{10pt}{10pt}\selectfont
}

\newcommand{\cvbigfont}{
	%\roboto
	\RobotoMed\fontsize{11pt}{11pt}\selectfont
}

\newcommand{\cvhugefont}{
	%\roboto
	\RobotoThin\fontsize{17pt}{17pt}\selectfont
}

\newcommand{\cvtitlefont}{
	%\roboto
	\Roboto\fontsize{22pt}{22pt}\selectfont
}
\newcommand{\cvtitlefontb}{
	%\roboto
	\RobotoThin\fontsize{22pt}{22pt}\selectfont
}

%%% helper


\newcommand{\separator}{%
	\vspace{7pt}
}


%%%%%%%%%%%
%  title  %
%%%%%%%%%%&
\titlespacing*{\section}
{0pt}{2ex}{0pt}


\titleformat{\section}         % Customise the \section command 
  {\cvhugefont\raggedright\uppercase} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  %[\titlerule]                 % Inserts a horizontal line after the heading


%%%%%%%%%%%
%  list entries  %
%%%%%%%%%%&

\DeclareDocumentCommand\listentry{>{\SplitList{;}}m}
{%
	\ProcessList{#1}{\insertitem}%
	\firstitemtrue
}

\newif\iffirstitem
\firstitemtrue
\newcommand\insertitem[1]{%
  \iffirstitem
    \firstitemfalse
  \else
    \textbullet\:%
  \fi
  {#1}
}

%%%%%%%%%%%%%
%  entries  %
%%%%%%%%%%&%%

\newcolumntype{P}[1]{>{\raggedright\arraybackslash}p{#1}}

\newif\iflastissub
\lastissubtrue
\newcommand\cvsec[2]{%
	\lastissubfalse%
	\vspace{3pt}%
	\cvbigfont \textbf{\uppercase{#1}}%	
	\ifthenelse{\isempty{#2}}%
	{}%if is empty
	{\cvmedfont | \uppercase{#2}}%if not
	\vspace{2pt}\\
	\cvdeffont
}
\newcommand\cvsubsec[1]{%
	\lastissubtrue%
	\cvmedfont\textsc{#1}\\
	\cvdeffont
}
\newcommand\cvsubsubsec[1]{%
	\lastissubfalse%
	\iflastissub
		\vspace{1pt}\\
	\fi
	\cvdescfont{#1}\\

	\cvdeffont
}

\newcommand{\job}[4]{%
	\cvsec{#1}{#2}
	\ifthenelse{\isempty{#3}}%3rd empty?
	{% 3 emptyy
		\ifthenelse{\isempty{#4}}%4th empty?
		{}% #4 empty
		{%
			\cvdescfont{#4}\\%
		}%
	}% 
	{% 3 not empty
		\cvmedfont\textsc{#3}%
		\ifthenelse{\isempty{#4}}%4th empty?
		{}% #4 empty
		{%
			\vspace{1pt}\\
			\cvdescfont{#4}\\%
		}%
	}
	
	\cvdeffont
}

\newcommand{\skill}[2]{%
	\begin{tabular}{p{\@columnmargin}p{\textwidth}}
		 	& \textbf{#1} #2 \\
	\end{tabular}
}


%%%%%%%%%%%%
%  header  %
%%%%%%%%%%%&

\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\surname}[1]{\def\@surname{#1}}

\newcommand{\contact}[5]{%
    \def\@contact{
        			%#1 	\newline
        			#2, %
        			#3	\hspace{0.5em}|\hspace{0.5em}%
         			#4	\hspace{0.5em}|\hspace{0.5em}%
        		 	#5
    }
}

\newcommand{\cvheader}{%
	\begin{strip}
	    \centerline{\cvtitlefontb{\@name} \cvtitlefont\@surname}
	    \vspace{5pt}
	    \cvdeffont%
	    \vspace*{-3pt}
	    \centerline{\@contact} %
	    \centerline{github.com/Sapp00\hspace{0.5em}|\hspace{0.5em}linkedin.com/in/maurice-heymann}
	    \vspace{5pt}
	    \noindent\makebox[\linewidth]{\rule{\paperwidth}{.4pt}}
	\end{strip}
}

\newcommand{\cvheaderA}{%
	\begin{strip}
		\vspace{0pt}
	    \centerline{\cvtitlefontb{\@name} \cvtitlefont\@surname}
	    \vspace{5pt}
	    \centerline{\cvdeffont \@contact}
	    \centerline{\cvdeffont github.com/Sapp00\hspace{0.5em}|\hspace{0.5em}linkedin.com/in/maurice-heymann}
	    
	    \vspace{0.5em}
	    \noindent\makebox[\linewidth]{\rule{\paperwidth}{.4pt}}
	\end{strip}
}
