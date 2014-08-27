all: logo.pdf logo.svg logo512.png logo64.png favicon.ico logo3d512.png logo3d64.png favicon3d.ico

logo.pdf: logo.tex
	pdflatex -halt-on-error $<

logo%.png: logo.pdf
	pdftocairo -singlefile -transp -png -scale-to $* $< logo$*

logo3d%.png: logo.pov
	povray +O$@ +I$< +H$* +W$* +ua +Q9 +A0.01

logo.svg: logo.pdf
	pdftocairo -svg $< logo.svg

favicon.ico: logo16.png logo32.png logo64.png logo128.png logo256.png
	convert $^ $@

favicon3d.ico: logo3d16.png logo3d32.png logo3d64.png logo3d128.png logo3d256.png
	convert $^ $@

clean:
	rm -f logo.aux logo.log logo.pdf logo*.png logo.svg favicon.ico

.PHONY: all clean

# vim:noexpandtab
