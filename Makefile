
all: package

package: package/doc-susemanager-develop.tar.bz2

package/doc-susemanager-develop.tar.bz2:
	git archive --format=tar --prefix=doc-susemanager-develop/ develop  | bzip2 -c > package/doc-susemanager-develop.tar.bz2
clean:
	rm -rf package/doc-susemanager-develop.tar.bz2
