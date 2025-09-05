.DEFAULT_GOAL := check
# ============================================================================
# Resolve directories (always end with /) and log them for audit trail
# ============================================================================
#export HERE := $(realpath $(dir $(lastword $(MAKEFILE_LIST))/))
export HERE := ./
export TOP  := ../

$(info [cddl/Makefile] HERE = $(HERE))
$(info [cddl/Makefile] TOP  = $(TOP))

# ============================================================================
# Prefer local tools.mk; fallback to parent's tools.mk
# ============================================================================
#TOOLS_MK := $(HERE)tools.mk
#include $(TOOLS_MK)
#$(info [cddl/Makefile] TOOLS_MK = $(TOOLS_MK))

include $(HERE)frags.mk

include $(HERE)funcs.mk

check:: check-satp check-satp-examples

EXAMPLES_JSONC := $(wildcard $(TOP)examples/json/*.jsonc)

$(eval $(call CHECK_JSONC_EXAMPLES,satp,$(EXAMPLES_JSONC)))

clean::
	rm -rf $(HERE)*autogen.cddl ; rm -rf $(EXAMPLES_JSONC:.jsonc=.json)
.PHONY: clean