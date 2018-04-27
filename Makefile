.PHONY: clean help
.DEFAULT_GOAL= help
CC=pdflatex

help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-10s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

pdf: tpC.tex ## build pdf output from the main file
	$(CC) tpC.tex
clean: ## clean all build files
	@rm -f *.aux *.bak *.log *.out *.toc *.gz *.fls *.fdb_latexmk *.dvi *.nav *.snm *.vrb

show: ## show pdf
	evince tpC.pdf
