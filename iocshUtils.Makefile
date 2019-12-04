#
#  Copyright (c) 2019    European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
#
# 
# Author  : Jeong Han Lee
# email   : jeonghan.lee@gmail.com
# Date    : Wednesday, December  4 10:55:29 CET 2019
# version : 0.0.1
#

## The following lines are mandatory, please don't change them.
where_am_I := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
include $(E3_REQUIRE_TOOLS)/driver.makefile
include $(E3_REQUIRE_CONFIG)/DECOUPLE_FLAGS


## Exclude linux-ppc64e6500
##EXCLUDE_ARCHS += linux-ppc64e6500
##EXCLUDE_ARCHS += linux-corei7-poky


DBDS = -none-

SOURCES      += listRecords.c
DBDS_3.14    += listRecords.dbd

SOURCES      += updateMenuConvert.c
DBDS_3.14    += updateMenuConvert.dbd

SOURCES      += addScan.c
DBDS_3.14    += addScan.dbd

SOURCES      += dbll.c
DBDS_3.14    += dbll.dbd

## cal.c
## EPICS base server.h is needed
## However, the default BASE doesn't install it
## Unfornately, EPICS 7 now has three one
## So, we exclude it now
## Wednesday, December  4 11:03:57 CET 2019, jhlee
##
##./modules/pva2pva/p2pApp/server.h
##./modules/database/src/ioc/rsrv/server.h
##./modules/pvAccess/src/server/pva/server.h

#SOURCES      += cal.c
#DBDS_3.14    += cal.dbd

SOURCES_3.13 += glob.c

SOURCES_3.14 += disctools.c
DBDS_3.14    += disctools.dbd

SOURCES      += exec.c
DBDS_3.14    += exec.dbd

SOURCES_3.14 += mlock.c
DBDS_3.14    += mlock.dbd

SOURCES_3.14 += ulimit.c
DBDS_3.14    += ulimit.dbd

SOURCES      += epicsEnvUnset.c
DBDS_3.14    += epicsEnvUnset.dbd

ifndef BASE_3_16
SOURCES_3.14 += setMaxArrayBytes.c
SOURCES_3.14 += caFieldSize.c
DBDS_3.14    += setMaxArrayBytes.dbd
endif

SOURCES      += echo.c
DBDS_3.14    += echo.dbd

ifndef BASE_7_0
SOURCES_3.14 += dbli.c
DBDS_3.14    += dbli.dbd
endif

SOURCES_3.14 += dbla.c
DBDS_3.14    += dbla.dbd

#SOURCES_3.14 += termSig.c
#DBDS_3.14 += termSig.dbd

SOURCES_3.14 += threads.c
DBDS_3.14 += threads.dbd

#SOURCES_vxWorks += bootNotify.c



SCRIPTS += $(wildcard ../iocsh/*.iocsh)


db: 

.PHONY: db 


vlibs:

.PHONY: vlibs
