all: logo.pdf logo.svg logo512.png logo1024.png favicon.ico

logo.pdf: logo.tex
	pdflatex -halt-on-error $<

logo%.png: logo.pdf
	pdftocairo -singlefile -transp -png -scale-to $* $< logo$*

logo.svg: logo.pdf
	pdftocairo -svg $< logo.svg

favicon.ico: logo16.png logo32.png logo64.png logo128.png logo256.png
	convert $^ $@

clean:
	rm -f logo.aux logo.log logo.pdf logo*.png logo.svg favicon.ico

.PHONY: all clean

# vim:noexpandtab
