package Example::Helper::Login;

use strict;
use warnings;

use base 'Mojolicious::Plugin';

sub register {
	my ($self, $app) = @_;
	
	# OAuth Client for Twitter
	$app->helper( oauth_client_twitter =>
		sub {
			return Net::OAuth2::Client->new(
				$app->config()->{oauth_twitter_key},
				$app->config()->{oauth_twitter_secret},
				site	=>	'https://oauth.twitter.com',
				authorize_path	=>	'/2/authorize',
				access_token_path=>	'/o/oauth2/token',
			)->web_server(oauth_client_identifier => $app->config()->{oauth_twitter_key},
				oauth_callback_url => ($app->config()->{base_url}) .'session/oauth_twitter_callback');
		}
	);
}

1;