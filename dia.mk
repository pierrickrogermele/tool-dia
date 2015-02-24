# Makefile to include

THIS_DIR = $(dir $(lastword $(MAKEFILE_LIST)))
OS = $(shell uname -s)
DIA = dia
SED = sed

##############
# EPS <- DIA #
##############

%.eps: %.dia
	$(DIA) -e $@ -t eps-builtin $<

#############
# MP <- DIA #
#############

%.mp: %.dia
	$(DIA) -e $@ -t mp $<
	$(SED) -ie '1s/^/filenametemplate "%j.mps";/' $@
