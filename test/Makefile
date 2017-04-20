TARGETS := lambda_quine_js lambda_quine_py quine.js quine.py replicator_js ouroboros

URL := $(shell cd ../tf && terraform output url)
TMP_FILE := $(shell mktemp)
REPLICATED_NAME := replicated_function

.PHONY: all $(TARGETS)

all: $(TARGETS)

lambda_quine_%: ../src/lambda_quine.%
	curl -s "$(URL)/$@" | diff $< -

replicator_js:   ../src/replicator.js
	curl -s "$(URL)/$@" | diff $< -
	curl -s "$(URL)/$@?FunctionName=$(REPLICATED_NAME)" | diff $< -
	test `aws lambda invoke --function-name $(REPLICATED_NAME) $(TMP_FILE) | jq .StatusCode` -eq 200
	aws lambda delete-function --function-name $(REPLICATED_NAME)
	jq -j .body  $(TMP_FILE) | diff $< -

quine.js: ../src/quine.js
	node $< | diff $< -

quine.py: ../src/quine.py
	python $< | diff $< -

ouroboros: ../src/ouroboros.js ../src/ouroboros.py
	node ../src/$@.js | diff ../src/$@.py -
	python ../src/$@.py | diff ../src/$@.js -
