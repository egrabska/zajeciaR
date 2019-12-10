Wprowadzenie
------------

**R** – język

**Rstudio** – program do języka R

RStudio składa się z kilku podokien i narzędzi:

-   Konsola (*Console*) – tutaj możesz wpisywać bezpośrednio kod,

-   Okno środowiska (*Environment*) – wyświetlane tu są wszystkie
    zapisane w pamięci zmienne, jak i funkcje. Środowisko można zapisać,
    jak również wczytać. Używając tego okna można również importować
    dane z zewnątrz oraz przejrzeć historię wpisywanych linii kodu.

-   Okno z zakładkami – tutaj możemy przeglądać strukturę plików na
    dysku (*Files*), wyświetlać wykresy (*Plots*), przeglądać
    zainstalowane pakietu (*Packages*), szukać pomocy na temat funkcji z
    pakietów (*Help*).

-   W R najczęściej chcemy pisać skrypty składające się z wielu linii,
    które następnie będziemy wykonywać. Do otwarcia nowego skryptu służy
    ikona Add R Script lub kombinacja klawiszy Ctrl+Shift+N.

Funkcje – zazwyczaj skonstruowane w sposób:

nazwa\_funkcji(x, y, …)

-   x – dane wejściowe
-   y – dalsze argumenty, które mogą być Na przykład w funkcji
    [`read.csv()`](https://stat.ethz.ch/R-manual/R-devel/library/utils/html/read.table.html),
    która służy do wczytywania danych w formacie csv:

`read.csv(file, header = TRUE, sep = ",", quote = "\"", dec = ".", fill = TRUE, comment.char = "", ...)`

Pakiety – instalacja i wczytywanie: install.packages() library() Help
Typy obiektów

Wczytywanie bazy danych: Najczęściej w formacie .csv &gt; data frame
Poszczególne kolumny &gt; $
