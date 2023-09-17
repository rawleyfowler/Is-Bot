use strict;
use warnings;

use utf8;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'Is::Bot',
    VERSION_FROM => 'lib/Is/Bot.pm',
    ABSTRACT     => qq{A Perl port of the JavaScript library 'isbot'.},
    license      => 'artistic_2',
    META_MERGE   => {
        dynamic_config => 0,
        'meta-spec'    => { version   => 2 },
        no_index       => { directory => [ 'examples', 't' ] },
        prereqs        => { runtime   => { requires => { perl => '5.008' } } },
        resources      => {
            bugtracker =>
              { web => 'https://github.com/rawleyfowler/Is-Bot/issues' },
            license =>
              [qq{http://www.opensource.org/licenses/artistic-license-2.0}],
            repository => {
                type => 'git',
                url  => 'https://github.com/rawleyfowler/Is-Bot'
            }
        },
    },
    Prereq_PM => {
        'Test::Simple' => '1.302195'
    },
    test => { TESTS => 't/*.t t/*/*.t it/*.t it/*/*.t' }
);
