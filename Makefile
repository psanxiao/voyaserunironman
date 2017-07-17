#CHAPTERS = $(wildcard chapters/*.md)

CHAPTERS = chapters/00-prologo.md \
chapters/01-voy-a-ser-un-ironman.md \
chapters/02-la-calma-antes-de-la-tempestad-.md \
chapters/03-planificacion-de-la-temporada-en-modo-resumido.md \
chapters/04-material-la-bicicleta.md \
chapters/05-disenhando-el-calendario-de-pruebas-2017.md \
chapters/06-cuando-las-carreras-no-se-corren-se-viven.md \
chapters/07-que-hacer-y-que-no-hacer-en-la-preparacion-de-un-ironman.md \
chapters/08-distribucion-entreno-semanal.md \
chapters/09-material-el-casco.md \
chapters/10-la-profesionalizacion-del-atleta-amateur.md \
chapters/11-material-las-ruedas.md \
chapters/12-replanteando-el-calendario-de-pruebas-para-el-2017.md \
chapters/13-gestionar-el-pico-de-forma.md \
chapters/14-analizar-el-recorrido-sector-ciclismo.md \
chapters/15-notas-sobre-nutricion.md \
chapters/16-quedan-solo-3-meses.md \
chapters/17-las-lesiones.md \
chapters/18-correr-mejor-sin-correr-mas.md \
chapters/19-mayo-empieza-la-temporada-y-al-fin-tengo-calendario.md \
chapters/20-afinando.md \
chapters/21-alimentacion-en-carrera.md \
chapters/22-las-ultimas-24-horas.md \
chapters/23-ya-soy-un-ironman.md

EPUB_FILE = build/Voy\ a\ ser\ un\ ironman\ -\ Pablo\ Sanxiao.epub
MOBI_FILE = build/Voy\ a\ ser\ un\ ironman\ -\ Pablo\ Sanxiao.mobi
PDF_FILE = build/Voy\ a\ ser\ un\ ironman\ -\ Pablo\ Sanxiao.pdf


.PHONY: all
all: $(EPUB_FILE) $(MOBI_FILE) $(PDF_FILE)

.PHONY: clean
clean:
	rm -f build/*

.PHONY: epub
epub: $(EPUB_FILE)

.PHONY: mobi
mobi: $(MOBI_FILE)

.PHONY: pdf
pdf: $(PDF_FILE)


.PHONY: preview
preview: $(MOBI_FILE)
	ebook-viewer $(MOBI_FILE)


$(EPUB_FILE): clean $(CHAPTERS) meta/title.txt meta/cover.jpg meta/stylesheet.css meta/metadata.xml
	pandoc \
		-o $(EPUB_FILE) \
		meta/title.txt \
		$(CHAPTERS) \
		--epub-cover-image=meta/cover.jpg \
		--epub-stylesheet=meta/stylesheet.css \
		--epub-metadata=meta/metadata.xml \
		--table-of-contents

$(PDF_FILE): $(CHAPTERS) meta/title.txt
	pandoc \
		-o $(PDF_FILE) \
		meta/title.txt \
		$(CHAPTERS) \
		--toc


$(MOBI_FILE): $(EPUB_FILE)
	kindlegen $(EPUB_FILE)
