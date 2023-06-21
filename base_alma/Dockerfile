# Minimal image to install python base code
FROM almalinux:8

RUN yum -y install wget
RUN yum -y install tcsh lsof gcc gcc-c++ bison flex make
# RUN yum install rsync cvs subversion git


# python3 for site-config
RUN yum -y install python3 python3-configobj

# mmysql-devel for wwpdb.utils.db (should be mariadb)
RUN yum -y install mysql-devel
#RUN yum -y install mariadb-devel

# for mysql_config to run - which requires our "rpm" to run
RUN yum -y install nss

# For installation emda
RUN yum -y install gcc-gfortran
# Cleanup
RUN yum clean all

RUN mkdir /wwpdb_da
RUN mkdir /wwpdb_da/da_top
VOLUME /tools
VOLUME /site-config
RUN ln -s /tools /wwpdb_da/da_top/tools-centos-7-v3300-a
RUN ln -s tools-centos-7-v3300-a /wwpdb_da/da_top/tools
RUN ln -s /site-config /wwpdb_da/site-config
RUN ln -s /onedep_admin /wwpdb_da/da_top/onedep_admin
#RUN ls -l /wwpdb_da/da_top

RUN useradd -ms /bin/bash  wwpdbdev
RUN chown wwpdbdev  /wwpdb_da/da_top

USER wwpdbdev