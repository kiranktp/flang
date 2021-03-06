#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#
ab01: ab01.$(OBJX)
	@echo ------------ executing test $@
	-$(RUN2) ./a.$(EXESUFFIX) $(LOG)
ab01.$(OBJX): $(SRC)/ab01.f check.$(OBJX)
	@echo ------------ building test $@
	-$(FC) $(FFLAGS) $(SRC)/ab01.f
	@$(RM) ./a.$(EXESUFFIX)
	-$(FC) $(LDFLAGS) ab01.$(OBJX) check.$(OBJX) $(LIBS) -o a.$(EXESUFFIX)
build: ab01
run: ;
