

TARGETS := zipper.zip quine_js.zip

.PHONY: all

all: $(TARGETS)

.PHONY: clean

clean:
	rm $(TARGETS)

%.zip : %/
	cd $< && zip -r ../$@ index.js node_modules/

#quine_js.zip: quine_js
#	cd quine_js && zip -r ../quine_js.zip index.js

#zipper.zip: zipper
#	cd zipper && zip -r ../zipper.zip index.js node_modules/
