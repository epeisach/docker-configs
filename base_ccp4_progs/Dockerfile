FROM ubuntu:22.10 as builder

RUN apt-get -qq update

# jhbuild requires python2
RUN apt-get -qq -y install python2

RUN apt-get -qq -y install gcc g++  make cmake gfortran automake 

RUN mkdir -p /opt/ccp4
COPY ccp4-progs-20230620.tar.gz .

RUN gzip -d -c  ccp4-progs-20230620.tar.gz | tar -x

# Adjust build config
RUN (cd ccp4-progs; echo "" >> cj.rc ; echo "nonetwork=True" >> cj.rc ;  echo "prefix='/opt/ccp4'" >> cj.rc)

# The LD_LIBRARY_PATH as building ccif will fails... Must be implicit on some O/S

RUN (cd ccp4-progs; export JHBUILD_RUN_AS_ROOT=1; export LD_LIBRARY_PATH=.;  ./devtools/cj --no-interact build ccp4-progs)

#######################
#
FROM ubuntu:22.10

RUN apt-get -qq update
RUN apt-get -qq -y install libgfortran5

RUN mkdir -p /opt/ccp4
COPY --from=builder /opt/ccp4 /opt/ccp4

# Setup license
RUN /opt/ccp4/BINARY.setup --run-from-script --minimal