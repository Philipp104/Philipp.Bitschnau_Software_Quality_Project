# CI Projekt: C und Python

Autor: Philipp Bitschnau EIT-DU 4.Semester

Einfaches Beispielprojekt mit einem C-Teil (CMake) und einem Python-Teil,
die beide ueber ein gemeinsames `Makefile` gebaut, getestet und statisch
analysiert werden. Continuous Integration laeuft via GitHub Actions bei
jedem Pull Request und bei jedem Push auf `main`.

## make-Targets

| Target       | Was passiert                                                                 |
|--------------|-------------------------------------------------------------------------------|
| `make build` | Konfiguriert und baut den C-Teil mit CMake (`c/build`).                       |
| `make test`  | Baut den C-Teil (falls noetig), fuehrt die C-Unit-Tests (ctest/Unity) und anschliessend die Python-Unit-Tests (pytest) aus. |
| `make check` | Fuehrt statische Code-Analyse aus: `cppcheck` fuer den C-Teil, `ruff` fuer den Python-Teil. |
| `make clean` | Entfernt das CMake-Build-Verzeichnis (`c/build`).                             |

## Projektstruktur

```
c/        C-Teil (CMake-Projekt, Unity-Tests)
python/   Python-Teil (pytest-Tests, requirements.txt)
```

## Lokal bauen und testen

Voraussetzungen: `cmake`, ein C-Compiler, `cppcheck`, Python 3 mit `pip`.

```bash
pip install -r python/requirements.txt
make build
make check
make test
```

## Abhaengigkeiten

- Der C-Teil laedt das Unit-Test-Framework **Unity** (ThrowTheSwitch/Unity)
  automatisch per CMake `FetchContent` herunter - es muss nichts manuell
  installiert werden.
- Der Python-Teil benoetigt `pytest` und `ruff`, definiert in
  `python/requirements.txt`.

## Branch Protection

Der `main`-Branch ist in den GitHub-Repo-Einstellungen geschuetzt:
keine direkten Pushes, Merges nur per Pull Request mit erfolgreichem
CI-Lauf.
