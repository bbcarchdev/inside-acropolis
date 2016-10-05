## Author: Mo McRoberts <mo.mcroberts@bbc.co.uk>
##
## Copyright (c) 2014-2016 BBC
##
## Licensed under the terms of the Open Government Licence, version 2.0.
## You may obtain a copy of the license at:
##
## https://www.nationalarchives.gov.uk/doc/open-government-licence/version/2/

XML = book.xml \
	legal.xml preface.xml \
	\
	res-intro/part.xml res-intro/intro.xml res-intro/lod.xml \
	res-intro/res-rdf.xml \
	\
	using/part.xml using/platform-intro.xml \
	using/common.xml using/common-class.xml using/common-generic.xml \
	using/common-sameas.xml using/common-rights.xml \
	using/assets.xml \
	using/things.xml using/people.xml using/places.xml using/events.xml \
	using/concepts.xml using/creative.xml \
	\
	developers/part.xml \
	developers/api.xml \
	developers/retrieving-lod.xml \
	developers/best-practices.xml \
	developers/api-operations.xml \
	developers/api-kind.xml developers/api-query.xml \
	developers/api-source.xml developers/api-lookup.xml \
	developers/api-search.xml developers/api-iterate.xml \
	developers/api-audiences.xml \
	developers/editorial.xml \
	\
	publishers/part.xml publishers/checklist.xml publishers/media.xml \
	publishers/editorial.xml \
	\
	appendices/tools.xml appendices/containers-codecs.xml \
	\
	indices/licenses.xml indices/vocab-index.xml indices/class-index.xml \
	indices/predicate-index.xml \
	\
	glossary.xml

dist_noinst_DATA = $(XML)

dist_iihtdoc_DATA = index.html local.css masthead.png inside-acropolis.pdf \
	res-architecture.svg acropolis-architecture.svg

index.html: $(XML) $(XSLTFILES) $(NAV) $(LINKS)
	$(XML2HTML) $<

inside-acropolis.pdf: index.html local.css masthead.png
	$(HTML2PDF) $<
