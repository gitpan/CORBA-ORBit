use CORBA::ORBit;
use strict;

print "1..1\n";

my $orb = CORBA::ORB_init("orbit-local-orb");
if ( $orb ) {
    print "ok 1\n";	
} else {
    print "not ok 1\n";
}
