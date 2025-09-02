# ============================================================================
# Resolve directories (always end with /) and log them for audit trail
# ============================================================================
HERE := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
TOP  := $(abspath $(HERE)/../)

$(info [cddl/Makefile] HERE = $(HERE))
$(info [cddl/Makefile] TOP  = $(TOP))

# ============================================================================
# Prefer local tools.mk; fallback to parent's tools.mk
# ============================================================================
TOOLS_MK := $(TOP)/tools.mk
include $(TOOLS_MK)
$(info [cddl/Makefile] TOOLS_MK = $(TOOLS_MK))

# ==== Targets ====
.DEFAULT_GOAL := check-satp-examples

include $(HERE)/frags.mk

# Validation target against the schema (strip comments first)
include $(TOP)/funcs.mk

EXAMPLES_JSONC := $(wildcard $(TOP)/examples/json/*.jsonc)
$(eval $(call CHECK_JSONC_EXAMPLES,satp,$(EXAMPLES_JSONC)))

# Schema self-check (syntax, etc.)
.PHONY: check-schema
check-schema:
	$(MAKE) -C $(TOP) check-schema

# Generate autogen-mw.cddl from fragments listed in frags.mk
include $(TOP)/cddl/frags.mk

.PHONY: autogen
autogen: autogen-mw.cddl

.PHONY: clean
clean::
	rm -rf $(HERE)/*autogen.cddl ; rm -rf $(EXAMPLES_JSONC:.jsonc=.json)
