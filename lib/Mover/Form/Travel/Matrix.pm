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

#$VERSION = eval $VERSION;
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
has '+error_message'   => ( default => 'This form is a mess!' );

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

                #                disabled => 1,
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

