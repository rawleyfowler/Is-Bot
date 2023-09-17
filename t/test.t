use Test::More;

use strict;
use warnings;

BEGIN {
    use_ok 'Is::Bot';
}

use Is::Bot qw(is_bot);

ok is_bot('perl');
ok is_bot('java');
ok not is_bot('adskldasjadaskjdasjkladsjkladsjkldjkladsjkladsjkla');
ok not is_bot('Mozilla/5.0 (X11; Linux x86_64; rv:109.0)');

done_testing;
