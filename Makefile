TARGETS := build/zipper.zip build/lambda_quine_py.zip build/lambda_quine_js.zip build/replicator_js.zip

TERRAFORM := plan apply destroy output show

.PHONY: build clean plan apply destroy test $(TERRAFORM)

build: $(TARGETS)

clean:
	rm -rf build/*

distclean: clean
	rm -rf node_modules src/zipper/node_modules

build/zipper.zip: src/zipper/index.js src/zipper/node_modules
	cd src/zipper && zip -r ../../$@ index.js node_modules/

build/%_py.zip: src/%.py
	mkdir -p $@.temp
	cp $< $@.temp/lambda_function.py
	cd $@.temp && zip -r ../../$@ lambda_function.py
	rm -rf $@.temp

build/%_js.zip: src/%.js
	mkdir -p $@.temp
	cp $< $@.temp/index.js
	cd $@.temp && zip -r ../../$@ index.js
	rm -rf $@.temp

src/zipper/node_modules:
	cd src/zipper && npm install

$(TERRAFORM) : build
	$(MAKE) -C tf $@

test:
	$(MAKE) -C test

lint: node_modules/.bin/eslint
	node_modules/.bin/eslint $(shell find src/ -type f -name '*.js' -maxdepth 2)

pep8:	
	pep8 $(shell find src/ -type f -name '*.py')

node_modules/.bin/eslint:
	npm install eslint eslint-plugin-import eslint-config-airbnb-base
