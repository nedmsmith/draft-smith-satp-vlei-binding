# $1: label
# $2: list of .jsonc files
define CHECK_JSONC_EXAMPLES

# Convert .jsonc to .json
%.json: %.jsonc
	@echo ">>> Converting $$< to $$@"
	@sed -e 's://.*$$$$::' -e '/\/\*/,/\*\//d' "$$<" > "$$@"
CLEANFILES += $(2:.jsonc=.json)

check-$(1): $(1)-autogen.cddl
	$$(cddl) $$< g 1 | $$(diag2diag) -e

.PHONY: check-$(1)

$(1)-autogen.cddl: $(addprefix $(HERE),$(CDDL_FRAGS))
	@echo "==> Creating autogen file: $(1)-autogen.cddl from fragments: $(CDDL_FRAGS)"
	@for f in $$^ ; do ( grep -v '^;' $$$$f ; echo ) ; done > $$@

.PHONY: $(1)-autogen.cddl
CLEANFILES += $(1)-autogen.cddl

# @$$(cddl) --version >/dev/null 2>&1 || (echo "Missing CDDL tool" && exit 1)
# @test -n "$$<" || (echo "ERROR: SCHEMA is empty" && exit 1)
# if [ $$? -ne 0 ]; then echo "Validation failed for $$$$f" ; fail=1 ; fi ; \

check-$(1)-examples: $(1)-autogen.cddl $(2:.jsonc=.json)
	@echo "==> Toolchain versions" $(CDDL)
	@echo "==> Checking $(words $(2)) example(s) against schema: $(1)-autogen.cddl"
	@{ \
		for f in $(2:.jsonc=.json); do \
			echo ">>> Validating $$$$f against $$<" ; \
			{ printf '\033[1;33m--- %s\033[0m\n' "$$$$f" 1>&2; } && sync; \
			$$(cddl) $(1)-autogen.cddl validate $$$$f || (echo "Validation failed"; exit 1); \
		done; \
	}

.PHONY: check-$(1)-examples
endef # CHECK_JSONC_EXAMPLES

# example usage: $(eval $(call CHECK_JSONC_EXAMPLES,satp,$(EXAMPLES_JSONC)))