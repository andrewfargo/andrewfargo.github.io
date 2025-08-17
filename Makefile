sources := $(wildcard page/*/post.xml)
blogpages := $(patsubst %.xml, %.html, $(sources))
XSL := xsltproc
XSLFLAGS := --xinclude --xincludestyle

all: $(blogpages) rss.xml blog.html

%.html: %.xml
	$(XSL) $(XSLFLAGS) -o $@ stylesheet/blog.xsl $^

rss.xml: $(sources)
	echo "<?xml version='1.0' encoding='ISO-8859-1'?><rss version='0.91' xmlns='https://www.rssboard.org/rss-specification'><channel> $$(cat stylesheet/header.rss.xml) $(foreach file, $(sources), $$($(XSL) $(XSLFLAGS) stylesheet/rss.xsl $(file) | tail -n +2)) </channel></rss>" > rss.xml

blog.html: rss.xml
	$(XSL) $(XSLFLAGS) -o $@ stylesheet/nav.xsl $^


.PHONY: all
