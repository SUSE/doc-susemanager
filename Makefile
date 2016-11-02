
all: html pdf

html:
	daps -d DC-create-all html

pdf:
	daps -d DC-create-all pdf

advanced:
	daps -d DC-susemanager-advanced-topics pdf

best-practices:
	daps -d DC-susemanager-best-practices pdf

getting-started:
	daps -d DC-susemanager-getting-started pdf

reference:
	daps -d DC-susemanager-reference pdf

quick: quick-html quick-pdf

quick-html:
	daps -d DC-susemanager-quick html

quick-pdf:
	daps -d DC-susemanager-quick pdf

# Target for www.suse.com/documentation
online-docs:
	daps -d DC-create-all online-docs

package: package/doc-susemanager-develop.tar.bz2
#add origin in front of develop to build for jenkins
package/doc-susemanager-develop.tar.bz2:
	git archive --format=tar --prefix=doc-susemanager-develop/ origin/develop > package/doc-susemanager-develop.tar 
	bzip2 package/doc-susemanager-develop.tar
clean:
	rm -rf package/doc-susemanager-develop.tar.bz2
	rm -rf package/*~

