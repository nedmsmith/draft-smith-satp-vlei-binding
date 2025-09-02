# ==== Environment Setup ====
ROOT := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
TOP := $(abspath $(ROOT))
LIBDIR := lib
CDDL_DIR := $(TOP)/cddl

SHELL := /bin/bash
.SHELLFLAGS := -lc
export SHELL .SHELLFLAGS TOP

# ==== Tool Detection ====
TOOLS_MK := $(TOP)/tools.mk
include $(TOOLS_MK)
$(info [cddl/Makefile] TOOLS_MK = $(TOOLS_MK))
# ==== Main Template ====
include $(LIBDIR)/main.mk
# ==== Functions ====
include $(TOP)/funcs.mk
EXAMPLES_JSONC := $(wildcard $(TOP)/examples/json/*.jsonc)
export SCHEMA := $(CDDL_DIR)/autogen-mw.cddl

$(eval $(call CHECK_JSONC_EXAMPLES,satp,$(EXAMPLES_JSONC)))

$(LIBDIR)/main.mk:
ifneq (,$(shell grep "path *= *$(LIBDIR)" .gitmodules 2>/dev/null))
	git submodule sync
	git submodule update --init
else ifneq (,$(wildcard $(ID_TEMPLATE_HOME)))
	ln -s "$(ID_TEMPLATE_HOME)" $(LIBDIR)
else
	git clone -q --depth 10 -b main https://github.com/martinthomson/i-d-template $(LIBDIR)
endif

# ==== Targets ====
.DEFAULT_GOAL := build-doc

.PHONY: build-doc check-satp-examples check-schema clean clean-gems check-path

build-doc: check-satp-examples
	$(MAKE) draft-smith-satp-vlei-binding.txt
	$(MAKE) draft-smith-satp-vlei-binding.html

check-schema:
	$(CDDL) $(SCHEMA) info

clean::
	$(MAKE) -C cddl clean

clean-gems:
	rm -rf $(ROOT)/lib/.gems $(ROOT)/Gemfile.lock
	cd $(ROOT) && bundle install

check-path:
	@echo "[RECIPE] PATH = $$PATH"
	@$(BUNDLE) which cddl
