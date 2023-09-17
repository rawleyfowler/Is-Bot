use strict;
use warnings;

use utf8;

use Exporter qw(import);

our $VERSION = '0.001';

our @EXPORT_OK = qw(is_bot);

# Credits to: https://github.com/omrilotan/isbot
my $list = [
    /\sdaum[ \/]/,
    /\sdeusu\//,
    /\syadirectfetcher/,
    /(?:^|\s)site/,
    /(?:^|[^g])news/,
    /@[a-z]/,
    /\\(at\\)[a-z]/,
    /\(github\.com/,
    /\\[at\\][a-z]/,
    /^12345/,
    /^</,
    /[\w \.\-\(\)]+(\/v?\d+(\.\d+)?(\.\d{1,10})?)?/,
    /[^\s]{50,}/,
    /^active/,
    /^ad muncher/,
    /^amaya/,
    /^anglesharp/,
    /^anonymous/,
    /^avsdevicesdk/,
    /^axios/,
    /^bidtellect/,
    /^biglotron/,
    /^btwebclient/,
    /^castro/,
    /^clamav[\s\/]/,
    /^client/,
    /^cobweb/,
    /^coccoc/,
    /^custom/,
    /^ddg[_-]android/,
    /^discourse/,
    /^dispatch\/\d/,
    /^downcast/,
    /^duckduckgo/,
    /^facebook/,
    /^fdm[\s\/]\d/,
    /^getright/,
    /^gozilla/,
    /^hatena/,
    /^hobbit/,
    /^hotzonu/,
    /^hwcdn/,
    /^jeode/,
    /^jetty/,
    /^jigsaw/,
    /^linkdex/,
    /^lwp[-:\s]/,
    /^metauri/,
    /^microsoft\sbits/,
    /^movabletype/,
    /^mozilla\/\d\.\d\s(compatible;?\\)$/,
    /^mozilla\/\d\.\d\s\w*$/,
    /^navermailapp/,
    /^netsurf/,
    /^offline\sexplorer/,
    /^php/,
    /^postman/,
    /^postrank/,
    /^python/,
    /^read/,
    /^reed/,
    /^restsharp/,
    /^snapchat/,
    /^space\sbison/,
    /^svn/,
    /^swcd\s/,
    /^taringa/,
    /^test\scertificate\sinfo/,
    /^thumbor/,
    /^tumblr/,
    /^user-agent:mozilla/,
    /^valid/,
    /^venus\/fedoraplanet/,
    /^w3c/,
    /^webbandit/,
    /^webcopier/,
    /^wget/,
    /^whatsapp/,
    /^xenu\slink\ssleuth/,
    /^yahoo/,
    /^yandex/,
    /^zdm\/\d/,
    /^zoom\smarketplace/,
    /^\{\{.*\}\}$/,
    /adbeat\.com/,
    /appinsights/,
    /archive/,
    /ask\sjeeves\/teoma/,
    /bit\.ly/,
    /bluecoat\sdrtr/,
    /bot/,
    /browsex/,
    /burpcollaborator/,
    /capture/,
    /catch/,
    /check/,
    /chrome-lighthouse/,
    /chromeframe/,
    /cloud/,
    /crawl/,
    /cryptoapi/,
    /dareboost/,
    /datanyze/,
    /dataprovider/,
    /dejaclick/,
    /dmbrowser/,
    /download/,
    /evc-batch.*/,
    /feed/,
    /firephp/,
    /freesafeip/,
    /ghost/,
    /gomezagent/,
    /google/,
    /headlesschrome/,
    /http/,
    /httrack/,
    /hubspot\smarketing\sgrader/,
    /hydra/,
    /ibisbrowser/,
    /images/,
    /iplabel/,
    /ips-agent/,
    /java/,
    /library/,
    /mail\.ru/,
    /manager/,
    /monitor/,
    /morningscore/,
    /neustar\swpm/,
    /nutch/,
    /offbyone/,
    /optimize/,
    /pageburst/,
    /pagespeed/,
    /perl/,    # :(
    /phantom/,
    /pingdom/,
    /powermarks/,
    /preview/,
    /proxy/,
    /ptst[\s\/]\d/,
    /reader/,
    /rexx;/,
    /rigor/,
    /rss/,
    /scan/,
    /scrape/,
    /search/,
    /serp\s\?reputation\s\?management/,
    /server/,
    /sogou/,
    /sparkler/,
    /speedcurve/,
    /spider/,
    /splash/,
    /statuscake/,
    /stumbleupon\.com/,
    /supercleaner/,
    /synapse/,
    /synthetic/,
    /taginspector/,
    /torrent/,
    /tracemyfile/,
    /transcoder/,
    /trendsmapresolver/,
    /twingly\srecon/,
    /url/,
    /virtuoso/,
    /wappalyzer/,
    /webglance/,
    /webkit2png/,
    /websitemetadataretriever/,
    /whatcms/,
    /wordpress/,
    /zgrab/
];

sub is_bot {
    my $str = $_[1] ? $_[1] : $_[0];
    foreach my $p (@$list) {
        return 1 if $str =~ $p;
    }

    return 0;
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

=head1 API

=head2 is_bot

Determines if the given string (only parameter) is a bot or not.
