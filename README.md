# Neoficiální verze šablon pro posudky závěrečných prací Ústavu biochemie PřF MU

Jedná se o přepis [oficiálních šablon](https://www.orion.sci.muni.cz/cs/studium/informace-pro-vedouci-a-oponenty.html) do TeXu.
Pokud najdete chybu nebo funkční odlišnost, nahlašte mi ji, prosím. Díky!

## Příklady

Ukázky posudků jsou v adresáři s [příklady](examples).

## Použití

Editujte vhodný soubor z adresáře [src](src):

- `bp-supervisor.tex` - Posudek vedoucího bakalářské práce
- `dp-supervisor.tex` - Posudek vedoucího diplomové práce
- `bp-reader.tex` - Posudek oponenta bakalářské práce
- `dp-reader.tex` - Posudek oponenta diplomové práce

Upravte vhodně sekce dokumentů označené čísly 1-3. Konkrétně:

1) Základní informace (jméno studenta, název práce,...)
2) Známky v jednotlivých hodnotících kategoriích dle typu práce a posudku
3) Vlastní text posudku, otázky (u oponenta)

Přeložte pomocí XeLaTeXu:

```bash
$ xelatex bp-supervisor.tex
```

## Poznámky

Šablona byla laděna s písmem TeX Gyre Pagella (ekvivalent písma Palatino), v případě jeho absence se použije defaultní.
