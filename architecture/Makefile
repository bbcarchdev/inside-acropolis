## Author: Mo McRoberts <mo.mcroberts@bbc.co.uk>
##
## Copyright (c) 2014 BBC
##
## Licensed under the terms of the Open Government Licence, version 2.0.
## You may obtain a copy of the license at:
##
## https://www.nationalarchives.gov.uk/doc/open-government-licence/version/2/

XSLTPROC ?= xsltproc
WKPDF ?= wkpdf

## Book elements

XML = book.xml

## Output files

HTML = index.html
PDF = inside-acropolis.pdf

## XSL transform

DBXSLT = ../docbook-html5/docbook-html5.xsl
NAV = ../docbook-html5/res-nav.xml
LINKS = ../res-links.xml
XML2HTML = $(XSLTPROC) --nonet --xinclude --param "html.linksfile" "'file://`pwd`/$(LINKS)'" --param "html.navfile" "'file://`pwd`/$(NAV)'" --param "html.ie78css" "'//bbcarchdev.github.io/painting-by-numbers/ie78.css'" --output $@ $(DBXSLT)

## Phony targets

all: $(HTML)

pdf:
	$(MAKE) $(PDF)

clean:
	rm $(HTML)

cleanpdf:
	rm $(PDF)

## Real targets

$(HTML): $(XML) $(XSLT) $(LINKS) $(NAV)
	$(XML2HTML) $<

$(PDF):
	$(WKPDF) --print-background --stylesheet-media print --paper a4 --orientation portrait --ignore-http-errors --output $@ -s http://bbcarchdev.github.io/inside-acropolis
