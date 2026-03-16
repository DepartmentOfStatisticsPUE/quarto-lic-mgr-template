# Szablon pracy dyplomowej UEP w Quarto

Szablon pracy licencjackiej/inżynierskiej/magisterskiej dla Uniwersytetu Ekonomicznego w Poznaniu, zgodny z **Zarządzeniem nr 92/2021 Rektora UEP**.

Repozytorium zawiera dwie wersje szablonu:

- `latex-template/` — oryginalny szablon LaTeX
- `quarto-template/` — szablon Quarto (z obsługą kodu R)

## Wymagania

- [Quarto](https://quarto.org/docs/get-started/) (>= 1.3)
- [R](https://cran.r-project.org/) (jeśli używasz kodu R w pracy)
- TeX Live lub TinyTeX z pakietami: `carlito`, `biblatex-apa`, `hyphen-polish`

### Instalacja pakietów TeX (TinyTeX)

```bash
quarto install tinytex
tlmgr install carlito biblatex-apa hyphen-polish
```

## Szybki start

1. Skopiuj folder `quarto-template/` jako nowy projekt
2. Edytuj `_quarto.yml` — uzupełnij swoje dane:

```yaml
book:
  title: "Tytuł pracy po polsku"
  author: "Imię Nazwisko"
  output-file: "nazwiskoNIUtyp"  # np. kowalska1234lic

title-en: "English title"
thesis-type: "Praca licencjacka"  # lub: Praca inżynierska / Praca magisterska
supervisor: "dr Jan Kowalski"
major: "Zarządzanie"
lang: pl  # lub: en
```

3. Pisz rozdziały jako pliki `.qmd` i dodawaj je do `chapters:` w `_quarto.yml`
4. Renderuj:

```bash
cd quarto-template
quarto render
```

Wynik: `_book/nazwiskoNIUtyp.pdf`

## Struktura szablonu

```
quarto-template/
├── _quarto.yml          # Konfiguracja projektu i metadane pracy
├── index.qmd            # Wstęp
├── rozdzial1.qmd        # Rozdział 1 (przykład z kodem R, wzorami, rysunkami)
├── rozdzial2.qmd        # Rozdział 2 (przykład z tabelami, cytowaniami)
├── bibliografia.bib     # Bibliografia
├── preamble.tex         # Ustawienia LaTeX (czcionka, marginesy, nagłówki)
├── before-body.tex      # Strona tytułowa
├── title-page.lua       # Filtr Lua (przekazuje metadane do strony tytułowej)
└── images/
    ├── headerUEP.jpg    # Nagłówek UEP
    └── wykres.png       # Przykładowy wykres
```

## Formatowanie (Zarządzenie 92/2021)

| Parametr | Wartość |
|---|---|
| Czcionka | Carlito 12pt (odpowiednik Calibri) |
| Marginesy | góra/dół 2,5 cm, lewy 3 cm, prawy 2 cm |
| Interlinia | 1,5 wiersza |
| Wcięcie akapitowe | 0,5 cm |
| Tytuły rozdziałów | 14pt pogrubiona |
| Tytuły podrozdziałów | 12pt pogrubiona |
| Przypisy źródłowe | 10pt |
| Bibliografia | APA (biblatex) |
| Numeracja stron | ciągła, na dole strony |

## Przykłady użycia w plikach `.qmd`

### Cytowania

```markdown
\cite{French2010}                    % → (French i in., 2010)
\cite[123--126]{Lassen2006}          % → (Lassen i in., 2006, s. 123–126)
\textcite[610]{Porter1981}           % → Porter (1981, s. 610)
\parencite*{krugman2009}             % → (2009)
```

### Równania z odwołaniami

```markdown
$$
y = \beta_0 + \beta_1 x + \varepsilon
$$ {#eq-regresja}

Jak wynika z @eq-regresja ...
```

### Tabele z odwołaniami (LaTeX)

```latex
\begin{table}[h!]
\centering
\caption{Tytuł tabeli}\label{tbl-nazwa}
\begin{tabular}{l|c|r}
...
\end{tabular}
\par\vspace{0.3em}
{\footnotesize Źródło: \cite{klucz}}
\end{table}

Wyniki w @tbl-nazwa pokazują ...
```

### Rysunki z odwołaniami (LaTeX)

```latex
\begin{figure}[!ht]
\centering
\includegraphics[width=\textwidth]{images/wykres.png}
\caption{Tytuł rysunku}\label{fig-nazwa}
\par\vspace{0.3em}
{\footnotesize Źródło: \cite{klucz}}
\end{figure}

Na Rysunku \ref{fig-nazwa} widać ...
```

### Kod R z wykresem

````markdown
```{r}
#| label: fig-wykres-r
#| fig-cap: "Tytuł wykresu"
library(ggplot2)
ggplot(dane, aes(x, y)) + geom_point()
```

Wyniki na @fig-wykres-r ...
````

## Język pracy

Szablon obsługuje prace w języku polskim i angielskim. Zmiana języka w `_quarto.yml`:

```yaml
lang: pl  # polska wersja strony tytułowej (Promotor, Kierunek)
lang: en  # angielska wersja (Thesis Supervisor, Programme)
```

Przy `lang: en` na stronie tytułowej tytuł angielski jest wyświetlany jako pierwszy.
