# cddl and curl are prerequisite
# fail hard if they are not found
$(info Ruby: $(shell ruby -v 2>/dev/null))
$(info Bundler: $(shell bundler -v 2>/dev/null))
$(info PATH: $(PATH))

cddl ?= $(shell command -v cddl)
ifeq ($(strip $(cddl)),)
$(error cddl not found. To install cddl: 'gem install cddl')
endif

cddlc ?= $(shell command -v cddlc)
ifeq ($(strip $(cddlc)),)
$(error cddlc not found. To install cddlc: 'gem install cddlc')
endif

curl ?= $(shell command -v curl)
ifeq ($(strip $(curl)),)
$(error curl not found)
endif

diag2diag ?= $(shell command -v diag2diag.rb)
ifeq ($(strip $(diag2diag)),)
$(error diag2diag.rb not found. To install diag2diag.rb: 'gem install cbor-diag')
endif
