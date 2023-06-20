#!/bin/sh

# Currently centos 7 - easy to get python2 and bzr
rm -rf devtools
rm -rf ccp4-progs

echo "Doing checkout"
mkdir ccp4-progs
(cd ccp4-progs; bzr checkout http://fg.oisin.rc-harwell.ac.uk/anonscm/bzr/series-80/devtools)

cp cj.rc ccp4-progs/

echo "Checking out source tree"
(cd ccp4-progs; ./devtools/cj  update ccp4-progs)

out=ccp4-progs-`date +%Y%m%d`.tar
tar cvf $out ccp4-progs
gzip -9fv $out



