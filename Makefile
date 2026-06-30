BUILD_DIR := c/build

.PHONY: build test clean check

## Konfiguriert und baut den C Teil mit CMake
build:
	cmake -S c -B $(BUILD_DIR)
	cmake --build $(BUILD_DIR)

## Fuehrt C Unit-Tests (ctest/Unity) und Python Unit-Tests (pytest) aus
test: build
	ctest --test-dir $(BUILD_DIR) --output-on-failure
	cd python && python -m pytest

## Entfernt alle Build-Artefakte
clean:
	rm -rf $(BUILD_DIR)

## Fuehrt statische Code-Analyse fuer C (cppcheck) und Python (ruff) aus
check: build
	cppcheck --enable=warning,style,performance,portability --error-exitcode=1 \
		-I c/include c/src c/test
	cd python && python -m ruff check .
