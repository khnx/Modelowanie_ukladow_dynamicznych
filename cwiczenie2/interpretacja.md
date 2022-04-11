# Metoda ogólna.

## Cechy:

- Postać równania: y^(n) + F(y^(n-1), ..., y, x, t) = 0.
- Układy liniowe co najwyżej trzeciego rzędu.
- Układy nieliniowe pierwszego rzędu.
- Trzeba określić warunki początkowe.
- Nie można rozwiązywać równań zawierających funkcję postaci x(t) i jej pochodnych.

## Działanie:

Działa tak, że bierze się wymuszenie, całkuje tyle razy, ile wymaga tego stopień najwyższej pochodnej. Jako sygnały składowe do bloku sumującego dostarcza się sygnały wychodzące z wyszczególnionych bloków całkujących.

# Metoda zmiennej pomocniczej.

## Cechy:

- Postać równania: y^(n) + ... + y = x^(m) + ... + x
- m < n
- Przekształcenie równania wyjściowego do postaci równania liniowego Z.
- Aby wyznaczyć rozwiązanie układu, zsumować odpowiednie wartości wychodzące z elementów całkujących.

## Działanie:

Stworzyć dwa układy połączone. Jeden niech będzie rozwiązywać układ stworzony dla y, metodą ogólną. Drugi, niech zbiera sygnały odpowiednich całek dla x, do bloku sumującego, który tworzy rozwiązanie. Wartość x - wartość wymuszenia.

# Metoda kanoniczna.

## Cechy:

- Postać równania: y^(n) + ... + y = x^(n) + ... + x
- Stopień równania po obu stronach wynosi n.
- Przekształcić równanie do postaci X - Y + d/dt(X - Y d/dt( ... )) = 0.
- Stworzyć układ równań różniczkowych, z których każde kolejne jest zależne od poprzedniego, z wyjątkiem pierwszego.

## Działanie:

Przekształcić równanie różniczkowe i stworzyć układ równań. Wyznaczyć warunki początkowe za pomocą tabeli, dla wszystkich współczynników. W Simulinku, dla każdego bloku całkującego, brać sumę pochodzącą z wymuszenia oraz sygnału zwrotnego, pomnożone przez odpowiednie wartości pochodzące z tabel.

# Tabele określające współczynniki kolejnych wartości x i y.

![Tabele określające wartości współczynników Y i X]("tabelaYX.png")