# Inside Acropolis

This is _Inside Acropolis_, a guide to the
[Research & Education Space](https://bbcarchdev.github.io/res/) for
contributors and developers.

This is an open-content book, licensed under the terms of the
[Open Government Licence, v2.0](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/2/).
Accompanying code and samples are licensed under the terms of the
[Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0).

The canonical version of the book can be found at:

https://bbcarchdev.github.io/inside-acropolis/

## Building the book

_Inside Acropolis_ is written using [DocBook 5](http://www.docbook.org/tdg5/en/html/docbook.html),
an XML-based mark-up language designed for technical publishing. The file
[book.xml](https://github.com/bbcarchdev/inside-acropolis/blob/gh-pages/book.xml) contains the
root element, and uses [XInclude](http://www.w3.org/TR/xinclude/) to combine
the various chapters into a single document for processing.

The book is converted to HTML using a set of [XSL stylesheets](http://www.w3.org/Style/XSL/).

The PDF version of the book is generated using [wkpdf](https://plessl.github.io/wkpdf/),
which is unfortunately only available for Mac OS X.

To re-build the HTML or PDF, first clone this repository and the
[RES XSL stylesheets](http://bbcarchdev.github.io/docbook-html5/):

```
$ git clone https://github.com/bbcarchdev/inside-acropolis.git
$ cd inside-acropolis
$ git clone https://github.com/bbcarchdev/docbook-html5.git
```

Next, after modifying the DocBook sources, you can re-build the HTML with:

```
$ make
```

If you have wkpdf installed, you can generate the PDF from the HTML with:

```
$ make pdf
```

