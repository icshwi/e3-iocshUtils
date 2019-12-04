
e3-iocshUtils  
======
ESS Site-specific EPICS module : iocshUtils

## PSI iocsh_utilities 

However, we exclude `cal.c` now, because it needs the `./modules/database/src/ioc/rsrv/server.h` in EPICS base. By default, EPICS base doesn't install it. 

## How to add a new breakpoint table

1) In the src directory of your app, create a breakpoint table file `<bptname>.dbd`. The format should be like the following, where in each line the first is the RAW value and the second the EGU value
```
breaktable(bptname) {
         0.0000 0.0000
         25.4 5.56
         50.8 21.996
         76.2 49.336
         101.6 87.434
         127 136.186
         ............
        }
```
or Look at `<epicsbase>/dbd/bpt*.dbd` for the proper format

2) In your `<yourapp>.Makefile` add this line `DBDS += $(APPSRC)/<bptname>.dbd`

3) In your .db file you should have something like this

```
record(ai, mycalibvar) {
  field(DTYP, "Raw Soft Channel")
  field(INP, "mycalcvar")
  field(LINR, <bptname>)
  .......
}
```

4) Do `make rebuild`

5) In your startup script add those two lines 

```
....
require iocshUtils,2.10.0
updateMenuConvert
```

6) Run your IOC

7) Inside the IOC you can run `dbDumpMenu` and `dbDumpBreaktable` to check that actually your setting is correct
