#/etc/vsftpd/Makefile 

passwd_ftp: cleartext
	rm -f $@
	touch $@ 
	chmod 600 $@ 
	./filter.pl $< > $@

