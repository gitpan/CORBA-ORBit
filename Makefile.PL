use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

@OBJECTS = qw(ORBit.o
	      client.o
	      demarshal.o 
	      errors.o
              extras.o
	      exttypes.o
              idl.o
	      interfaces.o 
	      marshal.o
              server.o
	      types.o);

$orbit_version = `orbit-config --version`;
undef $orbit_version if $?;

if (!defined $orbit_version) {
    print STDERR "orbit-config not found\n";
    exit 1;
}

my ($a,$b,$c) = $orbit_version =~ /ORBit\s+(\d+).(\d+).(\d+)/;

if (defined $a) {
    my $version = $a * 1000 + $b + $c / 1000;
    if ($version < 5.013) {
	print STDERR "CORBA::ORBit requires ORBit 0.5.13 or better\n";
	exit 1;
    }
} else {
    print STDERR "Could not parse version string '$orbit_version', assuming OK\n";
}

chomp($orbit_cflags = `orbit-config --cflags client server`);
chomp($orbit_libs = `orbit-config --libs client server`);

if ($] < 5.0045) {
    print STDERR "Using compatibility macros/routines for Perl 5.004\n";
    push @OBJECTS,'constsub.o';
}

WriteMakefile(
    'NAME'	=> 'CORBA::ORBit',
    'VERSION_FROM' => 'ORBit.pm',
    'PREREQ_PM' => { 'Error' => 0.12 },
    'LIBS'	=> [$orbit_libs." -lIDL"],
    'DEFINE'	=> ($] < 5.0045         ? '-DPERL5004_COMPAT ' : ''),
    'INC'	=> $orbit_cflags,
    'OBJECT'    => join(' ', @OBJECTS),
    'XSOPT'     => '-prototypes',
#    'XSOPT'     => '-nolinenumbers',
#    'OPTIMIZE'  => '-g',
#    'OPTIMIZE'  => '-O2 -Wall',
#    'MAP_TARGET' => 'orbitperl',
#    'MAKEAPERL' => 1,
    'dist'      => { COMPRESS => 'gzip', SUFFIX => 'gz' }
);
