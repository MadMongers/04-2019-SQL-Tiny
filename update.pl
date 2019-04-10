#!/usr/bin/env perl
use strict; use warnings; use feature 'say'; use Carp 'croak';

use DBI;
use SQL::Tiny ':all';

my ($dbname, $sth) = qw(cjdate.db);
my $dbh = DBI->connect("dbi:SQLite:dbname=$dbname","","",
    { sqlite_unicode => 1, AutoCommit     => 1, RaiseError     => 1, },) or
    croak "failed to connect to SQLite3 database:DBI->errstr()";

my ($sql,$binds) = sql_update(
    'supplier',		# Table
    {
        status     => 5,        # values
    },
    {
        sname => 'Clark',       # where
    },
);
$sth = $dbh->prepare($sql);
$sth->execute(@$binds);
say "Rows effected ", $sth->rows;

$sth->finish();
$dbh->disconnect();
exit(0);
