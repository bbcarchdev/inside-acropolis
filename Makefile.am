## Author: Mo McRoberts <mo.mcroberts@bbc.co.uk>
##
## Copyright (c) 2014-2015 BBC
##
## Licensed under the terms of the Open Government Licence, version 2.0.
## You may obtain a copy of the license at:
##
## https://www.nationalarchives.gov.uk/doc/open-government-licence/version/2/

XML = book.xml \
	legal.xml preface.xml intro.xml lod.xml architecture.xml publishers.xml \
	consumers.xml media.xml structure.xml common.xml assets.xml things.xml \
	people.xml places.xml events.xml concepts.xml creative.xml tools.xml \
	containers-codecs.xml vocab-index.xml class-index.xml predicate-index.xml \
	licenses.xml glossary.xml

dist_noinst_DATA = $(XML)

dist_iihtdoc_DATA = index.html local.css masthead.png inside-acropolis.pdf \
	res-architecture.svg acropolis-architecture.svg

index.html: $(XML) $(XSLTFILES) $(NAV) $(LINKS)
	$(XML2HTML) $<

inside-acropolis.pdf: index.html local.css masthead.png
	$(HTML2PDF) $<
