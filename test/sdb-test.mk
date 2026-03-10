MAKEFILE_PATH:=$(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR:=$(abspath $(patsubst %/,%,$(dir $(MAKEFILE_PATH))))

SRCDIR=${CURRENT_DIR}/../src
INCDIR=${CURRENT_DIR}/../include
BASEDIR?=${SRCDIR}
SDB_LIB?=${BASEDIR}/libsdb.a
SDB_CFLAGS+=-I${INCDIR} -I${BASEDIR} ${USER_CFLAGS}
SDB_LDFLAGS+=${SDB_LIB} ${USER_LDFLAGS}
SDB=${BASEDIR}/sdb

${SDB_LIB}:
	$(MAKE) -C ${BASEDIR} libsdb.a

${SDB}:
	$(MAKE) -C ${BASEDIR} sdb
