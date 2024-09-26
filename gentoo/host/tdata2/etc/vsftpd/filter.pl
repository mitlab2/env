#!/usr/bin/perl -w

use strict;

# filter "user:cleartext" lines into "user:md5_crypted" 
# probably requires glibc 

    while (<>) {
        chomp;
        (my $user, my $pass) = split /:/, $_, 2;
        my $crypt = crypt $pass, '$1$' . gensalt(8);
        print "$user:$crypt\n";
    }

    sub gensalt {
        my $count = shift;
        my @salt = ('.', '/', 0 .. 9, 'A' .. 'Z', 'a' .. 'z');
        my $s;
        $s .= $salt[rand @salt] for (1 .. $count);
        return $s;
    }
