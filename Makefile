
NAME=stok

TARGETS=$(NAME).pdf $(NAME).notes.pdf $(NAME)-blog.txt

all: $(TARGETS)

$(NAME).pdf: $(NAME).pandoc beamer.my beamercolorthemekrok.sty
	pandoc --slide-level 1 -t beamer $(NAME).pandoc --template beamer.my -V theme:Warsaw -V fonttheme:structurebold -V colortheme:krok -o $(NAME).pdf

$(NAME).notes.pdf: $(NAME).pandoc
	a2ps -B -o - -r --columns=2 $(NAME).pandoc | ps2pdf - $(NAME).notes.pdf

$(NAME)-blog.txt: $(NAME).pandoc
	php etxt.php $(NAME).pandoc > $(NAME)-blog.txt
clean:
	rm -f $(TARGETS)
