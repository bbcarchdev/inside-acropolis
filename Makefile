## Author: Elliot Smith <elliot.smith@bbc.co.uk>
##
## Copyright (c) 2017 BBC
##
## Licensed under the terms of the Open Government Licence, version 2.0.
## You may obtain a copy of the license at:
##
## https://www.nationalarchives.gov.uk/doc/open-government-licence/version/2/

XSLTPROC ?= xsltproc

## Book elements

XML = book.xml

## Output files

HTML = index.html

## XSL transform

DBXSLT = docbook-html5/docbook-html5.xsl
NAV = docbook-html5/res-nav.xml
LINKS = docbook-html5/res-links.xml
XML2HTML = $(XSLTPROC) --nonet --xinclude --param "html.linksfile" "'file://`pwd`/$(LINKS)'" --param "html.navfile" "'file://`pwd`/$(NAV)'" --param "html.ie78css" "'//bbcarchdev.github.io/painting-by-numbers/ie78.css'" --output $@ $(DBXSLT)

TOPTARGETS := all clean cleanpdf
SUBDIRS = architecture

$(TOPTARGETS): $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)

## Phony targets

all: $(HTML) $(SUBDIRS)

clean:
	rm $(HTML)

## Real targets

$(HTML): $(XML) $(XSLT) $(LINKS) $(NAV)
	$(XML2HTML) $<

.PHONY: $(TOPTARGETS) $(SUBDIRS)
