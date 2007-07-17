LATEX=latex
TEX=transfer_report

all: $(TEX)

%: %.tex 
	rm -vf $<.bbl $<.pdf
	$(LATEX) $<
	bibtex $@
	$(LATEX) $<
	$(LATEX) $<
	dvips -Ppdf -G0 $@.dvi -o $@.ps
	#$(LATEX) titlepage
	#dvips -Ppdf -G0 titlepage.dvi -o titlepage.ps
	ps2pdf -dPDFsettings=/prepress -dAutoFilterColorImages=false -dColorImageFilter=/FlateEncode $@.ps $@.pdf
	#ps2pdf -dPDFsettings=/prepress -dAutoFilterColorImages=false -dColorImageFilter=/FlateEncode titlepage.ps titlepage.pdf
#	ps2ascii $*.ps| wc -w

clean:
	rm *.{aux,blg,log,out,pdf}
