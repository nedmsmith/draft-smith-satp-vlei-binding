# ==== Environment Setup ====
LIBDIR := lib/
CDDL_DIR := cddl/

#SHELL := /bin/bash
#.SHELLFLAGS := -lc
#export SHELL .SHELLFLAGS TOP

include $(LIBDIR)main.mk
# ==== Main Target ====
$(LIBDIR)main.mk:
ifneq (,$(shell grep "path *= *$(LIBDIR)" .gitmodules 2>/dev/null))
	git submodule sync
	git submodule update $(CLONE_ARGS) --init
else
	git clone -q --depth 10 $(CLONE_ARGS) \
	    -b main https://github.com/martinthomson/i-d-template $(LIBDIR)
endif

include $(CDDL_DIR)frags.mk
# $1 - schema name
# $2 - list of cddl input files
define cddl_targets

$(drafts_xml): $(CDDL_DIR)$(1)-autogen.cddl

$(CDDL_DIR)$(1)-autogen.cddl: $(addprefix $(CDDL_DIR),$(2))
	$(MAKE) -C $(CDDL_DIR) check-$(1)
	$(MAKE) -C $(CDDL_DIR) check-$(1)-examples

endef # cddl_targets

$(eval $(call cddl_targets,satp,$(CDDL_FRAGS)))

clean::
	$(MAKE) -C $(CDDL_DIR) clean
.PHONY: clean

clean-gems:
	rm -rf $(ROOT)/Gemfile.lock
	cd $(ROOT) && bundle install
.PHONY: clean-gems