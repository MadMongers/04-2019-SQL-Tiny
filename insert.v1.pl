#!/usr/bin/env perl
use strict; use warnings; use feature 'say'; use Carp 'croak';

use DBI;
use SQL::Tiny ':all';

my ($dbname, $user, $pword, $sth) = ('cjdate.db', '', '',);
my $dbh = DBI->connect("dbi:SQLite:dbname=$dbname", $user, $pword,
    { sqlite_unicode => 1, AutoCommit => 1, PrintWarn          => 1,
      PrintError     => 0, RaiseError => 1, ShowErrorStatement => 1, },) or
    croak "failed to connect to MySQL database:$DBI::errstr()";

my ($sql,$binds) = sql_insert(
    'supplier',
    {
            sid     => 'S1',
            sname   => 'Smith',
            status  => 20,
            city    => 'London',
    }
);
$sth = $dbh->prepare($sql);
$sth->execute(@$binds);

($sql,$binds) = sql_insert(
    'supplier',
    {
            sid     => 'S2',
            sname   => 'Jones',
            status  => 10,
            city    => 'Paris',
    }
);
$sth = $dbh->prepare($sql);
$sth->execute(@$binds);

($sql,$binds) = sql_insert(
    'supplier',
    {
            sid     => 'S3',
            sname   => 'Blake',
            status  => 30,
            city    => 'Paris',
    }
);
$sth = $dbh->prepare($sql);
$sth->execute(@$binds);

($sql,$binds) = sql_insert(
    'supplier',
    {
            sid     => 'S4',
            sname   => 'Clark',
            status  => 20,
            city    => 'London',
    }
);
$sth = $dbh->prepare($sql);
$sth->execute(@$binds);

($sql,$binds) = sql_insert(
    'supplier',
    {
            sid     => 'S5',
            sname   => 'Adams',
            status  => 30,
            city    => 'Athens',
    }
);
$sth = $dbh->prepare($sql);
$sth->execute(@$binds);

$sth->finish();
$dbh->disconnect();
exit(0);

