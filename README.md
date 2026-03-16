# Szablon pracy dyplomowej UEP w Quarto

Szablon pracy licencjackiej/inżynierskiej/magisterskiej dla Uniwersytetu Ekonomicznego w Poznaniu, zgodny z **Zarządzeniem nr 92/2021 Rektora UEP**.

Repozytorium zawiera dwie wersje szablonu:

- `latex-template/` — oryginalny szablon LaTeX
- `quarto-template/` — szablon Quarto (z obsługą kodu R i Python)

## Wymagania

- [Quarto](https://quarto.org/docs/get-started/) (>= 1.3)
- [R](https://cran.r-project.org/) (jeśli używasz kodu R w pracy)
- [Python](https://www.python.org/) z `matplotlib` i `numpy` (jeśli używasz kodu Python)
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

3. Pisz rozdziały jako pliki `.qmd` w podfolderach i dodawaj je do `chapters:` w `_quarto.yml`
4. Renderuj:

```bash
cd quarto-template
quarto render
```

Wynik: `_book/nazwiskoNIUtyp.pdf`

## Struktura szablonu

```
quarto-template/
├── _quarto.yml                     # Konfiguracja projektu i metadane pracy
├── index.qmd                       # Wstęp
├── .Rprofile                       # Ustawienia locale (polskie znaki w wykresach R)
├── bibliografia.bib                # Bibliografia
├── rozdzial1/
│   ├── rozdzial1.qmd               # Rozdział 1 (kod R, wzory, rysunki)
│   └── wykres.png                  # Przykładowy wykres
├── rozdzial2/
│   └── rozdzial2.qmd               # Rozdział 2 (tabele, cytowania, kod Python)
├── zalacznik/
│   └── zalacznik.qmd               # Załącznik (dodatkowe dane)
├── config/
│   └── preamble.tex                # Ustawienia LaTeX (czcionka, nagłówki, spisy)
└── stronaTytulowa/
    ├── before-body.tex             # Strona tytułowa
    ├── title-page.lua              # Filtr Lua (metadane → strona tytułowa)
    └── headerUEP.jpg               # Nagłówek UEP
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

## Spisy generowane automatycznie

Szablon automatycznie generuje (w tej kolejności):
1. **Spis tabel** / List of Tables
2. **Spis rycin** / List of Figures
3. **Spis programów** / List of Listings

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

### Tabele (Quarto markdown)

```markdown
| **Kolumna 1** | **Kolumna 2** | **Kolumna 3** |
|:------------|:-----------:|------------:|
| wartość     | wartość     | wartość     |

: Tytuł tabeli {#tbl-nazwa}

Wyniki w @tbl-nazwa pokazują ...
```

### Rysunki z plikiem graficznym (LaTeX)

```latex
\begin{figure}[!ht]
\centering
\includegraphics[width=\textwidth]{rozdzial1/wykres.png}
\caption{Tytuł rysunku}\label{fig-nazwa}
\par\vspace{0.3em}
{\footnotesize Źródło: \cite{klucz}}
\end{figure}

Na Rysunku \ref{fig-nazwa} widać ...
```

### Kod R z wykresem i spisem programów

````markdown
```{r}
#| label: fig-wykres-r
#| fig-cap: "Tytuł wykresu"
#| lst-label: lst-wykres-r
#| lst-cap: "Opis programu R"
library(ggplot2)
ggplot(dane, aes(x, y)) + geom_point()
```

Wyniki na @fig-wykres-r ...
````

### Kod Python z wykresem

````markdown
```{python}
#| label: fig-wykres-py
#| fig-cap: "Tytuł wykresu"
#| lst-label: lst-wykres-py
#| lst-cap: "Opis programu Python"
#| dev: pdf
import matplotlib.pyplot as plt
plt.plot([1, 2, 3], [1, 4, 9])
plt.show()
```
````

### Załączniki

Dodaj plik `.qmd` do sekcji `appendices:` w `_quarto.yml`:

```yaml
book:
  chapters:
    - index.qmd
    - rozdzial1/rozdzial1.qmd
  appendices:
    - zalacznik/zalacznik.qmd
```

## Język pracy

Szablon obsługuje prace w języku polskim i angielskim. Zmiana języka w `_quarto.yml`:

```yaml
lang: pl  # polska wersja (Promotor, Kierunek, Spis tabel/rycin/programów)
lang: en  # angielska wersja (Thesis Supervisor, Programme, List of Tables/Figures/Listings)
```

Przy `lang: en` na stronie tytułowej tytuł angielski jest wyświetlany jako pierwszy.
