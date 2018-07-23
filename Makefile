favicon.ico: logo16.png logo32.png logo64.png logo128.png logo256.png
	convert $^ $@

logo%.png: logo.pov
	povray +O$@ +I$< +H$* +W$* +ua +Q9 +A0.01

clean:
	rm -f logo*.png favicon.ico

.PHONY: clean

# vim:noexpandtab
