SLIDELEVEL=3

TARGETS=$(patsubst %.pandoc,%.pdf,$(wildcard *.pandoc)) $(patsubst %.pandoc,%-blog.txt,$(wildcard *.pandoc)) $(patsubst %.pandoc,%.epub,$(wildcard *.pandoc))

all: depend $(TARGETS)

depend: .depend

.depend: $(wildcard *.pandoc) makedep.sh
	rm -f .depend
	./makedep.sh > .depend

-include .depend

%.pdf: %.pandoc beamer.my 
	pandoc --slide-level $(SLIDELEVEL) -t beamer $< -V theme:Warsaw -V fonttheme:structurebold -o $@

%.epub: %.pandoc beamer.my
	pandoc --slide-level $(SLIDELEVEL) -t epub $< -V theme:Warsaw -V fonttheme:structurebold -o $@

%.png: img/%.png
	./mkimg.sh $@

%-blog.txt: %.pandoc
	php etxt.php $< > $@
clean:
	rm -f $(TARGETS) *.png .depend

push:
	git push origin master
