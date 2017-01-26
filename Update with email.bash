#!/bin/bash
tmpfile=$( /bin/mktemp -t )
myname=email@address.com
/bin/echo return-path: $myname >> $tmpfile
/bin/echo for: $myname >> $tmpfile
/bin/echo from: $myname >> $tmpfile
/bin/echo to: $myname >> $tmpfile
/bin/echo subject: Linux Update Status >> $tmpfile
/bin/echo Hello there ROOT... this is an informational message: >> $tmpfile
/bin/echo >> $tmpfile
/bin/echo APT-GET Update was run: $( /bin/date +%c ) >> $tmpfile
/bin/echo >> $tmpfile
/bin/echo -n "Result: " >> $tmpfile
/usr/bin/apt-get -qy update > /dev/null
/usr/bin/apt-get -qy dist-upgrade | grep -i installed >> $tmpfile
/bin/echo >> $tmpfile
/bin/echo Yours truly, "Your Linux Computer" >> $tmpfile
/bin/echo >> $tmpfile
/bin/cat $tmpfile | sendmail -t
/bin/rm $tmpfile
exit 0