W ćwiczeniu wykorzystamy bazę danych ofert mieszkań w Krakowie pozyskaną
z serwisu otodom między marcem a listopadem 2019 roku.

Przed przystąpieniem do analiz należy wyczyścić bazę ze zbędnych kolumn
i znaków oraz upewnić się, że wszystkie kolumny są odpowiedniego typu,
tj. numeryczne typu *numeric*, kategorie (zmienne jakościowe) - typu
*factor*, daty - format *date* itd.

-   Wczytaj dane *offers3.csv*

-   Sprawdź jak wyglądają dane używając funkcji: `str()`, `summary()`,
    `head()`, `tail()`, `unique()`

Do "czyszczenia" zbędnych znaków można użyć funkcji `gsub()` lub
`substr()`

-   Sprawdź pomoc dla ww. funkcji i zastosuj je do danych

-   Użyj funkcji `as.numeric()`, `as.character()`, `as.date()`,
    `as.factor()`

-   Sprawdź wartości puste (*NA*) i usuń rekordy, które je zawierają
    używając funkcji `na.omit()`

-   Oblicz średnią, minimalną, maksymalną cenę za metr mieszkania w
    Krakowie

-   Czy minimalne i maksymalne ceny na pewno są prawdziwymi wartościami?

-   Utwórz boxploty (funkcja `boxplot()`) dla poszczególnych zmiennych.

-   Przefiltruj dane - na podstawie zmiennej cena za metr, wybierz tylko
    te mieszkania, których cena za metr jest większa od 2000 i mniejsza
    od 30000 zł.

-   Usuń duplikaty za pomocą funkcji `unique()`

-   Utwórz histogram cen za m2.

------------------------------------------------------------------------

W kolejnych krokach wykorzystamy narzędzia dostępne w pakiecie `dplyr`,
który jest jednym z najpopularniejszych pakietów w przetwarzaniu danych,
stosowany aby poprawić czytelnośc i lepiej je zorganizować (*data
manipulation*)

-   Zainstaluj/wczytaj pakiet `dplyr`

-   Przetestuj funkcje: `glimpse()`, `count()`, `filter()`, `arrange()`,
    `select()`, `mutate()`, `summarise()`, `group_by()`

-   Oblicz średnie ceny za metr dla dzielnic i dla miesięcy.
