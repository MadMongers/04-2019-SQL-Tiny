#!/usr/bin/env perl
use strict; use warnings; use feature 'say'; use Carp 'croak';

use DBI;
use SQL::Tiny ':all';

my ($dbname, $user, $pword, $sth) = ('cjdate.db', '', '',);
my $dbh = DBI->connect("dbi:SQLite:dbname=$dbname", $user, $pword,
    { sqlite_unicode => 1, AutoCommit => 1, PrintWarn          => 1,
      PrintError     => 1, RaiseError => 0, ShowErrorStatement => 1, },) or
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
$sth = $dbh->prepare($sql)  or croak '';
$sth->execute(@$binds)      or croak '';
#$sth = $dbh->prepare($sql)  or croak "prepare statement failed: $DBI::errstr()";
#$sth->execute(@$binds)  or croak "execution failed: $DBI::errstr()";

($sql,$binds) = sql_insert(
    'supplier',
    {
            sid     => 'S2',
            sname   => 'Jones',
            status  => 10,
            city    => 'Paris',
    }
);
$sth = $dbh->prepare($sql)  or croak '';
$sth->execute(@$binds)      or croak '';
#$sth = $dbh->prepare($sql)  or croak "prepare statement failed: $DBI::errstr()";
#$sth->execute(@$binds)  or croak "execution failed: $DBI::errstr()";

($sql,$binds) = sql_insert(
    'supplier',
    {
            sid     => 'S3',
            sname   => 'Blake',
            status  => 30,
            city    => 'Paris',
    }
);
$sth = $dbh->prepare($sql)  or croak '';
$sth->execute(@$binds)      or croak '';
#$sth = $dbh->prepare($sql)  or croak "prepare statement failed: $DBI::errstr()";
#$sth->execute(@$binds)  or croak "execution failed: $DBI::errstr()";

($sql,$binds) = sql_insert(
    'supplier',
    {
            sid     => 'S4',
            sname   => 'Clark',
            status  => 20,
            city    => 'London',
    }
);
$sth = $dbh->prepare($sql)  or croak '';
$sth->execute(@$binds)      or croak '';
#$sth = $dbh->prepare($sql)  or croak "prepare statement failed: $DBI::errstr()";
#$sth->execute(@$binds)  or croak "execution failed: $DBI::errstr()";

($sql,$binds) = sql_insert(
    'supplier',
    {
            sid     => 'S5',
            sname   => 'Adams',
            status  => 30,
            city    => 'Athens',
    }
);
$sth = $dbh->prepare($sql)  or croak '';
$sth->execute(@$binds)      or croak '';
#$sth = $dbh->prepare($sql)  or croak "prepare statement failed: $DBI::errstr()";
#$sth->execute(@$binds)  or croak "execution failed: $DBI::errstr()";

$sth->finish();
$dbh->disconnect();

exit(0);

