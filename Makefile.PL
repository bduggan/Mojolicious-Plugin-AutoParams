use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Mojolicious::Plugin::AutoParams',
    AUTHOR           => q{Brian Duggan <bduggan@matatu.org>},
    VERSION_FROM     => 'lib/Mojolicious/Plugin/AutoParams.pm',
    ABSTRACT_FROM    => 'lib/Mojolicious/Plugin/AutoParams.pm',
    LICENSE          => 'Artistic_2_0',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        'Mojolicious' => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Mojolicious-Plugin-AutoParams-*' },
);
