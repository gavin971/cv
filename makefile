TARGET=cv
TEX=pdflatex

all:
	${TEX} ${TARGET}.tex
	for file in *.aux ; do \
		bibtex $$file ; \
	done ;
	while (${TEX} ${TARGET} ; \
		grep -q "Rerun to get cross" ${TARGET}.log ) do true ; \
	done

clean:
	rm *.aux
	rm *.bbl
	rm *.blg
	rm ${TARGET}.{log,out,dvi}
