\documentclass[a4paper]{article}
\usepackage[a4paper,left=3cm,right=2cm,top=2.5cm,bottom=2.5cm]{geometry}
\usepackage{palatino}
\usepackage[colorlinks=true,linkcolor=blue,citecolor=blue]{hyperref}
\usepackage{graphicx}
\usepackage{cp2021t}
\usepackage{subcaption}
\usepackage{adjustbox}
\usepackage{color}
\definecolor{red}{RGB}{255,  0,  0}
\definecolor{blue}{RGB}{0,0,255}
\def\red{\color{red}}
\def\blue{\color{blue}}
%================= local x=====================================================%
\def\getGif#1{\includegraphics[width=0.3\textwidth]{cp2021t_media/#1.png}}
\let\uk=\emph
\def\aspas#1{``#1"}
%================= lhs2tex=====================================================%
%include polycode.fmt
%format (div (x)(y)) = x "\div " y
%format succ = "\succ "
%format ==> = "\Longrightarrow "
%format map = "\map "
%format length = "\length "
%format fst = "\p1"
%format p1  = "\p1"
%format snd = "\p2"
%format p2  = "\p2"
%format Left = "i_1"
%format Right = "i_2"
%format i1 = "i_1"
%format i2 = "i_2"
%format >< = "\times"
%format >|<  = "\bowtie "
%format |-> = "\mapsto"
%format . = "\comp "
%format .=?=. = "\mathbin{\stackrel{\mathrm{?}}{=}}"
%format (kcomp (f)(g)) = f "\kcomp " g
%format -|- = "+"
%format conc = "\mathsf{conc}"
%format summation = "{\sum}"
%format (either (a) (b)) = "\alt{" a "}{" b "}"
%format (frac (a) (b)) = "\frac{" a "}{" b "}"
%format (uncurry f) = "\uncurry{" f "}"
%format (const f) = "\underline{" f "}"
%format TLTree = "\mathsf{TLTree}"
%format (lcbr (x)(y)) = "\begin{lcbr}" x "\\" y "\end{lcbr}"
%format (split (x) (y)) = "\conj{" x "}{" y "}"
%format (for (f) (i)) = "\for{" f "}\ {" i "}"
%format B_tree = "\mathsf{B}\mbox{-}\mathsf{tree} "
\def\ana#1{\mathopen{[\!(}#1\mathclose{)\!]}}
%format <$> = "\mathbin{\mathopen{\langle}\$\mathclose{\rangle}}"
%format (cataA (f) (g)) = "\cata{" f "~" g "}_A"
%format (anaA (f) (g)) = "\ana{" f "~" g "}_A"
%format (cataB (f) (g)) = "\cata{" f "~" g "}_B"
%format (cata (f)) = "\cata{" f "}"
%format (anaB (f) (g)) = "\ana{" f "~" g "}_B"
%format Either a b = a "+" b
%format fmap = "\mathsf{fmap}"
%format NA   = "\textsc{na}"
%format NB   = "\textsc{nb}"
%format inT = "\mathsf{in}"
%format outT = "\mathsf{out}"
%format Null = "1"
%format (Prod (a) (b)) = a >< b
%format fF = "\fun F "
%format e1 = "e_1 "
%format e2 = "e_2 "
%format Dist = "\fun{Dist}"
%format IO = "\fun{IO}"
%format BTree = "\fun{BTree} "
%format LTree = "\mathsf{LTree}"
%format inNat = "\mathsf{in}"
%format (cataNat (g)) = "\cata{" g "}"
%format Nat0 = "\N_0"
%format Rational = "\Q "
%format toRational = " to_\Q "
%format fromRational = " from_\Q "
%format muB = "\mu "
%format (frac (n)(m)) = "\frac{" n "}{" m "}"
%format (fac (n)) = "{" n "!}"
%format (underbrace (t) (p)) = "\underbrace{" t "}_{" p "}"
%format matrix = "matrix"
%%format (bin (n) (k)) = "\Big(\vcenter{\xymatrix@R=1pt{" n "\\" k "}}\Big)"
%format `ominus` = "\mathbin{\ominus}"
%format % = "\mathbin{/}"
%format <-> = "{\,\leftrightarrow\,}"
%format <|> = "{\,\updownarrow\,}"
%format `minusNat`= "\mathbin{-}"
%format ==> = "\Rightarrow"
%format .==>. = "\Rightarrow"
%format .<==>. = "\Leftrightarrow"
%format .==. = "\equiv"
%format .<=. = "\leq"
%format .&&&. = "\wedge"
%format cdots = "\cdots "
%format pi = "\pi "
%format (curry (f)) = "\overline{" f "}"
%format (cataLTree (x)) = "\llparenthesis\, " x "\,\rrparenthesis"
%format (anaLTree (x)) = "\mathopen{[\!(}" x "\mathclose{)\!]}"
%format delta = "\Delta "

%---------------------------------------------------------------------------

\title{
       	C??lculo de Programas
\\
       	Trabalho Pr??tico
\\
       	MiEI+LCC --- 2020/21
}

\author{
       	\dium
\\
       	Universidade do Minho
}


\date\mydate

