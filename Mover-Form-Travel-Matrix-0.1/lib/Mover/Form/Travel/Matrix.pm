#===============================================================================
#
#         FILE: Mover::Form::Travel::Matirx
#
#  DESCRIPTION: Form for Google Travel Time Matrix
#
#===============================================================================
package Mover::Form::Travel::Matrix;

# ABSTRACT: Addresses form for Google Travel Matrix

use Modern::Perl qw /2012/;
use HTML::FormHandler::Moose;
use namespace::autoclean;
extends 'HTML::FormHandler';

with 'HTML::FormHandler::Widget::Theme::Bootstrap',
  'HTML::FormHandler::Widget::Theme::BootstrapFormMessages',
  'HTML::FormHandler::Render::RepeatableJs';
our $VERSION = '0.1';

use HTML::FormHandler::Types qw/Trim Collapse/;
use Regexp::Common qw /zip/;

#-------------------------------------------------------------------------------
#   Globals
#-------------------------------------------------------------------------------
my $form_name        = q/tm_form/;
my $form_action      = q/\/travel_time/;
my $form_action_name = q/travel_time/;
my $http_method      = q/post/;
my $field_size = q/span11/;   #input-mini -small -medium -large -xlarge -xxlarge
                              # or span1 etc
my $select_field_size = q/span10/;
my $button_size       = q/btn-small/; #btn-large -small -mini or q// for default
my $button_class = q/btn-primary/;    #btn-primary -info -success
     # -warning -danger -inverse or q// for default

#-------------------------------------------------------------------------------
#  Attributes
#-------------------------------------------------------------------------------
has '+field_name_space' => ( default => 'Mover::Form::Field' );
has '+name'        => ( default => $form_name );
has '+html_prefix' => ( default => 1 );
has '+is_html5'    => ( default => 1 );
has '+http_method' => ( default => $http_method );
has '+action'      => ( default => $form_action );

#----- Mover::Form::Field::Address that is Repeatable
has_field 'addresses' => (
    type         => 'Repeatable',
    setup_for_js => 1,
    do_wrapper   => 1,
    tags         => { controls_div => 1 },
    auto_id      => 1,
);

# has_field 'addresses';
has_field 'addresses.contains' => ( type => 'Address', );

#has_field 'add_address' => (
#    type       => 'AddElement',
#    repeatable => 'addresses',
#    value      => 'Add another address',
#);
#has_field 'remove' => (
#    type  => 'RmElement',
#    value => 'Remove Address',
#);

has_field 'submit' => (
    type         => 'Submit',
    widget       => 'ButtonTag',
    element_attr => { class => [ 'btn', $button_class, $button_size ] },
    do_wrapper   => 0,
    value        => 'Get Travel Time'
);

has '+info_message'    => ( default => 'Starting point.' );
has '+success_message' => ( default => 'Form successfully submitted' );
has '+error_message'   => ( default => 'Please fix the errors on this form!' );

#------------------------------------------------------------------------------
#------ For Details -- See HTML::FormHandler::Manual::Rendering
#------ Use the Wrapper Theme
sub build_do_form_wrapper { 1 }

sub build_update_subfields {
    {
        all => {
            tags     => { no_errors => 0 },
            do_label => 0,
        },
        by_type => { Select => { element_class => [$select_field_size] } },
        'addresses.contains.address_1' =>
          { element_attr => { class => [$field_size], } },
        'addresses.contains.address_2' => {
            label        => 'Address 2',
            element_attr => {
                class       => [$field_size],
                placeholder => 'More address detail',
            }
        },
        'addresses.contains.city' =>
          { element_attr => { class => [$field_size], } },
        'addresses.contains.country' =>
          { element_attr => { class => [$field_size], } },
        'addresses.contains.zip' =>
          { element_attr => { class => [$field_size], } },
    };
}

#-------------------------------------------------------------------------------
#  END
#-------------------------------------------------------------------------------
no HTML::FormHandler::Moose;
__PACKAGE__->meta->make_immutable;
1;

__END__

=pod

=head1 NAME

Mover::Form::Travel::Matrix - Addresses form for Google Travel Matrix

=head1 VERSION

version 0.1

=head1 SYNOPSIS

    # Creates an address form repeated once (using "fif_form_value" attribute)
    $address_form = Mover::Form::Travel::Matrix->new( fif_from_value => 1 );

=head2 
has '+field_name_space' => ( default => 'Mover::Form::Field' );

=head2 
has '+name'        => ( default => $form_name );

=head2 
has '+html_prefix' => ( default => 1 );

=head2 
has '+is_html5'    => ( default => 1 );

=head2 
has '+http_method' => ( default => $http_method );

=head2 
has '+action'      => ( default => $form_action );

=head2 
has_field 'addresses' => (
    type         => 'Repeatable',
    setup_for_js => 1,
    do_wrapper   => 1,
    tags         => { controls_div => 1 },
    auto_id      => 1,
);

=head2 
has_field 'addresses.contains' => ( type => 'Address', );

=head2 
has_field 'submit' => (
    type         => 'Submit',
    widget       => 'ButtonTag',
    element_attr => { class => [ 'btn', $button_class, $button_size ] },
    do_wrapper   => 0,
    value        => 'Get Travel Time'
);

=head2 
has '+info_message'    => ( default => 'Starting point.' );

=head2 
has '+success_message' => ( default => 'Form successfully submitted' );

=head2 
has '+error_message'   => ( default => 'Please fix the errors on this form!' );

=head2 build_do_form_wrapper
   1

=head2 build_update_subfields

    {
        all => {
            tags     => { no_errors => 0 },
            do_label => 0,
        },
        by_type => { Select => { element_class => [$select_field_size] } },
        'addresses.contains.address_1' =>
          { element_attr => { class => [$field_size], } },
        'addresses.contains.address_2' => {
            label        => 'Address 2',
            element_attr => {
                class       => [$field_size],
                placeholder => 'More address detail',
            }
        },
        'addresses.contains.city' =>
          { element_attr => { class => [$field_size], } },
        'addresses.contains.country' =>
          { element_attr => { class => [$field_size], } },
        'addresses.contains.zip' =>
          { element_attr => { class => [$field_size], } },
    };

=head1 NAME
 Mover::Form::Travel::Matrix -  Repeatable Address form using
 HTML::FormHandler

=head1 VERSION
Version 0.01

=head1 DESCRIPTION
 This Module can be used to create an address form with multiple repatable
 address capability. It contains in built field validation. It also uses
 Bootstrap CSS formatting.

=head1 SEE ALSO

=over

=item *
 L<HTML::FormHandler>

=item *
 L<Moose>

=item *
 L<HTML::FormHandler::Widget::Theme::Bootstrap>

=item *
 L<HTML::FormHandler::Widget::Theme::BootstrapFormMessages>

=item *
 L<HTML::FormHandler::Render::RepeatableJs>

=back

=head1 AUTHOR

Austin Kenny, C<< <aibistin.cionnaith at gmail.com> >>

=head1 ACKNOWLEDGEMENTS
       All CPAN Contributers

=head1 LICENSE AND COPYRIGHT

Copyright 2013 Austin Kenny.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=head1 AUTHOR

Austin Kenny <aibistin.cionnaith@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Austin Kenny.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
