package Mojolicious::Plugin::AutoParams;
use Mojo::Base 'Mojolicious::Plugin';
use strict;
use warnings;

our $VERSION = '0.01';

sub register {
    my ($self,$app,$config) = @_;

    $app->hook(around_action => sub {
              my ($next, $c, $action, $last) = @_;
              my $endpoint = $c->match->endpoint;
              return $c->$action unless ref $endpoint eq 'Mojolicious::Routes::Route';
              my @placeholders = @{ $endpoint->pattern->placeholders };
              my @params;
              for my $level ( @{ $c->match->stack }) {
                  my $placeholder = shift @placeholders or last;
                  while ($placeholder and exists( $level->{$placeholder} ) ) {
                      push @params, $level->{$placeholder};
                      $placeholder = shift @placeholders;
                  }
              }
              return $c->$action(@params);
     });
}

1;

=encoding utf8

=head1 NAME

Mojolicious::Plugin::AutoParams - Use placeholders as parameters for routes.

=head1 SYNOPSIS

     use Mojolicious::Lite;
     use experimental 'signatures';
     plugin 'auto_params';

     get '/hello/:name' => sub ($c,$name) { $c->render(text => "hi, $name") }

=head1 DESCRIPTION

This module automatically sends placeholders as a list of parameters to routes.

=head1 TODO

Support sending named parameters in hashes instead of using positional parameters.

=cut


