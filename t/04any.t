use CORBA::ORBit;
use strict;

my $orb = CORBA::ORB_init("orbit-local-orb");

print "1..3\n";

my $tc = CORBA::TypeCode->new("IDL:omg.org/CORBA/Long:1.0");
if ( $tc ) {
    print "ok 1\n";
} else {
    print "not ok 1\n";
}

my $any = CORBA::Any->new($tc, 42);
if ( $any ) {
    print "ok 2\n";
} else {
    print "not ok 2\n";
}

my $val = $any->value();
if ( $val == 42 ) {
    print "ok 3\n";
} else {
    print "not ok 3\n";
}
