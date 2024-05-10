\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nierAutomata}[Nier Automata themed LaTeX class]

% DOCUMENT TYPE
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% MAIN COLORS
\RequirePackage[table]{xcolor}
\definecolor{main}{HTML}{454138}
\definecolor{extra1}{HTML}{cd664d}
\definecolor{extra2}{HTML}{b4af9a}
\definecolor{extra3}{HTML}{dcd8c0}
\definecolor{codestring}{HTML}{98C379}
\definecolor{shadow}{HTML}{908c7b}
\definecolor{background}{HTML}{cdc8B0}
\pagecolor{background}
\color{main}

%%% PACKAGES %%%
\RequirePackage[a4paper, total={6in, 8in}]{geometry}
\RequirePackage{indentfirst}
\RequirePackage[scaled]{helvet}
\RequirePackage[T1]{fontenc}
\RequirePackage{tikz}
\usetikzlibrary{calc,fit,backgrounds,shapes.geometric}
\RequirePackage{algorithmic}
\RequirePackage{fancyhdr}
\RequirePackage[explicit]{titlesec}
\RequirePackage{titletoc}
\RequirePackage{hyperref}
\RequirePackage{listings}
\usepackage[most]{tcolorbox}

%%% STYLE %%%
% NIER FONT
\renewcommand\familydefault{\sfdefault}

