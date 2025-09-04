# ==== Environment Setup ====
ROOT := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
TOP := $(abspath $(ROOT))
LIBDIR := lib/
CDDL_DIR := $(TOP)/cddl/

SHELL := /bin/bash
.SHELLFLAGS := -lc
export SHELL .SHELLFLAGS TOP

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

# ==== Tool Detection ====
#TOOLS_MK := $(TOP)/tools.mk
#include $(TOOLS_MK)
#$(info [cddl/Makefile] TOOLS_MK = $(TOOLS_MK))

# ==== Functions ====
#include $(TOP)/funcs.mk
#EXAMPLES_JSONC := $(wildcard $(TOP)/examples/json/*.jsonc)
#$(eval $(call CHECK_JSONC_EXAMPLES,satp,$(EXAMPLES_JSONC)))

# ==== Targets ====
#.DEFAULT_GOAL := build-doc

#build-doc: check-satp-examples
#	$(MAKE) draft-smith-satp-vlei-binding.txt
#	$(MAKE) draft-smith-satp-vlei-binding.html

include $(CDDL_DIR)frags.mk
# $1 - schema name
# $2 - list of cddl input files
define cddl_targets

$(drafts_xml): $(CDDL_DIR)$(1)-autogen.cddl

$(CDDL_DIR)$(1)-autogen.cddl: $(addprefix $(CDDL_DIR),$(2))
	$(MAKE) -C $(CDDL_DIR) check-$(1)
	$(MAKE) -C $(CDDL_DIR) check-$(1)-examples

endef # cddl_targets

clean::
	$(MAKE) -C $(CDDL_DIR) clean
.PHONY: clean

clean-gems:
	rm -rf $(ROOT)/Gemfile.lock
	cd $(ROOT) && bundle install
.PHONY: clean-gems