.PHONY: all pdf watch clean distclean tectonic

all: pdf

pdf:
	@if command -v latexmk >/dev/null 2>&1 && command -v pdflatex >/dev/null 2>&1; then \
		latexmk main.tex; \
	elif command -v tectonic >/dev/null 2>&1; then \
		$(MAKE) tectonic; \
	else \
		printf '%s\n' 'No LaTeX compiler found. Install Tectonic (brew install tectonic) or TeX Live/MacTeX.'; \
		exit 127; \
	fi

watch:
	@if command -v latexmk >/dev/null 2>&1 && command -v pdflatex >/dev/null 2>&1; then \
		latexmk -pvc main.tex; \
	else \
		printf '%s\n' 'make watch requires latexmk and pdfLaTeX from TeX Live/MacTeX. Use make to build with Tectonic.'; \
		exit 127; \
	fi

clean:
	rm -f build/*.aux build/*.bbl build/*.blg build/*.fdb_latexmk \
		build/*.fls build/*.log build/*.out build/*.synctex.gz build/*.toc build/*.xdv

distclean:
	$(MAKE) clean
	rm -f build/main.pdf

# Alternative compiler; downloads TeX dependencies on its first run.
tectonic:
	mkdir -p build
	tectonic --keep-logs --outdir build main.tex
