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

## These are the make rules for building this tree as part of the RES
## website - https://bbcarchdev.github.io/res/

subdir = inside-acropolis
top = ..

include $(top)/config.mk

## Book elements

XML = book.xml \
	legal.xml preface.xml intro.xml lod.xml architecture.xml publishers.xml \
	consumers.xml structure.xml common.xml assets.xml things.xml people.xml \
	places.xml events.xml concepts.xml creative.xml tools.xml vocab-index.xml \
	class-index.xml predicate-index.xml

## Output files

HTML = index.html
PDF = inside-acropolis.pdf

## Files to install

FILES = $(HTML) local.css masthead.png
XFILES = $(PDF)

all: $(HTML)

pdf:
	rm -f $(PDF)
	$(MAKE) -f buildrules.make $(PDF)

clean:
	rm -f $(HTML)

pdfclean: clean
	rm -f $(PDF)

install: $(FILES)
	$(INSTALL) -m 755 -d $(DESTDIR)$(webdir)/$(PACKAGE)/$(subdir)
	for i in $(FILES) ; do $(INSTALL) -m 644 $$i $(DESTDIR)$(webdir)/$(PACKAGE)/$(subdir) ; done
	for i in $(XFILES) ; do $(INSTALL) -m 644 $$i $(DESTDIR)$(webdir)/$(PACKAGE)/$(subdir) ; done

$(HTML): $(XML) $(XSLT) $(LINKS) $(NAV)
	$(XML2HTML) $<

$(PDF):
	wkpdf --print-background --stylesheet-media print --paper a4 --orientation portrait --ignore-http-errors --output $@ -s http://bbcarchdev.github.io/inside-acropolis/
