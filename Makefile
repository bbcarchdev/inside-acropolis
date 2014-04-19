## Author: Mo McRoberts <mo.mcroberts@bbc.co.uk>
##
## Copyright (c) 2014 BBC
##
##  Licensed under the Apache License, Version 2.0 (the "License");
##  you may not use this file except in compliance with the License.
##  You may obtain a copy of the License at
##
##      http://www.apache.org/licenses/LICENSE-2.0
##
##  Unless required by applicable law or agreed to in writing, software
##  distributed under the License is distributed on an "AS IS" BASIS,
##  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
##  See the License for the specific language governing permissions and
##  limitations under the License.

XSLTPROC ?= xsltproc

## Book elements

XML = book.xml legal.xml preface.xml intro.xml lod.xml architecture.xml publishers.xml consumers.xml common.xml assets.xml people.xml places.xml events.xml concepts.xml creative.xml tools.xml vocab-index.xml

## Output files

HTML = index.html
PDF = inside-acropolis.pdf

## XSLT

XSLT = docbook-html5/docbook-html5.xsl docbook-html5/doc.xsl docbook-html5/block.xsl docbook-html5/inline.xsl docbook-html5/toc.xsl

all: $(HTML)
	
pdf:
	rm -f $(PDF)
	$(MAKE) $(PDF)

$(HTML): $(XML) $(XSLT) styles.xml nav.xml
	${XSLTPROC} -nonet --xinclude \
		--param "html.linksfile" "'`pwd`/styles.xml'" \
		--param "html.navfile" "'`pwd`/nav.xml'" \
		--param "html.ie78css" "'http://bbcarchdev.github.io/painting-by-numbers/ie78.css'" \
		-o $@ \
		docbook-html5/docbook-html5.xsl \
		$<

$(PDF):
	wkpdf --print-background --stylesheet-media print --paper a4 --orientation portrait --ignore-http-errors --output $@ -s http://bbcarchdev.github.io/inside-acropolis/