\makeindex
\newcommand{\rn}[1]{\textcolor{red}{#1}}
\begin{document}

\maketitle

\begin{center}\large
\begin{tabular}{ll}
\textbf{Grupo} nr. & 111
\\\hline
a93202 & Francisco Alexandre Pinto Neves
\\
a93166 & Jo??o Pedro Rodrigues Carvalho
\\
a93310 & Joaquim Tiago Martins Roque
\end{tabular}
\end{center}

\section{Pre??mbulo}

\CP\ tem como objectivo principal ensinar
a progra\-ma????o de computadores como uma disciplina cient??fica. Para isso
parte-se de um repert??rio de \emph{combinadores} que formam uma ??lgebra da
programa????o (conjunto de leis universais e seus corol??rios) e usam-se esses
combinadores para construir programas \emph{composicionalmente}, isto ??,
agregando programas j?? existentes.

Na sequ??ncia pedag??gica dos planos de estudo dos dois cursos que t??m
esta disciplina, opta-se pela aplica????o deste m??todo ?? programa????o
em \Haskell\ (sem preju??zo da sua aplica????o a outras linguagens
funcionais). Assim, o presente trabalho pr??tico coloca os
alunos perante problemas concretos que dever??o ser implementados em
\Haskell.  H?? ainda um outro objectivo: o de ensinar a documentar
programas, a valid??-los e a produzir textos t??cnico-cient??ficos de
qualidade.

\section{Documenta????o} Para cumprir de forma integrada os objectivos
enunciados acima vamos recorrer a uma t??cnica de programa\-????o dita
``\litp{liter??ria}'' \cite{Kn92}, cujo princ??pio base ?? o seguinte:
%
\begin{quote}\em Um programa e a sua documenta????o devem coincidir.
\end{quote}
%
Por outras palavras, o c??digo fonte e a documenta????o de um
programa dever??o estar no mesmo ficheiro.

O ficheiro \texttt{cp2021t.pdf} que est?? a ler ?? j?? um exemplo de
\litp{programa????o liter??ria}: foi gerado a partir do texto fonte
\texttt{cp2021t.lhs}\footnote{O suffixo `lhs' quer dizer
\emph{\lhaskell{literate Haskell}}.} que encontrar?? no
\MaterialPedagogico\ desta disciplina descompactando o ficheiro
\texttt{cp2021t.zip} e executando:
\begin{Verbatim}[fontsize=\small]
    $ lhs2TeX cp2021t.lhs > cp2021t.tex
    $ pdflatex cp2021t
\end{Verbatim}
em que \href{https://hackage.haskell.org/package/lhs2tex}{\texttt\LhsToTeX} ??
um pre-processador que faz ``pretty printing''
de c??digo Haskell em \Latex\ e que deve desde j?? instalar executando
\begin{Verbatim}[fontsize=\small]
    $ cabal install lhs2tex --lib
\end{Verbatim}
Por outro lado, o mesmo ficheiro \texttt{cp2021t.lhs} ?? execut??vel e cont??m
o ``kit'' b??sico, escrito em \Haskell, para realizar o trabalho. Basta executar
\begin{Verbatim}[fontsize=\small]
    $ ghci cp2021t.lhs
\end{Verbatim}

%if False
\begin{code}
{-# OPTIONS_GHC -XNPlusKPatterns #-}
{-# LANGUAGE GeneralizedNewtypeDeriving, DeriveDataTypeable, FlexibleInstances #-}
module Main where
import Cp
import List hiding (fac)
import Nat
import LTree
import Data.List hiding (find)
import Test.QuickCheck hiding ((><),choose,collect)
import qualified Test.QuickCheck as QuickCheck
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Control.Monad
import Control.Applicative hiding ((<|>))
import System.Process
\end{code}
%endif

\noindent Abra o ficheiro \texttt{cp2021t.lhs} no seu editor de texto preferido
e verifique que assim ??: todo o texto que se encontra dentro do ambiente
\begin{quote}\small\tt
\verb!\begin{code}!
\\ ... \\
\verb!\end{code}!
\end{quote}
?? seleccionado pelo \GHCi\ para ser executado.

\section{Como realizar o trabalho}
Este trabalho te??rico-pr??tico deve ser realizado por grupos de 3 (ou 4) alunos.
Os detalhes da avalia????o (datas para submiss??o do relat??rio e sua defesa
oral) s??o os que forem publicados na \cp{p??gina da disciplina} na \emph{internet}.

Recomenda-se uma abordagem participativa dos membros do grupo
de trabalho por forma a poderem responder ??s quest??es que ser??o colocadas
na \emph{defesa oral} do relat??rio.

Em que consiste, ent??o, o \emph{relat??rio} a que se refere o par??grafo anterior?
?? a edi????o do texto que est?? a ser lido, preenchendo o anexo \ref{sec:resolucao}
com as respostas. O relat??rio dever?? conter ainda a identifica????o dos membros
do grupo de trabalho, no local respectivo da folha de rosto.

Para gerar o PDF integral do relat??rio deve-se ainda correr os comando seguintes,
que actualizam a bibliografia (com \Bibtex) e o ??ndice remissivo (com \Makeindex),
\begin{Verbatim}[fontsize=\small]
    $ bibtex cp2021t.aux
    $ makeindex cp2021t.idx
\end{Verbatim}
e recompilar o texto como acima se indicou. Dever-se-?? ainda instalar o utilit??rio
\QuickCheck,
que ajuda a validar programas em \Haskell\ e a biblioteca \gloss{Gloss} para
gera????o de gr??ficos 2D:
\begin{Verbatim}[fontsize=\small]
    $ cabal install QuickCheck gloss --lib
\end{Verbatim}
Para testar uma propriedade \QuickCheck~|prop|, basta invoc??-la com o comando:
\begin{verbatim}
    > quickCheck prop
    +++ OK, passed 100 tests.
\end{verbatim}
Pode-se ainda controlar o n??mero de casos de teste e sua complexidade,
como o seguinte exemplo mostra:
\begin{verbatim}
    > quickCheckWith stdArgs { maxSuccess = 200, maxSize = 10 } prop
    +++ OK, passed 200 tests.
\end{verbatim}
Qualquer programador tem, na vida real, de ler e analisar (muito!) c??digo
escrito por outros. No anexo \ref{sec:codigo} disponibiliza-se algum
c??digo \Haskell\ relativo aos problemas que se seguem. Esse anexo dever??
ser consultado e analisado ?? medida que isso for necess??rio.

\subsection{Stack}

O \stack{Stack} ?? um programa ??til para criar, gerir e manter projetos em \Haskell.
Um projeto criado com o Stack possui uma estrutura de pastas muito espec??fica:

\begin{itemize}
\item Os m??dulos auxiliares encontram-se na pasta \emph{src}.
\item O m??dulos principal encontra-se na pasta \emph{app}.
\item A lista de dep??ndencias externas encontra-se no ficheiro \emph{package.yaml}.
\end{itemize}

Pode aceder ao \GHCi\ utilizando o comando:
\begin{verbatim}
stack ghci
\end{verbatim}

Garanta que se encontra na pasta mais externa \textbf{do projeto}.
A primeira vez que correr este comando as dep??ndencias externas ser??o instaladas automaticamente.

Para gerar o PDF, garanta que se encontra na diretoria \emph{app}.

\Problema

Os \emph{tipos de dados alg??bricos} estudados ao longo desta disciplina oferecem
uma grande capacidade expressiva ao programador. Gra??as ?? sua flexibilidade,
torna-se trivial implementar \DSL s
e at?? mesmo \href{http://www.cse.chalmers.se/~ulfn/papers/thesis.pdf}{linguagens de programa????o}.

Paralelamente, um t??pico bastante estudado no ??mbito de \DL\
?? a deriva????o autom??tica de express??es matem??ticas, por exemplo, de derivadas.
Duas t??cnicas que podem ser utilizadas para o c??lculo de derivadas s??o:

\begin{itemize}
\item \emph{Symbolic differentiation}
\item \emph{Automatic differentiation}
\end{itemize}

\emph{Symbolic differentiation} consiste na aplica????o sucessiva de transforma????es
(leia-se: fun????es) que sejam congruentes com as regras de deriva????o. O resultado
final ser?? a express??o da derivada.

O leitor atento poder?? notar um problema desta t??cnica: a express??o
inicial pode crescer de forma descontrolada, levando a um c??lculo pouco eficiente.
\emph{Automatic differentiation} tenta resolver este problema,
calculando \textbf{o valor} da derivada da express??o em todos os passos.
Para tal, ?? necess??rio calcular o valor da express??o \textbf{e} o valor da sua derivada.

Vamos de seguida definir uma linguagem de express??es matem??ticas simples e
implementar as duas t??cnicas de deriva????o autom??tica.
Para isso, seja dado o seguinte tipo de dados,

\begin{code}
data ExpAr a = X
           | N a
           | Bin BinOp (ExpAr a) (ExpAr a)
           | Un UnOp (ExpAr a)
           deriving (Eq, Show)
\end{code}

\noindent
onde |BinOp| e |UnOp| representam opera????es bin??rias e un??rias, respectivamente:

\begin{code}
data BinOp = Sum
           | Product
           deriving (Eq, Show)

data UnOp = Negate
          | E
          deriving (Eq, Show)
\end{code}

\noindent
O construtor |E| simboliza o exponencial de base $e$.

Assim, cada express??o pode ser uma vari??vel, um n??mero, uma opera????o bin??ria
aplicada ??s devidas express??es, ou uma opera????o un??ria aplicada a uma express??o.
Por exemplo,
\begin{spec}
Bin Sum X (N 10)
\end{spec}
designa |x+10| na nota????o matem??tica habitual.

\begin{enumerate}
\item A defini????o das fun????es |inExpAr| e |baseExpAr| para este tipo ?? a seguinte:
\begin{code}
inExpAr = either (const X) num_ops where
  num_ops = either N ops
  ops     = either bin (uncurry Un)
  bin(op, (a, b)) = Bin op a b

baseExpAr f g h j k l z = f -|- (g -|- (h >< (j >< k) -|- l >< z))
\end{code}

  Defina as fun????es |outExpAr| e |recExpAr|,
  e teste as propriedades que se seguem.
  \begin{propriedade}
    |inExpAr| e |outExpAr| s??o testemunhas de um isomorfismo,
    isto ??,
    |inExpAr . outExpAr = id| e |outExpAr . idExpAr = id|:
\begin{code}
prop_in_out_idExpAr :: (Eq a) => ExpAr a -> Bool
prop_in_out_idExpAr = inExpAr . outExpAr .==. id

prop_out_in_idExpAr :: (Eq a) => OutExpAr a -> Bool
prop_out_in_idExpAr = outExpAr . inExpAr .==. id
\end{code}
    \end{propriedade}

  \item Dada uma express??o aritm??tica e um escalar para substituir o |X|,
	a fun????o

\begin{quote}
      |eval_exp :: Floating a => a -> (ExpAr a) -> a|
\end{quote}

\noindent calcula o resultado da express??o. Na p??gina \pageref{pg:P1}
    esta fun????o est?? expressa como um catamorfismo. Defina o respectivo gene
    e, de seguida, teste as propriedades:
    \begin{propriedade}
       A fun????o |eval_exp| respeita os elementos neutros das opera????es.
\begin{code}
prop_sum_idr :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_sum_idr a exp = eval_exp a exp .=?=. sum_idr where
  sum_idr = eval_exp a (Bin Sum exp (N 0))

prop_sum_idl :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_sum_idl a exp = eval_exp a exp .=?=. sum_idl where
  sum_idl = eval_exp a (Bin Sum (N 0) exp)

prop_product_idr :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_product_idr a exp = eval_exp a exp .=?=. prod_idr where
  prod_idr = eval_exp a (Bin Product exp (N 1))

prop_product_idl :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_product_idl a exp = eval_exp a exp .=?=. prod_idl where
  prod_idl = eval_exp a (Bin Product (N 1) exp)

prop_e_id :: (Floating a, Real a) => a -> Bool
prop_e_id a = eval_exp a (Un E (N 1)) == expd 1

prop_negate_id :: (Floating a, Real a) => a -> Bool
prop_negate_id a = eval_exp a (Un Negate (N 0)) == 0
\end{code}
    \end{propriedade}
    \begin{propriedade}
      Negar duas vezes uma express??o tem o mesmo valor que n??o fazer nada.
\begin{code}
prop_double_negate :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_double_negate a exp = eval_exp a exp .=?=. eval_exp a (Un Negate (Un Negate exp))
\end{code}
    \end{propriedade}

  \item ?? poss??vel otimizar o c??lculo do valor de uma express??o aritm??tica tirando proveito
  dos elementos absorventes de cada opera????o. Implemente os genes da fun????o
\begin{spec}
      optmize_eval :: (Floating a, Eq a) => a -> (ExpAr a) -> a
\end{spec}
  que se encontra na p??gina \pageref{pg:P1} expressa como um hilomorfismo\footnote{Qual ?? a vantagem de implementar a fun????o |optimize_eval| utilizando um hilomorfismo em vez de utilizar um catamorfismo com um gene "inteligente"?}
  e teste as propriedades:

    \begin{propriedade}
      A fun????o |optimize_eval| respeita a sem??ntica da fun????o |eval|.
\begin{code}
prop_optimize_respects_semantics :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_optimize_respects_semantics a exp = eval_exp a exp .=?=. optmize_eval a exp
\end{code}
    \end{propriedade}


\item Para calcular a derivada de uma express??o, ?? necess??rio aplicar transforma????es
?? express??o original que respeitem as regras das derivadas:\footnote{%
	Apesar da adi????o e multiplica????o gozarem da propriedade comutativa,
	h?? que ter em aten????o a ordem das opera????es por causa dos testes.}

\begin{itemize}
  \item Regra da soma:
\begin{eqnarray*}
	\frac{d}{dx}(f(x)+g(x))=\frac{d}{dx}(f(x))+\frac{d}{dx}(g(x))
\end{eqnarray*}
  \item Regra do produto:
\begin{eqnarray*}
	\frac{d}{dx}(f(x)g(x))=f(x)\cdot \frac{d}{dx}(g(x))+\frac{d}{dx}(f(x))\cdot g(x)
\end{eqnarray*}
\end{itemize}

  Defina o gene do catamorfismo que ocorre na fun????o
    \begin{quote}
      |sd :: Floating a => ExpAr a -> ExpAr a|
    \end{quote}
  que, dada uma express??o aritm??tica, calcula a sua derivada.
  Testes a fazer, de seguida:
    \begin{propriedade}
       A fun????o |sd| respeita as regras de deriva????o.
\begin{code}
prop_const_rule :: (Real a, Floating a) => a -> Bool
prop_const_rule a = sd (N a) == N 0

prop_var_rule :: Bool
prop_var_rule = sd X == N 1

prop_sum_rule :: (Real a, Floating a) => ExpAr a -> ExpAr a -> Bool
prop_sum_rule exp1 exp2 = sd (Bin Sum exp1 exp2) == sum_rule where
  sum_rule = Bin Sum (sd exp1) (sd exp2)

prop_product_rule :: (Real a, Floating a) => ExpAr a -> ExpAr a -> Bool
prop_product_rule exp1 exp2 = sd (Bin Product exp1 exp2) == prod_rule where
  prod_rule =Bin Sum (Bin Product exp1 (sd exp2)) (Bin Product (sd exp1) exp2)

prop_e_rule :: (Real a, Floating a) => ExpAr a -> Bool
prop_e_rule exp = sd (Un E exp) == Bin Product (Un E exp) (sd exp)

prop_negate_rule :: (Real a, Floating a) => ExpAr a -> Bool
prop_negate_rule exp = sd (Un Negate exp) == Un Negate (sd exp)
\end{code}
    \end{propriedade}

\item Como foi visto, \emph{Symbolic differentiation} n??o ?? a t??cnica
mais eficaz para o c??lculo do valor da derivada de uma express??o.
\emph{Automatic differentiation} resolve este problema c??lculando o valor
da derivada em vez de manipular a express??o original.

  Defina o gene do catamorfismo que ocorre na fun????o
    \begin{spec}
    ad :: Floating a => a -> ExpAr a -> a
    \end{spec}
  que, dada uma express??o aritm??tica e um ponto,
  calcula o valor da sua derivada nesse ponto,
  sem transformar manipular a express??o original.
  Testes a fazer, de seguida:

    \begin{propriedade}
       Calcular o valor da derivada num ponto |r| via |ad| ?? equivalente a calcular a derivada da express??o e avalia-la no ponto |r|.
\begin{code}
prop_congruent :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_congruent a exp = ad a exp .=?=. eval_exp a (sd exp)
\end{code}
    \end{propriedade}
\end{enumerate}

\Problema

Nesta disciplina estudou-se como fazer \pd{programa????o din??mica} por c??lculo,
recorrendo ?? lei de recursividade m??tua.\footnote{Lei (\ref{eq:fokkinga})
em \cite{Ol18}, p??gina \pageref{eq:fokkinga}.}

Para o caso de fun????es sobre os n??meros naturais (|Nat0|, com functor |fF
X = 1 + X|) ?? f??cil derivar-se da lei que foi estudada uma
	\emph{regra de algibeira}
	\label{pg:regra}
que se pode ensinar a programadores que n??o tenham estudado
\cp{C??lculo de Programas}. Apresenta-se de seguida essa regra, tomando como exemplo o
c??lculo do ciclo-\textsf{for} que implementa a fun????o de Fibonacci, recordar
o sistema
\begin{spec}
fib 0 = 1
fib(n+1) = f n

f 0 = 1
f (n+1) = fib n + f n
\end{spec}
Obter-se-?? de imediato
\begin{code}
fib' = p1 . for loop init where
   loop(fib,f)=(f,fib+f)
   init = (1,1)
\end{code}
usando as regras seguintes:
\begin{itemize}
\item	O corpo do ciclo |loop| ter?? tantos argumentos quanto o n??mero de fun????es mutuamente recursivas.
\item	Para as vari??veis escolhem-se os pr??prios nomes das fun????es, pela ordem
que se achar conveniente.\footnote{Podem obviamente usar-se outros s??mbolos, mas numa primeira leitura
d?? jeito usarem-se tais nomes.}
\item	Para os resultados v??o-se buscar as express??es respectivas, retirando a vari??vel |n|.
\item	Em |init| coleccionam-se os resultados dos casos de base das fun????es, pela mesma ordem.
\end{itemize}
Mais um exemplo, envolvendo polin??mios do segundo grau $ax^2 + b x + c$ em |Nat0|.
Seguindo o m??todo estudado nas aulas\footnote{Sec????o 3.17 de \cite{Ol18} e t??pico
\href{https://www4.di.uminho.pt/~jno/media/cp/}{Recursividade m??tua} nos v??deos das aulas te??ricas.},
de $f\ x = a x^2 + b x + c$ derivam-se duas fun????es mutuamente recursivas:
\begin{spec}
f 0 = c
f (n+1) = f n + k n

k 0 = a + b
k(n+1) = k n + 2 a
\end{spec}
Seguindo a regra acima, calcula-se de imediato a seguinte implementa????o, em Haskell:
\begin{code}
f' a b c = p1 . for loop init where
  loop(f,k) = (f+k,k+2*a)
  init = (c,a+b)
\end{code}
O que se pede ent??o, nesta pergunta?
Dada a f??rmula que d?? o |n|-??simo \catalan{n??mero de Catalan},
\begin{eqnarray}
	C_n = \frac{(2n)!}{(n+1)! (n!) }
	\label{eq:cat}
\end{eqnarray}
derivar uma implementa????o de $C_n$ que n??o calcule factoriais nenhuns.
Isto ??, derivar um ciclo-\textsf{for}
\begin{spec}
cat = cdots . for loop init where cdots
\end{spec}
que implemente esta fun????o.

\begin{propriedade}
A fun????o proposta coincidem com a defini????o dada:
\begin{code}
prop_cat = (>=0) .==>. (catdef  .==. cat)
\end{code}
\end{propriedade}
%
\textbf{Sugest??o}: Come??ar por estudar muito bem o processo de c??lculo dado
no anexo \ref{sec:recmul} para o problema (semelhante) da fun????o exponencial.


\Problema

As \bezier{curvas de B??zier}, designa????o dada em honra ao engenheiro
\href{https://en.wikipedia.org/wiki/Pierre_B%C3%A9zier}{Pierre B??zier},
s??o curvas ub??quas na ??rea de computa????o gr??fica, anima????o e modela????o.
Uma curva de B??zier ?? uma curva param??trica, definida por um conjunto
$\{P_0,...,P_N\}$ de pontos de controlo, onde $N$ ?? a ordem da curva.

\begin{figure}[h!]
  \centering
  \includegraphics[width=0.8\textwidth]{cp2021t_media/Bezier_curves.png}
  \caption{Exemplos de curvas de B??zier retirados da \bezier{ Wikipedia}.}
\end{figure}

O algoritmo de \emph{De Casteljau} ?? um m??todo recursivo capaz de calcular
curvas de B??zier num ponto. Apesar de ser mais lento do que outras abordagens,
este algoritmo ?? numericamente mais est??vel, trocando velocidade por corre????o.

De forma sucinta, o valor de uma curva de B??zier de um s?? ponto $\{P_0\}$
(ordem $0$) ?? o pr??prio ponto $P_0$. O valor de uma curva de B??zier de ordem
$N$ ?? calculado atrav??s da interpola????o linear da curva de B??zier dos primeiros
$N-1$ pontos e da curva de B??zier dos ??ltimos $N-1$ pontos.

A interpola????o linear entre 2 n??meros, no intervalo $[0, 1]$, ?? dada pela
seguinte fun????o:

\begin{code}
linear1d :: Rational -> Rational -> OverTime Rational
linear1d a b = formula a b where
  formula :: Rational -> Rational -> Float -> Rational
  formula x y t = ((1.0 :: Rational) - (toRational t)) * x + (toRational t) * y
\end{code}
%
A interpola????o linear entre 2 pontos de dimens??o $N$ ?? calculada atrav??s
da interpola????o linear de cada dimens??o.

O tipo de dados |NPoint| representa um ponto com $N$ dimens??es.
\begin{code}
type NPoint = [Rational]
\end{code}
Por exemplo, um ponto de 2 dimens??es e um ponto de 3 dimens??es podem ser
representados, respetivamente, por:
\begin{spec}
p2d = [1.2, 3.4]
p3d = [0.2, 10.3, 2.4]
\end{spec}
%
O tipo de dados |OverTime a| representa um termo do tipo |a| num dado instante
(dado por um |Float|).
\begin{code}
type OverTime a = Float -> a
\end{code}
%
O anexo \ref{sec:codigo} tem definida a fun????o
    \begin{spec}
    calcLine :: NPoint -> (NPoint -> OverTime NPoint)
    \end{spec}
que calcula a interpola????o linear entre 2 pontos, e a fun????o
    \begin{spec}
    deCasteljau :: [NPoint] -> OverTime NPoint
    \end{spec}
que implementa o algoritmo respectivo.

\begin{enumerate}

\item Implemente |calcLine| como um catamorfismo de listas,
testando a sua defini????o com a propriedade:
    \begin{propriedade} Defini????o alternativa.
\begin{code}
prop_calcLine_def :: NPoint -> NPoint -> Float -> Bool
prop_calcLine_def p q d = calcLine p q d ==  zipWithM linear1d p q d
\end{code}
    \end{propriedade}

\item Implemente a fun????o |deCasteljau| como um hilomorfismo, testando agora a propriedade:
    \begin{propriedade}
      Curvas de B??zier s??o sim??tricas.
\begin{code}
prop_bezier_sym :: [[Rational]] -> Gen Bool
prop_bezier_sym l = all (< delta) . calc_difs . bezs <$> elements ps  where
  calc_difs = (\(x, y) -> zipWith (\w v -> if w >= v then w - v else v - w) x y)
  bezs t    = (deCasteljau l t, deCasteljau (reverse l) (fromRational (1 - (toRational t))))
  delta = 1e-2
\end{code}
    \end{propriedade}

  \item Corra a fun????o |runBezier| e aprecie o seu trabalho\footnote{%
        A representa????o em Gloss ?? uma adapta????o de um
        \href{https://github.com/hrldcpr/Bezier.hs}{projeto}
        de Harold Cooper.} clicando na janela que ?? aberta (que cont??m, a verde, um ponto
        inicila) com o bot??o esquerdo do rato para adicionar mais pontos.
        A tecla |Delete| apaga o ponto mais recente.

\end{enumerate}

\Problema

Seja dada a f??rmula que calcula a m??dia de uma lista n??o vazia $x$,
\begin{equation}
avg\ x = \frac 1 k\sum_{i=1}^{k} x_i
\end{equation}
onde $k=length\ x$. Isto ??, para sabermos a m??dia de uma lista precisamos de dois catamorfismos: o que faz o somat??rio e o que calcula o comprimento a lista.
Contudo, ?? facil de ver que
\begin{quote}
	$avg\ [a]=a$
\\
	$avg (a:x) = \frac 1 {k+1}(a+\sum_{i=1}^{k} x_i) = \frac{a+k(avg\ x)}{k+1}$ para $k=length\ x$
\end{quote}
Logo $avg$ est?? em recursividade m??tua com $length$ e o par de fun????es pode ser expresso por um ??nico catamorfismo, significando que a lista apenas ?? percorrida uma vez.

\begin{enumerate}

\item	Recorra ?? lei de recursividade m??tua para derivar a fun????o
|avg_aux = cata (either b q)| tal que
|avg_aux = split avg length| em listas n??o vazias.

\item	Generalize o racioc??nio anterior para o c??lculo da m??dia de todos os elementos de uma \LTree\ recorrendo a uma ??nica travessia da ??rvore (i.e.\ catamorfismo).

\end{enumerate}
Verifique as suas fun????es testando a propriedade seguinte:
\begin{propriedade}
A m??dia de uma lista n??o vazia e de uma \LTree\ com os mesmos elementos coincide,
a menos de um erro de 0.1 mil??simas:
\begin{code}
prop_avg :: [Double] -> Property
prop_avg = nonempty .==>. diff .<=. const 0.000001 where
   diff l = avg l - (avgLTree . genLTree) l
   genLTree = anaLTree lsplit
   nonempty = (>[])
\end{code}
\end{propriedade}

\Problema	(\textbf{NB}: Esta quest??o ?? \textbf{opcional} e funciona como \textbf{valoriza????o} apenas para os alunos que desejarem faz??-la.)

\vskip 1em \noindent
Existem muitas linguagens funcionais para al??m do \Haskell, que ?? a linguagem usada neste trabalho pr??tico. Uma delas ?? o \Fsharp\ da Microsoft. Na directoria \verb!fsharp! encontram-se os m??dulos \Cp, \Nat\ e \LTree\ codificados em \Fsharp. O que se pede ?? a biblioteca \BTree\ escrita na mesma linguagem.

Modo de execu????o: o c??digo que tiverem produzido nesta pergunta deve ser colocado entre o \verb!\begin{verbatim}! e o \verb!\end{verbatim}! da correspondente parte do anexo \ref{sec:resolucao}. Para al??m disso, os grupos podem demonstrar o c??digo na oral.

\newpage

\part*{Anexos}

\appendix

\section{Como exprimir c??lculos e diagramas em LaTeX/lhs2tex}
Como primeiro exemplo, estudar o texto fonte deste trabalho para obter o
efeito:\footnote{Exemplos tirados de \cite{Ol18}.}
\begin{eqnarray*}
\start
	|id = split f g|
%
\just\equiv{ universal property }
%
        |lcbr(
		p1 . id = f
	)(
		p2 . id = g
	)|
%
\just\equiv{ identity }
%
        |lcbr(
		p1 = f
	)(
		p2 = g
	)|
\qed
\end{eqnarray*}

Os diagramas podem ser produzidos recorrendo ?? \emph{package} \LaTeX\
\href{https://ctan.org/pkg/xymatrix}{xymatrix}, por exemplo:
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Nat0|
           \ar[d]_-{|cataNat g|}
&
    |1 + Nat0|
           \ar[d]^{|id + (cataNat g)|}
           \ar[l]_-{|inNat|}
\\
     |B|
&
     |1 + B|
           \ar[l]^-{|g|}
}
\end{eqnarray*}

\section{Programa????o din??mica por recursividade m??ltipla}\label{sec:recmul}
Neste anexo d??o-se os detalhes da resolu????o do Exerc??cio \ref{ex:exp} dos apontamentos da
disciplina\footnote{Cf.\ \cite{Ol18}, p??gina \pageref{ex:exp}.},
onde se pretende implementar um ciclo que implemente
o c??lculo da aproxima????o at?? |i=n| da fun????o exponencial $exp\ x = e^x$,
via s??rie de Taylor:
\begin{eqnarray}
	exp\ x
& = &
	\sum_{i=0}^{\infty} \frac {x^i} {i!}
\end{eqnarray}
Seja $e\ x\ n = \sum_{i=0}^{n} \frac {x^i} {i!}$ a fun????o que d?? essa aproxima????o.
?? f??cil de ver que |e x 0 = 1| e que $|e x (n+1)| = |e x n| + \frac {x^{n+1}} {(n+1)!}$.
Se definirmos $|h x n| = \frac {x^{n+1}} {(n+1)!}$ teremos |e x| e |h x| em recursividade
m??tua. Se repetirmos o processo para |h x n| etc obteremos no total tr??s fun????es nessa mesma
situa????o:
\begin{spec}
e x 0 = 1
e x (n+1) = h x n + e x n

h x 0 = x
h x (n+1) = x/(s n) * h x n

s 0 = 2
s (n+1) = 1 + s n
\end{spec}
Segundo a \emph{regra de algibeira} descrita na p??gina \ref{pg:regra} deste enunciado,
ter-se-??, de imediato:
\begin{code}
e' x = prj . for loop init where
     init = (1,x,2)
     loop(e,h,s)=(h+e,x/s*h,1+s)
     prj(e,h,s) = e
\end{code}

\section{C??digo fornecido}\label{sec:codigo}

\subsection*{Problema 1}

\begin{code}
expd :: Floating a => a -> a
expd = Prelude.exp

type OutExpAr a = Either () (Either a (Either (BinOp, (ExpAr a, ExpAr a)) (UnOp, ExpAr a)))
\end{code}

\subsection*{Problema 2}
Defini????o da s??rie de Catalan usando factoriais (\ref{eq:cat}):
\begin{code}
catdef n = div (fac((2*n))) ((fac((n+1))*(fac n)))
\end{code}
Or??culo para inspec????o dos primeiros 26 n??meros de Catalan\footnote{Fonte:
\catalan{Wikipedia}.}:
\begin{code}
oracle = [
    1, 1, 2, 5, 14, 42, 132, 429, 1430, 4862, 16796, 58786, 208012, 742900, 2674440, 9694845,
    35357670, 129644790, 477638700, 1767263190, 6564120420, 24466267020,
    91482563640, 343059613650, 1289904147324, 4861946401452
    ]
\end{code}

\subsection*{Problema 3}
Algoritmo:
\begin{spec}
deCasteljau :: [NPoint] -> OverTime NPoint
deCasteljau [] = nil
deCasteljau [p] = const p
deCasteljau l = \pt -> (calcLine (p pt) (q pt)) pt where
  p = deCasteljau (init l)
  q = deCasteljau (tail l)
\end{spec}
Fun????o auxiliar:
\begin{spec}
calcLine :: NPoint -> (NPoint -> OverTime NPoint)
calcLine [] = const nil
calcLine(p:x) = curry g p (calcLine x) where
   g :: (Rational, NPoint -> OverTime NPoint) -> (NPoint -> OverTime NPoint)
   g (d,f) l = case l of
       []     -> nil
       (x:xs) -> \z -> concat $ (sequenceA [singl . linear1d d x, f xs]) z
\end{spec}
2D:
\begin{code}
bezier2d :: [NPoint] -> OverTime (Float, Float)
bezier2d [] = const (0, 0)
bezier2d l = \z -> (fromRational >< fromRational) . (\[x, y] -> (x, y)) $ ((deCasteljau l) z)
\end{code}
Modelo:
\begin{code}
data World = World { points :: [NPoint]
                   , time :: Float
                   }
initW :: World
initW = World [] 0

tick :: Float -> World -> World
tick dt world = world { time=(time world) + dt }

actions :: Event -> World -> World
actions (EventKey (MouseButton LeftButton) Down _ p) world =
  world {points=(points world) ++ [(\(x, y) -> map toRational [x, y]) p]}
actions (EventKey (SpecialKey KeyDelete) Down _ _) world =
    world {points = cond (== []) id init (points world)}
actions _ world = world

scaleTime :: World -> Float
scaleTime w = (1 + cos (time w)) / 2

bezier2dAtTime :: World -> (Float, Float)
bezier2dAtTime w = (bezier2dAt w) (scaleTime w)

bezier2dAt :: World -> OverTime (Float, Float)
bezier2dAt w = bezier2d (points w)

thicCirc :: Picture
thicCirc = ThickCircle 4 10

ps :: [Float]
ps = map fromRational ps' where
  ps' :: [Rational]
  ps' = [0, 0.01..1] -- interval
\end{code}
Gloss:
\begin{code}
picture :: World -> Picture
picture world = Pictures
  [ animateBezier (scaleTime world) (points world)
  , Color white . Line . map (bezier2dAt world) $ ps
  , Color blue . Pictures $ [Translate (fromRational x) (fromRational y) thicCirc | [x, y] <- points world]
  , Color green $ Translate cx cy thicCirc
  ] where
  (cx, cy) = bezier2dAtTime world
\end{code}
Anima????o:
\begin{code}
animateBezier :: Float -> [NPoint] -> Picture
animateBezier _ [] = Blank
animateBezier _ [_] = Blank
animateBezier t l = Pictures
  [ animateBezier t (init l)
  , animateBezier t (tail l)
  , Color red . Line $ [a, b]
  , Color orange $ Translate ax ay thicCirc
  , Color orange $ Translate bx by thicCirc
  ] where
  a@(ax, ay) = bezier2d (init l) t
  b@(bx, by) = bezier2d (tail l) t
\end{code}
Propriedades e \emph{main}:
\begin{code}
runBezier :: IO ()
runBezier = play (InWindow "B??zier" (600, 600) (0,  0))
  black 50 initW picture actions tick

runBezierSym :: IO ()
runBezierSym = quickCheckWith (stdArgs {maxSize = 20, maxSuccess = 200} ) prop_bezier_sym
\end{code}

Compila????o e execu????o dentro do interpretador:\footnote{Pode ser ??til em testes
envolvendo \gloss{Gloss}. Nesse caso, o teste em causa deve fazer parte de uma fun????o
|main|.}
\begin{code}
main = runBezier

run = do { system "ghc cp2021t" ; system "./cp2021t" }
\end{code}

\subsection*{QuickCheck}
C??digo para gera????o de testes:
\begin{code}
instance Arbitrary UnOp where
  arbitrary = elements [Negate, E]

instance Arbitrary BinOp where
  arbitrary = elements [Sum, Product]

instance (Arbitrary a) => Arbitrary (ExpAr a) where
  arbitrary = do
    binop <- arbitrary
    unop  <- arbitrary
    exp1  <- arbitrary
    exp2  <- arbitrary
    a     <- arbitrary

    frequency . map (id >< pure) $ [(20, X), (15, N a), (35, Bin binop exp1 exp2), (30, Un unop exp1)]


infixr 5 .=?=.
(.=?=.) :: Real a => a -> a -> Bool
(.=?=.) x y = (toRational x) == (toRational y)


\end{code}

\subsection*{Outras fun????es auxiliares}
%----------------- Outras defini????es auxiliares -------------------------------------------%
L??gicas:
\begin{code}
infixr 0 .==>.
(.==>.) :: (Testable prop) => (a -> Bool) -> (a -> prop) -> a -> Property
p .==>. f = \a -> p a ==> f a

infixr 0 .<==>.
(.<==>.) :: (a -> Bool) -> (a -> Bool) -> a -> Property
p .<==>. f = \a -> (p a ==> property (f a)) .&&. (f a ==> property (p a))

infixr 4 .==.
(.==.) :: Eq b => (a -> b) -> (a -> b) -> (a -> Bool)
f .==. g = \a -> f a == g a

infixr 4 .<=.
(.<=.) :: Ord b => (a -> b) -> (a -> b) -> (a -> Bool)
f .<=. g = \a -> f a <= g a

infixr 4 .&&&.
(.&&&.) :: (a -> Bool) -> (a -> Bool) -> (a -> Bool)
f .&&&. g = \a -> ((f a) && (g a))
\end{code}

%----------------- Solu????es dos alunos -----------------------------------------%

\section{Solu????es dos alunos}\label{sec:resolucao}
Os alunos devem colocar neste anexo as suas solu????es para os exerc??cios
propostos, de acordo com o "layout" que se fornece. N??o podem ser
alterados os nomes ou tipos das fun????es dadas, mas pode ser adicionado
texto, disgramas e/ou outras fun????es auxiliares que sejam necess??rias.

Valoriza-se a escrita de \emph{pouco} c??digo que corresponda a solu????es
simples e elegantes.

\subsection*{Problema 1} \label{pg:P1}
S??o dadas:
\begin{code}
cataExpAr g = g . recExpAr (cataExpAr g) . outExpAr
anaExpAr g = inExpAr . recExpAr (anaExpAr g) . g
hyloExpAr h g = cataExpAr h . anaExpAr g

eval_exp :: Floating a => a -> (ExpAr a) -> a
eval_exp a = cataExpAr (g_eval_exp a)

optmize_eval :: (Floating a, Eq a) => a -> (ExpAr a) -> a
optmize_eval a = hyloExpAr (gopt a) clean

sd :: Floating a => ExpAr a -> ExpAr a
sd = p2 . cataExpAr sd_gen

ad :: Floating a => a -> ExpAr a -> a
ad v = p2 . cataExpAr (ad_gen v)
\end{code}
Definir:

\begin{code}
outExpAr X = i1 ()
outExpAr (N a) = i2 (i1 (a))
outExpAr (Bin op a b) = i2 (i2 (i1 (op,(a,b))))
outExpAr (Un op a) = i2 (i2 (i2 (op,a))) 
---
recExpAr h = id -|- (id -|- (id >< (h >< h) -|- id >< h))
---
g_eval_exp a = either (const a) nums where
               nums = either numb ops
               ops = either bins uns
               numb b = b 
               bins (Sum, (a,b)) = a+b
               bins (Product, (a,b)) = a*b 
               uns (Negate, a) = a*(-1)
               uns (E, a) = Prelude.exp a 
---
clean X = outExpAr X
clean (N a) = outExpAr (N a)
clean (Bin Sum a b) = outExpAr (Bin Sum a b)
clean (Bin Product (N 0) b) = outExpAr (N 0)
clean (Bin Product a (N 0)) = outExpAr (N 0) 
clean (Bin Product a b) = outExpAr (Bin Product a b)
clean (Un Negate a) = outExpAr (Un Negate a)
clean (Un E (N 0) ) = outExpAr (N 1)
clean (Un E a) = outExpAr (Un E a)

---
gopt a = g_eval_exp a
\end{code}

\begin{code}
sd_gen :: Floating a =>
    Either () (Either a (Either (BinOp, ((ExpAr a, ExpAr a), (ExpAr a, ExpAr a))) (UnOp, (ExpAr a, ExpAr a)))) -> (ExpAr a, ExpAr a)
sd_gen = either derivx nums where
          nums = either numb ops
          ops = either bins uns
          derivx () = ( X, N 1)
          numb b = (N b, N 0)
          bins (Sum, ((a1,a2), (b1,b2))) = (Bin Sum a1 b1,Bin Sum a2 b2)
          bins (Product, ((a1, a2), (b1,b2))) = (Bin Product a1 b1,Bin Sum (Bin Product a1 b2) (Bin Product a2 b1))
          uns (E, (a,b)) = (Un E a, Bin Product (Un E a) b)
          uns (Negate, (a,b)) = (Un Negate a, Un Negate b)
\end{code}

\begin{code}
ad_gen v = either derivx nums where
          nums = either numb ops
          ops = either bins uns
          derivx () = (v, 1)
          numb b = (b, 0)
          bins (Sum, ((a1, a2),(b1,b2))) = (a1 + b1, a2 + b2)
          bins (Product, ((a1,a2), (b1,b2))) = (a1*b1, (a1*b2) + (a2 * b1))
          uns (E, (a,b)) = (Prelude.exp a, b*(Prelude.exp a))
          uns (Negate, (a, b)) = (a *(-1), b*(-1))
\end{code}

Al??nea 1
Resolu????o
\\
Alinea 1:
\\
Sabemos que por se tratar de um isomorfismo, $|outExpAr . inExpAr = id|$, logo temos:
\begin{eqnarray*}
\start
  |outExpAr . inExpAr =id|
%
\just\equiv{ Def-inExpAr, Reflex??o-+, Fus??o-+ }
%
  |[outExpAr . (const X), outExpAr . num_ops] = [i1, i2]|
%
\just\equiv{ Eq-+, Def-|num_ops|, Natural-id }
%
        |lcbr(
        outExpAr . (const X) = i1
    )(
        outExpAr . [N, ops] = i2 . id
    )|  
%
\just\equiv{ Reflex??o-+, Fus??o-+ aplicada 2 vezes }
%
\left\{
   \begin{array}{lll}
      |outExpAr . (const X) = i1|\\
      |[outExpAr . N, outExpAr . ops] = [i2 . i1, i2 . i2]|
  \end{array}
\right.
%
\just\equiv{ Eq-+, Def-|ops|, Natural-id }
%
\left\{
   \begin{array}{lll}
      |outExpAr . (const X) = i1|\\
      |outExpAr . N = i2 . i1|\\
      |outExpAr . [bin, (uncurry Un)] = i2 . i2 . id|
  \end{array}
\right.
%
\just\equiv{Reflex??o-+, Fus??o-+ aplicada 2 vezes}
%
\left\{
   \begin{array}{lll}
      |outExpAr . (const X) = i1|\\
      |outExpAr . N = i2 . i1|\\
      |[outExpAr . bin, outExpAr . (uncurry Un)] = [i2 . i2 . i1, i2 . i2 . i2] |
  \end{array}
\right.
%
\just\equiv{Eq-+}
%
\left\{
   \begin{array}{lll}
      |outExpAr . (const X) = i1|\\
      |outExpAr . N = i2 . i1|\\
      |outExpAr . bin = i2 . i2 . i1|\\
      |outExpAr . (uncurry Un) = i2 . i2 . i2|
  \end{array}
\right.
%
\just\equiv{ Igualdade Extensional}
%
\left\{
   \begin{array}{lll}
      |outExpAr . (const X) () = i1 ()|\\
      |outExpAr . N a = i2 . i1 a|\\
      |outExpAr . bin (op, (a, b))= i2 . i2 . i1 (op, (a, b))|\\
      |outExpAr . (uncurry Un) (op, a)= i2 . i2 . i2 (op, a)|
  \end{array}
\right.
%
\just\equiv{ Def-const, Def-Comp, Def-|bin|, Def-uncurry}
%
\left\{
   \begin{array}{lll}
      |outExpAr (const X) = i1 ()|\\
      |outExpAr (N a) = i2 (i1 (a))|\\
      |outExpAr (Bin op a b) = i2 (i2 (i1 (op, (a, b))))|\\
      |outExpAr (Un op a) = i2 (i2 (i2 (op, a)))|
  \end{array}
\right.
\end{eqnarray*}
Sabendo que $|recExpAr|$ ir?? aplicar uma fun????o que recebe como argumento a todos os elementos que resultam de $|outExpAr|$
Assim, a partir de $|baseExpAr|$ e do sseguinte diagrama:
\begin{eqnarray*}
\xymatrix@@C=2cm{
{|ExpAr a|} \ar@@/^2pc/[rr]^-{outExpAr} & {\cong} & {1 + (a + ((BinOp |><| |ExpAr a| ^ 2) + (|UnOp >< ExpAr a|) ))} \ar@@/^2pc/[ll]^-{inExpAr}
}
\end{eqnarray*}
Temos que:
\begin{eqnarray*} 
recExpAr f = |id + id + id >< |f^2 + | id >< f |
\end{eqnarray*}
\\ \\
Al??nea 2:
\\
(Nas al??neas seguintes |ExpAr a| ser?? substituido por |ExpAr| apenas por simplifica????o)
\\Sabendo que a fun????o $|g_eval_exp|$ se trata do gene do catamorfismo $|eval_exp|$ que tem como objetivo calcular o valor de uma $|ExpAr|$ (dado um valor para substituir a incognita), tendo ainda em conta a defini????o de $|recExpAr|$ temos o diagrama:
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |ExpAr|
           \ar[d]_-{|eval_exp|}
&
    |1 + (Nat0 + ((BinOp >< ExpAr >< ExpAr) + (UnOp >< ExpAr) ))|
           \ar[d]^{|id + (id + (id >< eval_exp >< eval_exp + id >< eval_exp))|}
           \ar[l]_-{|inExpAr|}
\\
     |a|
&
     |1 + (a + ((BinOp >< a >< a) + (UnOp >< a) ))|
           \ar[l]^-{|g_eval_exp|}
}
\end{eqnarray*}
Assim, prevendo as hipoteses existentes, temos que um |BinOp| pode corresponder a uma soma ou a um produto e que um |UnOp| pode corresponder a um |Negate| ou a um |E|, tendo em conta as propriedades do calculo a que correspondem estas express??es teremos que o gene de |eval_exp| ser??:
\begin{spec}
g_eval_exp a = [ const a, [numb, [bins, uns]]]
\end{spec}
Com |numb|, |bins| e |uns|, que devolvem o valor de um numero b, o resultado de uma opera????o bin??ria e o resultado de uma opera????o un??ria respetivamente.
\\ \\
Alinea 3:
\\
Nesta al??nea pede-se que se implemente os genes da fun????o |optimize_eval| que t??m como objetivo calcular o valor de uma express??o mas de uma forma mais eficiente.
Sendo |clean| o gene do anamorfismo respons??vel por limpar os casos em que ocorre um elemento absorvente da opera????o e |gopt| o gene do catamorfismo respons??vel por calcular o valor de uma express??o temos os diagramas:
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |ExpAr|
           \ar[d]_-{|ana clean|}
           \ar[r]_-{|clean|}
&
    |1 + (a + ((BinOp >< ExpAr >< ExpAr) + (UnOp >< ExpAr) ))|
           \ar[d]^{|id + (id + (id >< (ana clean) >< (ana clean) + id >< (ana clean)))|}
\\
     |ExpAr|
           \ar[r]^-{|outExpAr|} 
&
     |1 + (a + ((BinOp >< ExpAr >< ExpAr) + (UnOp >< ExpAr) ))| 
}
\end{eqnarray*}
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |ExpAr|
           \ar[d]_-{|cata gopt|}
&
    |1 + (Nat0 + ((BinOp >< ExpAr >< ExpAr) + (UnOp >< ExpAr) ))|
           \ar[d]^{|id + (id + (id >< cata gopt >< cata gopt + id >< cata gopt))|}
           \ar[l]_-{|inExpAr|}
\\
     |a|
&
     |1 + (a + ((BinOp >< a >< a) + (UnOp >< a) ))|
           \ar[l]^-{|gopt|}
}
\end{eqnarray*}
Assim sendo |clean| poder?? ser definida usando |outExpAr|.
Tendo todas estas situa????es em conta, sabendo que o elemento absorvente da multiplica????o ?? 0 e sabendo ainda que ${|e|^0}$ ?? sempre igual a 1 a fun????o clean ir?? abordar estas situa????es, nas restantes ir?? aplicar apenas a fun????o |outExpAr|.

J?? a |cata gopt| ter?? uma fun????o semelhante ?? de |eval_exp|, calcular o valor de uma |ExpAr|, logo podemos definir |gopt| como sendo igual a |g_eval_exp|.
\\ \\
Al??nea 4
\\
Nesta al??nea pretende-se definir o gene do catamorfismo de |sd| que tem como objetivo calcular a derivada de uma express??o.
Sabemos que, de acordo com as regras das derivadas por vezes vamos precisar da express??o original (isto ??, n??o derivada) para aplicar outras leis de deriva????o. 
Para isso pretende-se, ao calcular a derivada de uma express??o, possibilitar o acesso ?? express??o original, usando-se para isso, tal como sugerido pela forma como |sd| ?? definido no enunciado, um split em que o lado esquerdo corresponde ?? express??o original e o direito ?? derivada.
Assim, temos o diagrama:
\begin{eqnarray*}
\xymatrix@@C=1cm{
    |ExpAr|
           \ar[d]_-{|cata sd_gen|}
&
    |1 + (a + ((BinOp >< ExpAr >< ExpAr) + (UnOp >< ExpAr) ))|
           \ar[d]^{|id + (id + (id >< cata sd_gen >< cata sd_gen + id >< cata sd_gen))|}
           \ar[l]_-{|inExpAr|}
\\
     {|ExpAr|^2}
&
     {1 + (a + ((BinOp |><| |(ExpAr)|^2 |><| |(ExpAr)|^2 ) + (UnOp |><| |(ExpAr)|^2) ))}
           \ar[l]^-{|sd_gen|}
}
\end{eqnarray*}
Daqui temos:
\begin{spec}
sd_gen = [ derivx, [numb, [bins, uns]]]
\end{spec}
Assim, tendo em conta as regras de deriva????o para as diferentes opera????es chegamos ?? defini????o apresentada.
Com |derivx| a calcular a derivada de uma incognita, |numb| a calcular a derivada de um numero |a|, |bins| e |uns| a calcularem a derivada das express??es bin??rias e un??rias associadas ao tipo |ExpAr|.
\\ \\
Alinea 5
\\
Por fim pede-se para determinar o gene do catamorfismo que calcula o valor (numerico) da derivada de uma express??o.
De forma semelhante ?? alinea anterior ?? necess??rio guardar tamb??m o valor original da express??o derivada e ao mesmo tempo o valor da derivada.
Assim temos o diagrama:
\begin{eqnarray*}
\xymatrix@@C=1cm{
    |ExpAr|
           \ar[d]_-{|cata ad_gen|}
&
    |1 + (a + ((BinOp >< ExpAr >< ExpAr) + (UnOp >< ExpAr) ))|
           \ar[d]^{|id + (id + (id >< cata ad_gen >< cata ad_gen + id >< cata ad_gen))|}
           \ar[l]_-{|inExpAr|}
\\
     {|a|^2}
&
     {1 + (a + ((BinOp |><| |a|^2 |><| |a|^2 ) + (UnOp |><| |a|^2) ))}
           \ar[l]^-{|ad_gen|}
}
\end{eqnarray*}
Temos ainda:
\begin{spec}
sd_gen = [ derivx, [numb, [bins, uns]]]
\end{spec}
Mais uma vez, tendo em conta as regras de deriva????o e que $|ad = p2 . cataExpAr ad_gen|$ chegamos ?? solu????o apresentada
em que |derivx| calcula o valor da derivada de |()| que representa uma incogmita, |numb| calcula o valor da derivada de um numero |a| e |bins| e |uns| calculam o valor da derivada das express??es bin??rias e un??rias associadas ao tipo |ExpAr| da forma que ?? apresentado (mantendo sempre o valor da express??o original de forma a estar acessivel).

\subsection*{Problema 2}
Definir
\begin{code}
loop (a, b, c) = (quot (a*b) c, b+4, c+1)
inic = (1, 2, 2)
prj (a, b, c) = a
\end{code}
por forma a que
\begin{code}
cat = prj . (for loop inic)
\end{code}
seja a fun????o pretendida.
\textbf{NB}: usar divis??o inteira.
Apresentar de seguida a justifica????o da solu????o encontrada. 
\\ \\
Defini????o do n??mero $n$ de Catalan:
\begin{eqnarray*}
    catal(n) = \frac{(2n)!}{(n+1)! (n!) }
\end{eqnarray*}
Temos de imediato que $catal(0) = 1$. Devemos agora calcular $catal(n)$ como uma recurs??o, para podermos aplicar a \emph{regra de algibeira} fornecida. Calculemos, ent??o:
\begin{quote}
    $\frac{catal(n+1)}{catal(n)} 
    =
    \frac{\frac{(2(n+1))!}{((n+1)+1)! (n+1)!}} {\frac{(2n)!}{(n+1)! (n!) }}
    =
    \frac{(2n+2)!(n!)}{(n+2)!(2n)!}
    =
    \frac{(2n+2)(2n+1)(2n)!(n!)}{(n+2)(n+1)(n!)(2n)!}
    =
    \frac{2(n+1)(2n+1)}{(n+2)(n+1)}
    = 
    \frac{4n+2}{n+2}$
\end{quote}
Logo
\begin{eqnarray*}
    catal(n+1) = \frac{4n+2}{n+2} catal(n)
\end{eqnarray*}
Temos, ent??o, a fun????o auxiliar $c(n) = \frac{4n+2}{n+2}$. Podemos decompor $c$ em duas fun????es, $c1$ e $c2$, tais que: $c1(n) = 4n+2$ e $c2(n) = n+2$. Assim decomposta, ?? muito simples exprimir $c1$ e $c2$ ?? custa de si mesmas. Daqui, temos $c1(0) = c2(0) = 2$, $c1(n+1) = 4+c1(n)$ e $c2(n+1) = 1+c2(n)$.

\begin{spec}
catal 0 = 1
catal (n+1) = c1(n) catal(n) / c2(n)


c1 0 = 2
c1 (n+1) = 4+c1(n)


c2 0 = 2
c2(n+1) = 1+c2(n)
\end{spec}
Assim, estamos em condi????es de aplicar a \emph{regra}, onde $inic = (1, \ \ 2, \ \ 2)$ e $loop (catal, \ c1, \ c2) = (quot \ (catal \cdot c1) \ \ c2, \ 4+c1, \ 1+c2)$.

\subsection*{Problema 3}

\begin{code}
calcLine :: NPoint -> (NPoint -> OverTime NPoint)
calcLine x1 x2 t = cataList h list where
   h = either nil (cons . (ul1d t >< id))
   list = zip x1 x2
   ul1d t p = (uncurry linear1d p) t

deCasteljau :: [NPoint] -> OverTime NPoint
deCasteljau [] _ = []
deCasteljau l t = hyloAlgForm alg coalg l where
   coalg = divide
   alg = either id aux
   aux (a,b) = calcLine a b t
   divide [x] = i1 x
   divide l = i2 (init l, tail l)

hyloAlgForm = hyloLTree
\end{code}

Comecemos por simplificar a fun????o fornecida $calcLine$, de modo a chegar a uma fun????o equivalente mas mais simples, tornando o algoritmo em quest??o mais expl??cito.
Temos:
\begin{spec}
calcLine :: NPoint -> (NPoint -> OverTime NPoint)
calcLine [] = const nil
calcLine(p:x) = curry g p (calcLine x) where
   g :: (Rational, NPoint -> OverTime NPoint) -> (NPoint -> OverTime NPoint)
   g (d,f) l = case l of
       []     -> nil
       (x:xs) -> \z -> concat $ (sequenceA [singl . linear1d d x, f xs]) z
\end{spec}

Podemos, ent??o, eliminar a fun????o auxiliar $g$ (ajustando nomes de vari??veis):

\begin{spec}
calcLine :: NPoint -> (NPoint -> OverTime NPoint)
calcLine [] = const nil
calcLine(x1h:x1t) = \x2 t -> case x2 of
                  [] -> nil t
                  x2h:x2t -> concat $ (sequenceA [singl . linear1d x1h x2h, calcLine x1t x2t]) t
\end{spec}

Usando a defini????o de $sequenceA$, esta ??ltima linha fica da seguinte forma:
\begin{spec}
                  x2h:x2t -> concat [singl . linear1d x1h x2h t, calcLine x1t x2t t]
\end{spec}

Nesta situa????o, estamos a concatenar uma lista de um s?? elemento com uma outra, pelo que temos:
\begin{spec}
                   x2h:x2t -> cons (linear1d x1h x2h t, calcLine x1t x2t t)
\end{spec}

Daqui, observamos que existem duas listas (em que cada uma representa um ponto) a serem consumidas em simult??neo. Isto porque a interpola????o linear entre dois pontos s?? faz sentido para pontos com a mesma dimens??o, ou seja, $length \ x1 == length \ x2$.
No catamorfismo de listas, temos uma ??nica lista a ser consumida. Para contornar este problema, podemos usar a fun????o pr??-definida do \Haskell \ $zip$, cuja assinatura ??:
\begin{spec}
zip :: [a] -> [b] -> [(a, b)]
\end{spec} 

Isto ?? poss??vel porque as coordenadas correspondentes entre os dois pontos est??o em posi????es iguais da respetiva lista. Portanto, em conformidade com o tipo de sa??da de $zip$, o catamorfismo em quest??o ?? aplicado a uma lista de pares. Como $NPoint$ ?? uma lista de |Rational|, ser??o pares de |Rational|.

\begin{eqnarray*}
\xymatrix@@C=3cm@@R=2cm{
    {A^*}
           \ar[d]_-{|cata h|}
           \ar@@/^/[r]^{outList}
&
    |1 + A ><| {A^*}
           \ar@@/^/[l]_{\cong}^{inList}
           \ar[d]^{|id + id >< (cata h)|}
\\
     |B|
&
     |1 + A >< B|
           \ar@@/^/[l]^-{|h|}
}
\end{eqnarray*}

J?? vimos que $A$ ser?? instanciando como |Rational >< Rational|, e pelo tipo de sa??da da fun????o $calcLine$ temos que $B$ ?? um $NPoint$, ou seja, $|Rational|^*$. Resta-nos calcular o gene $h$.

Para o caso da esquerda, respeitando a fun????o dada, teremos $nil$. No caso da direita, temos o par cabe??a e a cauda, j?? processada pelo algoritmo. Como $calcLine$ devolve um $NPoint$, devemos calcular a interpola????o linear da cabe??a usando a fun????o $linear1d$ (\emph{uncurried}) e usar $cons$ para a colocar na lista resultado. De notar ainda que $linear1d$ tem um par??metro de entrada extra e portanto teremos de definir uma fun????o auxiliar. Logo:
\begin{spec}
  h = either nil (cons . (ul1d t >< id)) 
  where ul1d t p = (uncurry linear1d p) t
\end{spec} 

Ent??o:
\begin{eqnarray*}
\xymatrix@@C=3.5cm@@R=2cm{
    {(|Rational >< Rational|)^*}
           \ar[d]_-{|cata (either nil (cons . (ul1d t) >< id)) |}
           \ar@@/^/[r]^{outList}
&
    |1 + (Rational >< Rational) ><| {(|Rational >< Rational|)^*}
           \ar@@/^/[l]_{\cong}^{inList}
           \ar[d]^{|id + id >< cata (either nil (cons . (ul1d t) >< id))|}
\\
     {|Rational|^*}
&
     |1 + (Rational >< Rational) >< | {|Rational|^*}
           \ar@@/^/[l]^-{|either nil (cons . (ul1d t) >< id)|}
}
\end{eqnarray*}

Temos, assim, a defini????o de $calcLine$ como um catamorfismo de listas.
\begin{spec}
calcLine :: NPoint -> (NPoint -> OverTime NPoint)
calcLine x1 x2 t = cataList h list where
   h = either nil (cons . (ul1d t >< id))
   list = zip x1 x2
   ul1d t p = (uncurry linear1d p) t
\end{spec}

O algoritmo $deCasteljau$ fornecido trata-se de um algoritmo do g??nero \emph{divide and conquer}, em que, para uma lista com um s?? elemento, o resultado ?? o elemento solit??rio da lista; para os restantes casos, ou seja, listas de $N$ elementos, $\forall N>1$, a fun????o ?? chamada recursivamente para os primeiros $N-1$ e para os ??ltimos $N-1$ elementos. O resultado de cada uma destas chamadas ?? depois calculado pela fun????o $calcLine$. Nas aulas, foi estudado um algoritmo em tudo muito semelhante a este. Trata-se do \emph{mergeSort}:
\begin{spec}
mSort :: Ord a => [a] -> [a]
mSort [] = []
mSort l = hyloLTree (either singl merge) lsplit l

merge (l,[])                  = l
merge ([],r)                  = r
merge (x:xs,y:ys) 
                  | x < y     = x : merge(xs,y:ys) 
                  | otherwise = y : merge(x:xs,ys)

lsplit [x] = i1 x
lsplit l   = i2 (sep l) where
     sep []    = ([],[])
     sep (h:t) = let (l,r) = sep t in (h:r,l)
\end{spec}

Podemos adapt??-lo para o problema em quest??o. Desde j??, sabemos que o hilomorfismo a ser usado ser?? o hilomorfismo das \LTree. O gene do anamorfismo, como podemos observar, trata da parte \emph{divide} do algoritmo. Como dissemos anteriormente, usamos a chamada recursiva para os primeiros e para os ??ltimos $N-1$ elementos. Vamos ent??o defini-lo:
\begin{spec}
coalg = divide
divide [x] = i1 x
divide l = i2 (init l, tail l)
\end{spec}

Agora, devemos encontrar o gene do catamorfismo. Para o caso em que o anamorfismo injeta ?? esquerda, temos um elemento solit??rio. Ora, para esse caso est?? trivialmente calculado o ponto a retornar (?? o pr??prio ponto), logo usamos a fun????o identidade. J?? para o caso da direita, temos um par de pontos, resultantes da chamada recursiva do algoritmo para parte inicial e para a parte final da lista. A fun????o recebe ainda um par??metro extra, por isso usamos uma fun????o auxiliar:
\begin{spec}
alg = either id aux
aux (a,b) = calcLine a b t
\end{spec}

Assim, temos a solu????o para listas n??o vazias. Resta-nos o caso da lista vazia, que, respeitando o algoritmo, ?? a pr??pria lista vazia:
\begin{spec}
deCasteljau :: [NPoint] -> OverTime NPoint
deCasteljau [] _ = []
deCasteljau l t = hyloAlgForm alg coalg l where
   coalg = divide
   alg = either id aux
   aux (a,b) = calcLine a b t
   divide [x] = i1 x
   divide l = i2 (init l, tail l)
\end{spec}

\subsection*{Problema 4}
Solu????o para listas n??o vazias:
\begin{code}
avg = p1.avg_aux
\end{code}

\begin{code}
inNL = either singl cons
outNL[a] = i1(a)
outNL(a:x) = i2(a,x)  
cataNL g = g . recList(cataNL g) . outNL
avg_aux = cataNL(either f g)
  where f = split id (const 1)
        g = split av len
        av(a,(b, c)) = (a + c * b) / (c + 1)
        len(a, (b, c)) = c + 1
\end{code}
Solu????o para ??rvores de tipo \LTree:
\begin{code}
avgLTree = p1.cataLTree gene where
   gene = either f g
    where f = split id (const 1)
          g = split av len
          av((a, b), (c, d)) = (a * b + c * d) / (b + d)
          len((a, b), (c, d)) = b + d
\end{code}
Resolu????o:
\\ 
Al??nea 1.
\\
A partir dos dados do problema, podemos inferir o seguinte diagrama:
\begin{eqnarray*}
\xymatrix@@C=2cm{
    {T}
           \ar[d]_-{|cata g|}
           \ar@@/^/[r]^{outNL}
&
    {|F| {T}}
           \ar@@/^/[l]_{\cong}^{inNL}
           \ar[d]^{|F (cata g)|}
\\
     {A}
&
     {|F| {A}}
           \ar@@/^/[l]^-{|F| {A}} 
}
\end{eqnarray*}
Como estamos perante listas n??o vazias, podemos tamb??m inferir ser?? que $|inNL = either singl cons|$, pois, os dois ??nicos casos poss??veis
de uma lista deste tipo ser??o ou termos um elemento da lista, ou termos uma lista completa.\\
Falta-nos, no entanto, inferir $|outNL|$, mas, j?? sabemos que, por se tratar de um isomorfismo, $|outNL . inNL = id|$, logo
de forma a obtermos $|outNL|$ vamos resolver essa equa????o:
\begin{eqnarray*}
\start
  |outNL . inNL = id|
%
\just\equiv{ Def-|inNL| }
  |out . [singl, cons] = id|
%
\just\equiv{ Fus??o-+ (lei 20) }
  |[out . singl, out . cons] = id|
%
\just\equiv{ Universal-+ (lei 17) with k = id, f = out . singl, g = out . cons}
%
        |lcbr(
    id . i1 = out . singl
  )(
    id . i2 = out . cons      
  )|
%
\just\equiv{ Natural-id (lei 1) aplicada 2 vezes }
        |lcbr(
    i1 = out . singl      
  )(
    i2 = out . cons      
  )|
%
\just\equiv{ Igualdade Extensional (lei 71) }
        |lcbr(
    (out . singl) x = i1 x   
  )(
    (out . cons) x = i2 x   
  )|
%
\just\equiv{ Def-Comp (lei 72) aplicada 2 vezes }
        |lcbr(
     out(singl x) = i1 x     
    )(
     out(cons (h, t)) = i2 (h, t)     
    )|
%
\just\equiv{ Def-singl, Def-cons }
        |lcbr(
     out[x] = i1 x   
        )(
     out(h:t) = i2 (h, t)     
        )|
\end{eqnarray*}
Tendo j?? definido $|inNL|$ e $|outNL|$, vamos agora procurar conhecer o catamorfismo.\\
Sabemos de antem??o que o comprimento da lista ser?? um natural positivo ou zero e que a m??dia
?? um racional/double. Ent??o podemos construir o seguinte diagrama:
\begin{eqnarray*}
\xymatrix@@C=2cm{
    {L}
           \ar[d]_-{|cata g|}
           \ar@@/^/[r]^{outNL}
&
    {|A + A >< L|}
           \ar@@/^/[l]_{\cong}^{inNL}
           \ar[d]^{|id + id >< (cata g)|}
\\
     {|(Rational, Nat0)|}
&
     {|A + A >< (Rational, Nat0)|}
           \ar@@/^/[l]^-{g} 
}
\end{eqnarray*}
Podemos ent??o observar que $|(cata g) = g . (id + id >< (cata g)) . out|$ e que o functor deste
tipo de listas ?? dado por $|F f = id + id >< f|$.\\
Assim sendo, podemos ver que $|(cata g) = g . F (cata g) . out|$, o que, escrito em Haskell ?? dado
por $|cataNL = g . recList(cataNL g) . out|$.\\
Temos ent??o tudo o necess??rio para implementar a primeira al??nea sendo que $av$ faz o c??lculo da m??dia ponderada
at?? ao nodo atual, $len$ atualiza o comprimento da lista lido recursivamente, $a$ representa o valor
do nodo da lista atual, $b$ a m??dia calculada recursivamente e $c$ o comprimento da lista j?? lido.
\\ \\
Al??nea 2.
\\
Tendo em conta que o catamorfismo j?? se encontra definido, n??o ?? necess??rio calcul??-lo a ele, nem ao isomorfismo 
$in$/$out$, nem o functor. Logo, resta-nos apenas seguir a linha do pensamento anterior, para esta nova estrutura de dados.\\
Tal como na al??nea anterior, $av$ faz o c??lculo da m??dia ponderada at?? ao momento e $len$ atualiza o n??mero de valores lidos.
A diferen??a surge apenas nas vari??veis. Visto que estamos perante uma ??rvore, teremos de analisar dois lados ao inv??s de apenas um,
ent??o, como seria de esperar teremos duas vari??veis que representam as m??dias ponderadas at?? ao nodo atual, $a$ e $c$, e outras duas que
representam os tamanhos lidos recursivamente, $b$ e $d$.\\
\subsection*{Problema 5}
Inserir em baixo o c??digo \Fsharp\ desenvolvido, entre \verb!\begin{verbatim}! e \verb!\end{verbatim}!:

\begin{verbatim}
// (c) MP-I (1998/9-2006/7) and CP (2005/6-2016/7)

module BTree

open Cp

// (1) Datatype definition -----------------------------------------------------

type BTree<'a> = Empty | Node of 'a * (BTree<'a> * BTree<'a>)

let inBTree x = either (konst Empty) Node x

let outBTree x =
    match x with
    | Empty -> i1 ()
    | Node (a,(l,r)) -> i2 (a,(l,r))

// (2) Ana + cata + hylo -------------------------------------------------------

let baseBTree f g = id -|- (f >< (g >< g))

let recBTree g = baseBTree id g

let rec cataBTree g x = (g << (recBTree (cataBTree g)) << outBTree) x 

let rec anaBTree g x = (inBTree << (recBTree (anaBTree g)) << g) x

let hyloBTree c a x = ((cataBTree c) << (anaBTree a)) x

// (3) Map ---------------------------------------------------------------------

let fmap f t = cataBTree (inBTree << baseBTree f id) t

// (4) Examples ----------------------------------------------------------------

// (4.1) Inversion (mirror) ----------------------------------------------------

let invBTree t = cataBTree (inBTree << (id -|- (id >< swap))) t

// (4.2) Counting --------------------------------------------------------------

let countBTree x = cataBTree (either (konst 0) (succ << (uncurry (+)) << p2)) x

// (4.3) Serialization ---------------------------------------------------------
let singl x = [x]

let inord t =
    let join(x,(l,r)) = l @ (singl x) @ r
    in (either nil join) t

let inordt t = cataBTree inord t

let preord t =
    let f(x,(l,r)) = x :: l @ r
    in (either nil f) t

let preordt t = cataBTree preord t

let postord t =
    let f(x,(l,r)) = l @ r @ (singl x)
    in (either nil f) t

let postordt t = cataBTree postord t

// (4.4) Quicksort -------------------------------------------------------------

let app a l = a :: l

let rec part h t = //pivot / list
    match t with
    | [] -> ([],[])
    | x::xs -> if x < h then ((app x) >< id) (part h xs)
                        else (id >< (app x)) (part h xs)

let qsep list =
    match list with
    | [] -> i1 ()
    | h::t -> let (s,l) = part h t
              in i2 (h,(s,l))

let qSort x = hyloBTree inord qsep x

// (4.5) Traces ----------------------------------------------------------------

let rec union l1 l2 = 
    match l2 with
    | [] -> l1
    | h::t -> if List.exists (fun e -> e = h) l1 then union l1 t else union (l1 @ [h]) t

let tunion (a,(l,r)) = union (List.map (app a) l) (List.map (app a) r)

let traces x = (cataBTree (either (konst [[]]) tunion)) x

// (4.6) Towers of Hanoi -------------------------------------------------------

let strategy l =
    match l with
    | (d,0) -> i1 ()
    | (d,n) -> i2 ((n-1,d),((not d,n-1),(not d, n-1)))

let hanoi x = hyloBTree inord strategy x

// (5) Depth and balancing (using mutual recursion) --------------------------

let baldepth x = 
    let h (a,((b1,b2),(d1,d2))) = (b1 && b2 && abs(d1-d2)<=1, 1 + (max d1 d2))
    let f ((b1,d1),(b2,d2)) = ((b1,b2),(d1,d2))
    let g g1 = either (konst (true, 1)) (h << (id >< f)) g1
    in (cataBTree g) x

let balBTree x = (p1 << baldepth) x

let depthBTree x = (p2 << baldepth) x

// (6) Going polytipic -------------------------------------------------------

let tnat f x =
    let theta (a,b) = a @ b
    in  (either (konst []) (theta << (f >< theta))) x

let monBTree f a = cataBTree (tnat f) a

// alternative to (4.3) serialization ----------------------------------------

let preordt' t = monBTree singl t

// (7) Zipper ----------------------------------------------------------------

type Deriv<'a> = 
    | Dr of bool * ('a  * BTree<'a>)

type Zipper<'a> = List<Deriv<'a>>

let rec plug l t =
    match l with
    | [] -> t
    | (Dr (false,(a,l))::z)  -> Node (a,(plug z t,l))
    | (Dr (true,(a, r))::z)  -> Node (a,(r,plug z t)) 
\end{verbatim}

%----------------- Fim do anexo com solu????es dos alunos ------------------------%

%----------------- ??ndice remissivo (exige makeindex) -------------------------%

\printindex

%----------------- Bibliografia (exige bibtex) --------------------------------%

\bibliographystyle{plain}
\bibliography{cp2021t}

%----------------- Fim do documento -------------------------------------------%
\end{document}
