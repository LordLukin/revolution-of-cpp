SRCS:=$(wildcard *.tex)
IMGS:=$(wildcard img/*)
HDRS:=$(wildcard src/*)

TEXFLAGS:=-file-line-error -halt-on-error

MAIN:=main
DVI :=$(MAIN).dvi
PDF :=$(MAIN).pdf

.PHONY: all
all: pdf script

.PHONY: pdf
pdf: $(PDF)

$(PDF): $(SRCS) $(IMGS) $(HDRS) Makefile | src
	pdflatex $(TEXFLAGS) $(MAIN) || ( echo ; rm -fv $(PDF) ; exit 1 )
	$(REM) pdflatex $(TEXFLAGS) $(MAIN)
	$(REM) pdflatex $(TEXFLAGS) $(MAIN)

.PHONY: fast
fast: REM:=true
fast: pdf

.PHONY: src
src:
#	+$(MAKE) -C "$@"

.PHONY: script
script: script.log
script.log: $(SRCS)
	grep -e '% NOTE: ' -e 'slide{' slides.tex $$(cat slides.tex | grep input | sed 's:.*{\(.*\)}:\1:') > "$@"

.PHONY: clean
clean:
	+$(MAKE) -C src clean
	rm -fv *.dvi *.pdf *.aux *bak *.log *.lof *.lot *.toc *.bbl *.blg *.nav *.out *.snm *.vrb
