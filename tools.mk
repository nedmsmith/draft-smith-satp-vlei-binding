# cddl and curl are prerequisite
# fail hard if they are not found

cddl ?= $(shell command -v cddl)
ifeq ($(strip $(cddl)),)
$(error cddl not found. To install cddl: 'gem install cddl')
endif

cddlc ?= $(shell command -v cddl)
ifeq ($(strip $(cddlc)),)
$(error cddlc not found. To install cddlc: 'gem install cddlc')
endif

curl ?= $(shell command -v curl)
ifeq ($(strip $(curl)),)
$(error curl not found)
endif

#export BUNDLE := bundle exec
export BUNDLE := 
export CDDL    := $(BUNDLE) cddl
export CDDLc   := $(BUNDLE) cddlc
export CURL   := $(BUNDLE) curl

#$(info [tools.mk] CDDL = $(CDDL))
#$(info [tools.mk] CDDLc = $(CDDLc))
#$(info [tools.mk] CURL = $(CURL))