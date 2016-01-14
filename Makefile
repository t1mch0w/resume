.Phony:: all view 

all: pdf

ps: resume.tex 
	latex resume.tex
	bibtex resume
	latex resume.tex
	latex resume.tex
	dvips -q resume.dvi -o resume.ps
	ps2pdf resume.ps draft.pdf
	#dvips -h draft.pro resume.dvi -o draftresume.ps

pdf: resume.tex 
	pdflatex resume.tex
	bibtex resume
	pdflatex resume.tex
	pdflatex resume.tex
	#dvips -h draft.pro resume.dvi -o draftresume.ps

view:
	gv resume.ps &

pspdf:
	ps2pdf resume.ps 
	acroread resume.pdf &

clean:
	-rm -rf *~ *.bak resume.ps resume.pdf resume.out
	-rm -rf resume.aux resume.blg resume.bbl resume.dvi resume.log  
	-find . -name "*.bak" | xargs rm -rf

