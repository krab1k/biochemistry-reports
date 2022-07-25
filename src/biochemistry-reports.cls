\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{biochemistry-reports}[2012/07/22]


\LoadClass[a4paper, 11pt, oneside]{article}
\RequirePackage[czech]{babel}
\RequirePackage[left=1.5cm, right=1.5cm, top=1cm, bottom=1.5cm]{geometry}
\RequirePackage{booktabs}
\RequirePackage{fontspec}
\RequirePackage{lipsum}
\RequirePackage{xstring}
\RequirePackage{array}
\RequirePackage{graphicx}


\newcommand{\PreserveBackslash}[1]{\let\temp=\\#1\let\\=\temp}
\newcolumntype{C}[1]{>{\PreserveBackslash\centering}p{#1}}
\newcolumntype{R}[1]{>{\PreserveBackslash\raggedleft}p{#1}}
\newcolumntype{L}[1]{>{\PreserveBackslash\raggedright}p{#1}}

\IfFontExistsTF{TeX Gyre Pagella}{\setmainfont{TeX Gyre Pagella}}{}

\pagestyle{empty}

\newcommand{\Error}[1]{\ClassError{biochemistry-reports}{#1}{}}

\newcommand\IfStringInList[2]{\IfSubStr{,#2,}{,#1,}}

\newcommand{\thesistype}{bp}
\newcommand{\reporttype}{supervisor}

\newcommand{\thesisauthor}{Tomáš Marný}
\newcommand{\studyprogramme}{Biochemie}
\newcommand{\specialization}{Bioinformatika}
\newcommand{\thesistitle}{Moje úžasná práce}
\newcommand{\thesissupervisor}{Mgr. Prokop Buben, Ph.D.}
\newcommand{\thesisreader}{Mgr. Prokop Buben, Ph.D.}
\newcommand{\supervisorworkplace}{Bradavice}
\newcommand{\readerworkplace}{Bradavice}

\newcommand{\experimental}{ANO}

% Define grading categories
\newcommand{\expertiselevel}{X}
\newcommand{\textlevel}{X}
\newcommand{\graphiclevel}{X}
\newcommand{\independencelevel}{X}
\newcommand{\initiativelevel}{X}
\newcommand{\scopelevel}{X}
\newcommand{\literaturelevel}{X}
\newcommand{\autonomylevel}{X}
\newcommand{\journallevel}{X}
\newcommand{\reliabilitylevel}{X}
\newcommand{\datalevel}{X}
\newcommand{\researchlevel}{X}
\newcommand{\methodiclevel}{X}
\newcommand{\structurelevel}{X}
\newcommand{\presentationlevel}{X}
\newcommand{\discussionlevel}{X}
\newcommand{\languagelevel}{X}

\newcommand{\logo}{\includegraphics[width=4cm]{logo.pdf}}


\newcommand{\checkcorrectness}{%
\IfStringInList{\thesistype}{bp,dp}{}{\Error{The type of the thesis has to be either bp or dp}}

\IfStringInList{\reporttype}{supervisor,reader}{}{\Error{Type of the report has to be either supervisor or reader}}

\IfStrEq{\thesistype}{bp}
{\IfStringInList{\specialization}{Biochemie,Aplikovaná biochemie,Bioinformatika}
    {}
    {\Error{Study specialization has to one of: Biochemie, Aplikovaná biochemie, Bioinformatika}}
}
{\IfStringInList{\specialization}{Biochemie,Analytická biochemie,Biomolekulární chemie,Bioinformatika,Genomika a Proteomika,-}
    {}
    {\Error{Study specialization has to one of: Biochemie, Analytická biochemie, Biomolekulární chemie, Bioinformatika, Genomika a Proteomika, -}}
}
% end of \checkcorrectness
}

\newcommand{\gradeA}{1.0}
\newcommand{\gradeB}{1.5}
\newcommand{\gradeC}{2.0}
\newcommand{\gradeD}{3.0}
\newcommand{\gradeE}{4.0}
\newcommand{\gradeF}{5.0}

\def\gradetovalue#1{\csname grade#1\endcsname}

\newdimen \x

\newcommand{\bpgrsupervisor}{%
\x=\dimexpr (\gradetovalue\expertiselevel pt + \gradetovalue\textlevel pt + \gradetovalue\graphiclevel pt + \gradetovalue\independencelevel pt + \gradetovalue\initiativelevel pt) / 5 \relax
}

\newcommand{\bpgrreader}{%
\x=\dimexpr (\gradetovalue\expertiselevel pt + \gradetovalue\textlevel pt + \gradetovalue\graphiclevel pt + \gradetovalue\scopelevel pt + \gradetovalue\literaturelevel pt) / 5 \relax
}

\newcommand{\dpgrsupervisor}{%
\x=\dimexpr (\gradetovalue\expertiselevel pt + \gradetovalue\initiativelevel pt + \gradetovalue\autonomylevel pt + \gradetovalue\journallevel pt + \gradetovalue\reliabilitylevel pt + \gradetovalue\datalevel pt) / 6 \relax
}

\newcommand{\dpgrreader}{%
\x=\dimexpr (\gradetovalue\researchlevel pt + \gradetovalue\methodiclevel pt + \gradetovalue\structurelevel pt + \gradetovalue\presentationlevel pt + \gradetovalue\discussionlevel pt + \gradetovalue\languagelevel pt) / 6 \relax
}

\newcommand{\calculategrade}{%
\IfStrEq{\thesistype}{bp}
{\IfStrEq{\reporttype}{supervisor}{\bpgrsupervisor}{\bpgrreader}}
{\IfStrEq{\reporttype}{supervisor}{\dpgrsupervisor}{\dpgrreader}}
}

\newcommand{\finalgrade}{%
\calculategrade
\ifdim \x < 1.24pt A \else
\ifdim \x < 1.74pt B \else
\ifdim \x < 2.44pt C \else
\ifdim \x < 3.44pt D \else
\ifdim \x < 4.44pt E \else F
\fi\fi\fi\fi\fi
}

\newcommand{\heading}{%
\medskip
\begin{center}
\begin{huge}
\textsc{Posudek
\IfStrEq{\reporttype}{supervisor}
    {vedoucího}
    {oponenta}
\IfStrEq{\thesistype}{bp}
    {bakalářské}
    {diplomové}
práce}
\end{huge}
\end{center}
}

\newcommand{\basicinfo}{%
\medskip
\begin{center}
\begin{tabular}{rp{9cm}}
\textbf{Jméno autora práce:} & \thesisauthor\\
\textbf{Studijní program:} & \studyprogramme\\
\textbf{Specializace:} & \specialization\\[10pt]
\textbf{Název práce:} & \thesistitle\\[10pt]
\textbf{Jméno \IfStrEq{\reporttype}{supervisor}{vedoucího}{oponenta} práce:} & \IfStrEq{\reporttype}{supervisor}{\thesissupervisor}{\thesisreader}\\
\textbf{Pracoviště \IfStrEq{\reporttype}{supervisor}{vedoucího}{oponenta} práce:} & \IfStrEq{\reporttype}{supervisor}{\supervisorworkplace}{\readerworkplace}\\[10pt]
\IfStrEq{\thesistype}{bp}{\textbf{Má práce experimentální charakter:} & \experimental\\}{}
\end{tabular}
\end{center}
}

\newcommand{\bpsupervisor}{%
\begin{center}
\begin{tabular}{L{6cm}L{8cm}c}
\toprule
\textbf{Kritérium hodnocení} & \textbf{Poznámky} & \textbf{Hodnocení}\\
\midrule
\textbf{Odborná úroveň práce} & Zahrnuje použití adekvátních literárních zdrojů a jazykového stylu v~rámci sepisování práce. & \textbf{\expertiselevel}\\\midrule
\textbf{Textová úroveň práce} & Zahrnuje jazykovou a stylistiskou úroveň práce. & \textbf{\textlevel}\\\midrule
\textbf{Grafická úroveň práce} & Zahrnuje schopnost studenta využívat grafické prvky v~rámci teoretické části práce a~prezentace dat. & \textbf{\graphiclevel}\\\midrule
\textbf{Samostatnost} & Zahrnuje přístup k řešení problémů, sepisování práce, interpretace a diskuse dat. & \textbf{\independencelevel}\\\midrule
\textbf{Iniciativa} & Zahrnuje aktivitu a přístup studenta v~rámci vypracovávání práce. & \textbf{\initiativelevel}\\\midrule
\midrule
\textbf{Celkové hodnocení} & & \textbf{\finalgrade}\\
\bottomrule
\end{tabular}
\end{center}
}

\newcommand{\bpreader}{%
\begin{center}
\begin{tabular}{L{6cm}L{8cm}c}
\toprule
\textbf{Kritérium hodnocení} & \textbf{Poznámky} & \textbf{Hodnocení}\\
\midrule
\textbf{Odborná úroveň práce} & Výstižnost shrnutí poznatků relevantních k~práci; správná prezentace naměřených výsledků; formulace základního problémů a~cílů práce; úplnost popisu použitých metodik. & \textbf{\expertiselevel}\\\midrule
\textbf{Textová úroveň práce} & Jazyková a stylistická úroveň práce, návaznost teorie, výsledků a diskuse na cíle práce. & \textbf{\textlevel}\\\midrule
\textbf{Grafická úroveň práce} & Použití adekvátních grafických přístupů, úplnost legend u~obrázků a~tabulek. & \textbf{\graphiclevel}\\\midrule
\textbf{Rozsah} & Dodržení stanoveného rozsahu práce a~členění práce jako celku. & \textbf{\scopelevel}\\\midrule
\textbf{Literatura} & Správnost a vhodnost používaných citačních odkazů. & \textbf{\literaturelevel}\\\midrule
\midrule
\textbf{Celkové hodnocení} & & \textbf{\finalgrade}\\
\bottomrule
\end{tabular}
\end{center}
}

\newcommand{\dpsupervisor}{%
\begin{center}
\begin{tabular}{L{6cm}L{8cm}c}
\toprule
\textbf{Kritérium hodnocení} & \textbf{Poznámky} & \textbf{Hodnocení}\\
\midrule
\textbf{Pochopení teoretického základu experimentů} & Zahrnuje schopnost samostatného hledání relevantních zdrojů. & \textbf{\expertiselevel}\\\midrule
\textbf{Iniciativita a pracovní aktivita} & Zahrnuje schopnost řešit problémy a~komunikovat v~rámci kolektivu. & \textbf{\initiativelevel}\\\midrule
\textbf{Samostatnost při plánování experimentů a sepisování práce} & Zahrnuje přístup k řešení problémů, sepisování práce a~úroveň vědeckého psaní. & \textbf{\autonomylevel}\\\midrule
\textbf{Schopnost vést smysluplné pracovní záznamy } & Kvalita vedení laboratorního deníku. & \textbf{\journallevel}\\\midrule
\textbf{Pečlivost a~spolehlivost} & Zahrnuje míru zručnosti a schopnosti reprodukovatelné práce. & \textbf{\reliabilitylevel}\\\midrule
\textbf{Schopnost zpracování a~interpretace dat} & Zahrnuje úroveň zpracování, pochopení, interpretace a diskuse dat. & \textbf{\datalevel}\\
\midrule\midrule
\textbf{Celkové hodnocení} & & \textbf{\finalgrade}\\
\bottomrule
\end{tabular}
\end{center}
}

\newcommand{\dpreader}{%
\begin{center}
\begin{tabular}{L{14cm}c}
\toprule
\textbf{Kritérium hodnocení} & \textbf{Hodnocení}\\
\midrule
\textbf{Výstižnost a kvalita shrnutí poznatků na poli výzkumu relevantních k~práci; formulace základního problémů a cílů práce.} & \textbf{\researchlevel}\\\midrule
\textbf{Jasný popis logiky a hypotéz, na kterých jsou založeny jednotlivé experimenty; úplnost popisu použitých metodik umožňující reprodukovatelnost experimentů.} & \textbf{\methodiclevel}\\\midrule
\textbf{Struktura práce jako celku: Návaznost teorie, výsledků a diskuse na cíle práce, zodpovězení cílů a hypotéz, odpovídající struktura abstraktu.} & \textbf{\structurelevel}\\\midrule
\textbf{Správná prezentace a jasná interpretace naměřených výsledků včetně použití adekvátních bioinformatických, statistických a grafických  přístupů, úplnost legend u obrázků a tabulek.} & \textbf{\presentationlevel}\\\midrule
\textbf{Jasná a výstižná diskuze získaných výsledků s ohledem na původní cíle a~zařazení výsledků do širšího kontextu v rámci literatury na daném vědeckém poli.} & \textbf{\discussionlevel}\\\midrule
\textbf{Jazyková a stylistická úroveň; správnost používání citačních odkazů.} & \textbf{\languagelevel}\\
\midrule\midrule
\textbf{Celkové hodnocení} & \textbf{\finalgrade}\\
\bottomrule
\end{tabular}
\end{center}
}

\newcommand{\gradestable}{%
\IfStrEq{\thesistype}{bp}
{\IfStrEq{\reporttype}{supervisor}{\bpsupervisor}{\bpreader}}
{\IfStrEq{\reporttype}{supervisor}{\dpsupervisor}{\dpreader}}
}

\newcommand{\thesisreview}{\lipsum[1-2]}

\newcommand{\thesiscomment}{%
\bigskip
\noindent\textbf{Komentář
\IfStrEq{\reporttype}{supervisor}
    {vedoucího}
    {oponenta}
práce:}\\
\thesisreview
}

\newcommand{\questions}{%
\begin{enumerate}
\item Jaký je největší přínos vaší práce?
\item Co by šlo dále vylepšit?
\end{enumerate}}

\newcommand{\thesisquestions}{%
\bigskip
\noindent\textbf{Otázky oponenta:}
\questions
}

\newcommand{\finalstatement}{%
\bigskip
\noindent\textbf{Závěr:} Předloženou práci \IfStrEq{\result}{OK}{\textit{doporučuji}}{\textit{nedoporučuji}} k obhajobě.\\

\bigskip
\noindent V Brně dne \today \hfill Podpis:\phantom{My awesome sign}
}