% SECTION STYLE
\titleformat{\section}[hang]{\sffamily\Large}{}{0mm}{\niersection{\MakeUppercase{#1}}}[\smallskip]

% TOC STYLE

% HEADERS AND FOOTERS
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[R]{%
    \ifnum \value{section}=0
    \else \nierminisection \fi
}
\setlength\headheight{40pt}
\addtolength{\topmargin}{-16pt}
\renewcommand{\sectionmark}[1]{ \markright{\thesection\ #1}{} }
\renewcommand{\subsectionmark}[1]{ \markright{\thesubsection\ #1}{} }
\fancyfoot[C]{\thepage}

% HYPERREF SETTINGS
\hypersetup{
    colorlinks=true,
    linkcolor=extra1,
    urlcolor=extra1,
    citecolor=extra1,
    filecolor=extra1
}

% CODE HIGHLIGHT
\lstdefinestyle{codestyle}{
    backgroundcolor=\color{main},
    commentstyle=\color{extra2},
    keywordstyle=\color{extra1},
    numberstyle=\tiny\color{main},
    stringstyle=\color{codestring},
    basicstyle=\ttfamily\footnotesize\color{background},
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2
}
\lstset{style=codestyle}

% Quote Box
\newtcolorbox{nierquotebox}[1][]{
    enhanced,
    colback=extra3,
    borderline west={9pt}{0pt}{main},
    borderline west={3pt}{9pt}{extra3},
    borderline west={2pt}{12pt}{main},
    boxrule=0pt,
    frame hidden,
    leftrule=12pt,
    drop fuzzy shadow=main,
    sharp corners,
    #1
}

% Box
\newtcolorbox{nierbox}[1][]{
    enhanced,
    colback=extra3,
    boxrule=0pt,
    frame hidden,
    colbacktitle=main,
    titlerule=0mm,
    drop fuzzy shadow=main,
    sharp corners,
    toptitle=2mm,
    bottomtitle=1mm,
    #1
}

% Quote
\newtcolorbox{nierquote}[1][]{
    enhanced,
    colback=background,
    borderline horizontal={1pt}{0pt}{main},
    boxrule=0pt,
    frame hidden,
    toprule=2pt,
    bottomrule=2pt,
    sharp corners,
    halign=center,
    #1
}

%%% TIKZ %%%
\newcommand{\nierarrow}{
\begin{tikzpicture}
    \draw[main,fill=main] (0mm,0mm) -- (1mm,1mm) -- (4mm,0mm) -- (1mm,-1mm) -- cycle;
    \draw[main,fill=main] (4mm,1mm) rectangle ++(0.5mm,0.5mm);
    \draw[main,fill=main] (4mm,-1mm) rectangle ++(0.5mm,-0.5mm);
    \draw[main,fill=background] (1mm,0mm) circle (0.5mm);
\end{tikzpicture}
}

\newcommand{\nierdiamond}{
\begin{tikzpicture}
    \node[diamond,
        fill=main,
        minimum width=2mm,
        minimum height=2mm,
        inner sep=0mm] (a1) at (-1.2mm,0mm) {};
    \node[diamond,
        fill=main,
        minimum width=2mm,
        minimum height=2mm,
        inner sep=0mm] (a2) at (1.2mm,0mm) {};
    \node[diamond,
        fill=main,
        minimum width=2mm,
        minimum height=2mm,
        inner sep=0mm] (a3) at (0mm,1.2mm) {};
    \node[diamond,
        fill=main,
        minimum width=2mm,
        minimum height=2mm,
        inner sep=0mm] (a4) at (0mm,-1.2mm) {};
\end{tikzpicture}
}

\newcommand{\nieritem}{
\begin{tikzpicture}
    \draw[color=background,line width=0.5mm] (-1.5mm,1mm) -- (1.5mm,-1mm) -- (0mm,-2mm) -- (-1.5mm,-1mm) -- (1.5mm,1mm);
    \draw[color=background, fill=background] (0mm,2mm) circle (0.4mm);
\end{tikzpicture}
}

\newcommand{\niersquare}[3]{
\begin{tikzpicture}
    \draw[color=#2, fill=#3] (0mm,-1mm) rectangle ++(2.5mm,2.5mm);
    \ifnum #1=1
        \draw[color=main] (0.5mm,0.25mm) -- (2mm,0.25mm);
    \fi
\end{tikzpicture}
}

\newcommand{\nierbigdiamond}[1]{
    \coordinate (iconcenter) at ($(current page.center) + (0mm,#1mm)$);
    \draw[
        color=main,
        line width=0.5mm]
        ($(iconcenter) + ( 50mm,0mm)$) -- 
        ($(iconcenter) + ( 0mm,50mm)$) --
        ($(iconcenter) + (-50mm,0mm)$) -- 
        ($(iconcenter) + (0mm,-50mm)$) --
        cycle;
        
    \draw[
        color=main,
        fill=main,
        line width=0.5mm]
        ($(iconcenter) + ( 21.25mm,23.75mm)$) -- 
        ($(iconcenter) + (     0mm,45mm)$) --
        ($(iconcenter) + (-21.25mm,23.75mm)$) -- 
        ($(iconcenter) + (     0mm,2.5mm)$) --
        cycle;
    \draw[
        color=main,
        fill=main,
        line width=0.5mm]
        ($(iconcenter) + ( 21.25mm,-23.75mm)$) -- 
        ($(iconcenter) + (     0mm,-45mm)$) --
        ($(iconcenter) + (-21.25mm,-23.75mm)$) -- 
        ($(iconcenter) + (     0mm,-2.5mm)$) --
        cycle;
    \draw[
        color=main,
        fill=main,
        line width=0.5mm]
        ($(iconcenter) + (23.75mm,-21.25mm)$) -- 
        ($(iconcenter) + (   45mm, 0mm)$) --
        ($(iconcenter) + (23.75mm, 21.25mm)$) -- 
        ($(iconcenter) + (  2.5mm, 0mm)$) --
        cycle;
    \draw[
        color=main,
        fill=main,
        line width=0.5mm]
        ($(iconcenter) + (-23.75mm,-21.25mm)$) -- 
        ($(iconcenter) + (-   45mm, 0mm)$) --
        ($(iconcenter) + (-23.75mm, 21.25mm)$) -- 
        ($(iconcenter) + (-  2.5mm, 0mm)$) --
        cycle;
}

\newcommand{\nierbigquest}[1]{
    \coordinate (iconcenter) at ($(current page.center) + (0mm,#1mm)$);
    \draw[
        color=main,
        fill=main,
        line width=0.5mm]
        ($(iconcenter) + ( 21.25mm,23.75mm)$) -- 
        ($(iconcenter) + (     0mm,45mm)$) --
        ($(iconcenter) + (-21.25mm,23.75mm)$) -- 
        ($(iconcenter) + (     0mm,2.5mm)$) --
        cycle;
    \draw[
        color=main,
        fill=main,
        line width=0.5mm]
        ($(iconcenter) + ( 21.25mm,-23.75mm)$) -- 
        ($(iconcenter) + (     0mm,-85mm)$) --
        ($(iconcenter) + (-21.25mm,-23.75mm)$) -- 
        ($(iconcenter) + (     0mm,-2.5mm)$) --
        cycle;
    \draw[
        color=main,
        fill=main,
        line width=0.5mm]
        ($(iconcenter) + (23.75mm,-21.25mm)$) -- 
        ($(iconcenter) + (   45mm, 0mm)$) --
        ($(iconcenter) + (23.75mm, 21.25mm)$) -- 
        ($(iconcenter) + (  2.5mm, 0mm)$) --
        cycle;
    \draw[
        color=main,
        fill=main,
        line width=0.5mm]
        ($(iconcenter) + (-23.75mm,-21.25mm)$) -- 
        ($(iconcenter) + (-   45mm, 0mm)$) --
        ($(iconcenter) + (-23.75mm, 21.25mm)$) -- 
        ($(iconcenter) + (-  2.5mm, 0mm)$) --
        cycle;
}

\newcommand{\nierbigitem}[1]{
    \coordinate (iconcenter) at ($(current page.center) + (0mm,#1mm)$);
    \draw[color=main,line width=5mm]
        ($(iconcenter) + (-30mm, 20mm)$) --
        ($(iconcenter) + ( 30mm,-20mm)$) --
        ($(iconcenter) + (  0mm,-40mm)$) --
        ($(iconcenter) + (-30mm,-20mm)$) --
        ($(iconcenter) + ( 30mm, 20mm)$);
    \draw[color=main, fill=main]
        ($(iconcenter) + (  0mm, 40mm)$) circle (10mm);
}

\newcommand{\nierimgwrap}[3]{
\begin{figure}[h]
\centering
\begin{tikzpicture}
    \node (img) at (0,0) {#1};
    \draw[color   =main,
        line width=0.2mm]
        ($(img.north west) + (-0.5mm,0.5mm)$) --
        ($(img.south west) + (-0.5mm,-0.5mm)$) --
        ($(img.south east) + (0.5mm,-0.5mm)$) --
        ($(img.north east) + (0.5mm,0.5mm)$) --
        cycle;
    \draw[fill=main]
        ($(img.north west) + (-0.5mm,0.5mm)$) rectangle ++(-1mm,1mm);
    \draw[fill=main]
        ($(img.north east) + (0.5mm,0.5mm)$) rectangle ++(1mm,1mm);
    \draw[fill=main]
        ($(img.south west) + (-0.5mm,-0.5mm)$) rectangle ++(-1mm,-1mm);
    \draw[fill=main] 
        ($(img.south east) + (0.5mm,-0.5mm)$) rectangle ++(1mm,-1mm);
\end{tikzpicture}
\caption{#2}
\label{#3}
\end{figure}
}

\newcommand{\nierminisection}{
\begin{tikzpicture}[baseline = (text.base)]
    \node[
        color    =background,
        inner sep=0,
        outer sep=0]
            (text) {\MakeUppercase{\rightmark}};
    \node[
        style={
            rectangle,
            fill        =background,
            minimum size=5mm},
        color     =background,
        inner xsep=0,
        outer sep =0]
            (l) at ($(text.west) + (-0.4,-0.02)$) {};
    \begin{pgfonlayer}{background}
        \node[fit=(text)(l), fill=main, draw=none, inner sep=2mm] {};
    \end{pgfonlayer}
\end{tikzpicture}
}

\newcommand{\niersection}[1]{
\centering
\begin{tikzpicture}
\ifnum \value{section}>0
    \node[
        color    =background,
        inner sep=0,
        outer sep=0,
        yshift   =3mm,
        align    =left]
            (text) {#1};
    \begin{pgfonlayer}{background}
        \node[
            fit         =(text),
            fill         =main,
            draw         =none,
            outer sep    =0mm,
            inner sep    =2mm,
            minimum width=145mm] (block) {};
        \draw[
            color     =main,
            line width=0.5mm]
                ($(block.north west) + (-1.5mm,0mm)$) --
                ($(block.south west) + (-1.5mm,0mm)$)
                {};
        \draw[
            color     =main,
            line width=0.5mm]
                ($(block.north east) + (1.5mm,0mm)$) --
                ($(block.south east) + (1.5mm,0mm)$)
                {};
    \end{pgfonlayer}
\else
    \node (title) at (0mm,0mm) {\Huge Contents};
    \coordinate (toctitle) at
        ($(title) + (0mm,-10mm)$);
    \draw[color=background,line width=0.5mm]
        ($(toctitle) + (-65mm,0mm)$) --
        ($(toctitle) + ( 65mm,0mm)$);
    \draw[color=background, fill=background]
        ($(toctitle) + (-66.5mm,0mm)$) circle (0.25mm);
    \draw[color=background, fill=background]
        ($(toctitle) + ( 66.5mm,0mm)$) circle (0.25mm);
\fi
\end{tikzpicture}
}

\renewcommand{\labelitemi}{\niersquare{0}{main}{main}}
\renewcommand{\labelitemii}{\niersquare{0}{main}{background}}
\renewcommand{\labelitemiii}{\niersquare{1}{main}{background}}