TERRAFORM := plan apply destroy output show

.PHONY: get $(TERRAFORM)

get:
	terraform get

$(TERRAFORM): get
	terraform $@
