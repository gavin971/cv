TARGET=cv
TEX=pdflatex

all: cv cover

cv:
	${TEX} ${TARGET}.tex
	for file in *.aux ; do \
		bibtex $$file ; \
	done ;
	while (${TEX} ${TARGET} ; \
		grep -q "Rerun to get cross" ${TARGET}.log ) do true ; \
	done

cover:
	${TEX} cover.tex
	${TEX} cover.tex
	${TEX} cover.tex


clean:
	rm *.aux
	rm *.bbl
	rm *.blg
	rm ${TARGET}.{log,out,dvi}
