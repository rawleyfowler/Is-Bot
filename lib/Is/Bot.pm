use strict;
use warnings;

use utf8;

use Exporter qw(import);

our $VERSION = '0.001';

our @EXPORT_OK = qw(is_bot);

# Credits to: https://github.com/omrilotan/isbot
my $list = [
    qr/\sdaum[ \/]/,
    qr/\sdeusu\//,
    qr/\syadirectfetcher/,
    qr/(?:^|\s)site/,
    qr/(?:^|[^g])news/,
    qr/@[a-z]/,
    qr/\\(at\\)[a-z]/,
    qr/\(github\.com/,
    qr/\\[at\\][a-z]/,
    qr/^12345/,
    qr/^</,
    qr/[\s]{50,}/,
    qr/^active/,
    qr/^ad muncher/,
    qr/^amaya/,
    qr/^anglesharp/,
    qr/^anonymous/,
    qr/^avsdevicesdk/,
    qr/^axios/,
    qr/^bidtellect/,
    qr/^biglotron/,
    qr/^btwebclient/,
    qr/^castro/,
    qr/^clamav[\s\/]/,
    qr/^client/,
    qr/^cobweb/,
    qr/^coccoc/,
    qr/^custom/,
    qr/^ddg[_-]android/,
    qr/^discourse/,
    qr/^dispatch\/\d/,
    qr/^downcast/,
    qr/^duckduckgo/,
    qr/^facebook/,
    qr/^fdm[\s\/]\d/,
    qr/^getright/,
    qr/^gozilla/,
    qr/^hatena/,
    qr/^hobbit/,
    qr/^hotzonu/,
    qr/^hwcdn/,
    qr/^jeode/,
    qr/^jetty/,
    qr/^jigsaw/,
    qr/^linkdex/,
    qr/^lwp[-:\s]/,
    qr/^metauri/,
    qr/^microsoft\sbits/,
    qr/^movabletype/,
    qr/^mozilla\/\d\.\d\s(compatible;?\\)$/,
    qr/^mozilla\/\d\.\d\s\w*$/,
    qr/^navermailapp/,
    qr/^netsurf/,
    qr/^offline\sexplorer/,
    qr/^php/,
    qr/^postman/,
    qr/^postrank/,
    qr/^python/,
    qr/^read/,
    qr/^reed/,
    qr/^restsharp/,
    qr/^snapchat/,
    qr/^space\sbison/,
    qr/^svn/,
    qr/^swcd\s/,
    qr/^taringa/,
    qr/^test\scertificate\sinfo/,
    qr/^thumbor/,
    qr/^tumblr/,
    qr/^user-agent:mozilla/,
    qr/^valid/,
    qr/^venus\/fedoraplanet/,
    qr/^w3c/,
    qr/^webbandit/,
    qr/^webcopier/,
    qr/^wget/,
    qr/^whatsapp/,
    qr/^xenu\slink\ssleuth/,
    qr/^yahoo/,
    qr/^yandex/,
    qr/^zdm\/\d/,
    qr/^zoom\smarketplace/,
    qr/^\{\{.*\}\}$/,
    qr/adbeat\.com/,
    qr/appinsights/,
    qr/archive/,
    qr/ask\sjeeves\/teoma/,
    qr/bit\.ly/,
    qr/bluecoat\sdrtr/,
    qr/bot/,
    qr/browsex/,
    qr/burpcollaborator/,
    qr/capture/,
    qr/catch/,
    qr/check/,
    qr/chrome-lighthouse/,
    qr/chromeframe/,
    qr/cloud/,
    qr/crawl/,
    qr/cryptoapi/,
    qr/dareboost/,
    qr/datanyze/,
    qr/dataprovider/,
    qr/dejaclick/,
    qr/dmbrowser/,
    qr/download/,
    qr/evc-batch.*/,
    qr/feed/,
    qr/firephp/,
    qr/freesafeip/,
    qr/ghost/,
    qr/gomezagent/,
    qr/google/,
    qr/headlesschrome/,
    qr/http/,
    qr/httrack/,
    qr/hubspot\smarketing\sgrader/,
    qr/hydra/,
    qr/ibisbrowser/,
    qr/images/,
    qr/iplabel/,
    qr/ips-agent/,
    qr/java/,
    qr/library/,
    qr/mail\.ru/,
    qr/manager/,
    qr/monitor/,
    qr/morningscore/,
    qr/neustar\swpm/,
    qr/nutch/,
    qr/offbyone/,
    qr/optimize/,
    qr/pageburst/,
    qr/pagespeed/,
    qr/perl/,    # :(
    qr/phantom/,
    qr/pingdom/,
    qr/powermarks/,
    qr/preview/,
    qr/proxy/,
    qr/ptst[\s\/]\d/,
    qr/reader/,
    qr/rexx;/,
    qr/rigor/,
    qr/rss/,
    qr/scan/,
    qr/scrape/,
    qr/search/,
    qr/serp\s\?reputation\s\?management/,
    qr/server/,
    qr/sogou/,
    qr/sparkler/,
    qr/speedcurve/,
    qr/spider/,
    qr/splash/,
    qr/statuscake/,
    qr/stumbleupon\.com/,
    qr/supercleaner/,
    qr/synapse/,
    qr/synthetic/,
    qr/taginspector/,
    qr/torrent/,
    qr/tracemyfile/,
    qr/transcoder/,
    qr/trendsmapresolver/,
    qr/twingly\srecon/,
    qr/url/,
    qr/virtuoso/,
    qr/wappalyzer/,
    qr/webglance/,
    qr/webkit2png/,
    qr/websitemetadataretriever/,
    qr/whatcms/,
    qr/wordpress/,
    qr/zgrab/
];

sub is_bot {
    my $str = exists $_[1] ? $_[1] : $_[0];
    foreach my $p (@$list) {
        return 1 if $str =~ $p;
    }

    return undef;
}

=encoding utf8

=head1 Name

Is::Bot

=head1 Synopsis

Is::Bot is a super simple way to test if a User-Agent header is possbily a bot.

=head2 Example

    use Is::Bot qw(is_bot);
    is_bot('axios'); # true
    is_bot('Mozilla/5.0 (X11; Linux x86_64; rv:109.0)'); # false

or

    Is::Bot->is_bot('axios'); # true

or

    Is::Bot::is_bot('axios'); # true

=head1 API

=head2 is_bot

Determines if the given string (only parameter) is a bot or not.

=head2 License

Is::Bot is provided under the Artistic 2.0 license.
