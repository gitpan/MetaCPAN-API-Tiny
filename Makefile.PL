
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "A Tiny API client for MetaCPAN",
  "AUTHOR" => "Nicholas R. Perez <nperez\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Exporter" => "5.57",
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "MetaCPAN-API-Tiny",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "MetaCPAN::API::Tiny",
  "PREREQ_PM" => {
    "Carp" => 0,
    "HTTP::Tiny" => "0.017",
    "JSON::PP" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.131730",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



