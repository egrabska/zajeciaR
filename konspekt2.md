W ćwiczeniu wykorzystamy bazę danych ofert mieszkań w Krakowie pozyskaną
z serwisu otodom między marcem a listopadem 2019 roku.

Przed przystąpieniem do analiz należy wyczyścić bazę ze zbędnych kolumn
i znaków oraz upewnić się, że wszytskie kolumny są odpowiedniego typu,
tj. numeryczne typu *numeric*, kategorie (zmienne jakościowe) - typu
*factor*, daty - format *date* itd.

-   Wczytaj dane *offers3.csv*

-   Sprawdź jak wyglądają dane używając funkcji: `str()`, `summary()`,
    `head()`, `tail()`, `unique()`

Do "czyszczenia" zbędnych znaków można użyć funkcji `gsub()` lub
`substr()`

-   sprawdź pomoc dla ww. funkcji i zastosuj je do danych

Ćwiczenie 1 Oblicz średnią, minimalną, maksymalną cenę za metr
mieszkania w Krakowie Czy minimalne i maksymalne ceny na pewno są
prawdziwymi wartościami? Utwórz boxploty (funkcja `boxplot()`) dla
poszczególnych zmiennych. Przefiltruj dane - na podstawie zmiennej cena
za metr, wybierz tylko te mieszkania, których cena za metr jest większa
od 2000 i mniejsza od 30000 zł. Utwórz histogram cen za m2. Usuń
duplikaty za pomocą funkcji `unique()`

Zainstaluj/wczytaj pakiet `dplyr` Przetestuj funkcje: `count()`,
`filter()`, `arrange()`, `select()`, `mutate()`, `summarise()`
