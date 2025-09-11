LIBDIR := lib
include $(LIBDIR)/main.mk

$(LIBDIR)/main.mk:
ifneq (,$(shell grep "path *= *$(LIBDIR)" .gitmodules 2>/dev/null))
	git submodule sync
	git submodule update $(CLONE_ARGS) --init
else
	git clone -q --depth 10 $(CLONE_ARGS) \
	    -b main https://github.com/martinthomson/i-d-template $(LIBDIR)
endif

CDDL_DIR := cddl/

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

check-satp-examples: $(addprefix $(CDDL_DIR),$(CDDL_EXAMPLES))
	$(MAKE) -C $(CDDL_DIR) check-satp-examples
.PHONY: check-satp-examples

clean::
	$(MAKE) -C $(CDDL_DIR) clean
.PHONY: clean
