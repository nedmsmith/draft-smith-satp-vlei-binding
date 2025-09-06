# cddl and curl are prerequisite
# fail hard if they are not found

$(info $(shell which cddl))
cddl ?= $(shell command -v cddl)
ifeq ($(strip $(cddl)),)
$(info $(shell which cddl))
$(error cddl not found. To install cddl: 'gem install cddl')
endif

$(info $(shell which cddlc))
cddlc ?= $(shell command -v cddlc)
ifeq ($(strip $(cddlc)),)
$(info $(shell which cddlc))
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

#export BUNDLE := bundle exec
#export BUNDLE := 
#export CDDL    := $(BUNDLE) cddl
#export CDDLc   := $(BUNDLE) cddlc
#export CURL   := $(BUNDLE) curl

#$(info [tools.mk] CDDL = $(CDDL))
#$(info [tools.mk] CDDLc = $(CDDLc))
#$(info [tools.mk] CURL = $(CURL))