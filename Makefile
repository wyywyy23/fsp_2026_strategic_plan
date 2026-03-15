# variables
TEX_FILE   = main
PDF_FILE   = $(TEX_FILE).pdf
CACHE_DIR  = $(shell pwd)/.latex-cache
COMPILE    = latexmk

# rules
.PHONY: all pdf clean clean-cache

all: pdf

# 始终调用 latexmk，由它判断要不要实际编译
pdf: $(CACHE_DIR)
	$(COMPILE) -pdf -interaction=nonstopmode -file-line-error \
		-outdir="$(CACHE_DIR)" "$(TEX_FILE).tex"
	@cp -f "$(CACHE_DIR)/$(TEX_FILE).pdf" "$(PDF_FILE)"

clean: clean-cache
	@rm -f "$(PDF_FILE)"

clean-cache:
	@rm -rf "$(CACHE_DIR)"

$(CACHE_DIR):
	@mkdir -p "$(CACHE_DIR)"