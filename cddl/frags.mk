# frags.mk — ordered list of schema fragments
CDDL_FRAGS := msg-wrapper.cddl
CDDL_FRAGS += media-types.cddl
# Later you can append more:
# CDDL_FRAGS += numeric-expr.cddl
# CDDL_FRAGS += tee-attributes-type.cddl
# …
export CDDL_FRAGS
