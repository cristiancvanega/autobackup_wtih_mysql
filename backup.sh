#!/bin/bash
THEDB=""
THEDBUSER=""
THEDBPW=""
THEDATE=`date +%d%m%y%H%M`"_CRM.tar.gz"

mkdir ~/backups
mysqldump -u $THEDBUSER -p${THEDBPW} $THEDB > ~/backups/pikaritas_site.sql
cp -R /var/www/html/pikaritas_site ~/backups/
tar czvf $THEDATE ~/backups/*
mv $THEDATE ~/Dropbox/pikaritas/
rm -Rf ~/backups/
/etc/init.d/dropbox.py start

