use CORBA::ORBit idl => [ "Account.idl" ];
use strict;

print "1..3\n";

my $orb = CORBA::ORB_init("orbit-local-orb");

# Test user defined type
{
    my $tc = CORBA::TypeCode->new("IDL:Account/BaseAccount:1.0");
    if ( $tc ) {
	print "ok 1\n";
    } else {
	print "not ok 1\n";
    }

    my $id = $tc->id();
    if ( $id eq "IDL:Account/BaseAccount:1.0" ) {
	print "ok 2\n";
    } else {
	print "not ok 2\n";
    }

    my $name = $tc->name();
    if ( $name eq "BaseAccount" ) {
	print "ok 3\n";
    } else {
	print "not ok 3\n";
    }
}
