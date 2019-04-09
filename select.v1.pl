#!/usr/bin/env perl
use strict; use warnings; use feature 'say'; use Carp 'croak';

use DBI;
use SQL::Tiny ':all';

my ($dbname, $user, $pword, $sth) = ('cjdate.db', '', '',);
my $dbh = DBI->connect("dbi:SQLite:dbname=$dbname", $user, $pword,
    { sqlite_unicode => 1, AutoCommit => 1, PrintWarn          => 1,
      PrintError     => 0, RaiseError => 1, ShowErrorStatement => 1, },) or
    croak "failed to connect to MySQL database:DBI->errstr()";

my ($sql,$binds) = sql_select(
    'supplier',               # table
    [qw( sid sname )],        # columns
    { status => '30' },       # where
    { group_by => 'sname' },  # can contain group_by and order_by.
    );

$sth = $dbh->prepare($sql);
$sth->execute(@$binds);

my ($sid, $sname);
$sth->bind_col( 1, \$sid);
$sth->bind_col( 2, \$sname);

#while ($sth->fetch) {
while ($sth->fetchrow_arrayref) {
    say "$sid--$sname";
}

$sth->finish();
$dbh->disconnect();
exit(0);
