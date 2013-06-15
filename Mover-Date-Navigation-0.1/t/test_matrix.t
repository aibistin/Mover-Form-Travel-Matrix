#===============================================================================
#
#         FILE: test_matrix.t
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Austin Kenny (), aibistin.cionnaith@gmail.com
# ORGANIZATION: Carry On Coding
#      VERSION: 1.0
#      CREATED: 05/04/2013 09:04:32 AM
#     REVISION: ---
#===============================================================================
use strict;
use warnings;
use Test::More;
use Data::Dump qw/dump/;
use HTML::FormHandler::Test;
use_ok('Mover::Form::Travel::Matrix');
my $form = Mover::Form::Travel::Matrix->new;
diag 'Got this form render : ' . dump $form->render;
$form->process;
my $expected = '<form id=\"form307\" method=\"post\">\n<div
class=\"form_messages\">\n</div>\n<div>\n<label
for=\"mover_address.address_1\">Address 1</label>\n<input type=\"text\"
name=\"mover_address.address_1\" id=\"mover_address.address_1\" value=\"\"
/>\n</div>\n<div>\n<label for=\"mover_address.address_2\">Address
2</label>\n<input type=\"text\" name=\"mover_address.address_2\"
id=\"mover_address.address_2\" value=\"\" />\n</div>\n<div>\n<label
for=\"mover_address.city\">City</label>\n<input type=\"text\"
name=\"mover_address.city\" id=\"mover_address.city\" value=\"\"
/>\n</div>\n<div>\n<label for=\"mover_address.state\">State</label>\n<select
name=\"mover_address.state\" id=\"mover_address.state\">\n<option value=\"AL\"
id=\"mover_address.state.0\">Alabama</option>\n<option value=\"AK\"
id=\"mover_address.state.1\">Alaska</option>\n<option value=\"AZ\"
id=\"mover_address.state.2\">Arizona</option>\n<option value=\"AR\"
id=\"mover_address.state.3\">Arkansas</option>\n<option value=\"CA\"
id=\"mover_address.state.4\">California</option>\n<option value=\"CO\"
id=\"mover_address.state.5\">Colorado</option>\n<option value=\"CT\"
id=\"mover_address.state.6\">Connecticut</option>\n<option value=\"DE\"
id=\"mover_address.state.7\">Delaware</option>\n<option value=\"FL\"
id=\"mover_address.state.8\">Florida</option>\n<option value=\"GA\"
id=\"mover_address.state.9\">Georgia</option>\n<option value=\"HI\"
id=\"mover_address.state.10\">Hawaii</option>\n<option value=\"ID\"
id=\"mover_address.state.11\">Idaho</option>\n<option value=\"IL\"
id=\"mover_address.state.12\">Illinois</option>\n<option value=\"IN\"
id=\"mover_address.state.13\">Indiana</option>\n<option value=\"IA\"
id=\"mover_address.state.14\">Iowa</option>\n<option value=\"KS\"
id=\"mover_address.state.15\">Kansas</option>\n<option value=\"KY\"
id=\"mover_address.state.16\">Kentucky</option>\n<option value=\"LA\"
id=\"mover_address.state.17\">Louisiana</option>\n<option value=\"ME\"
id=\"mover_address.state.18\">Maine</option>\n<option value=\"MD\"
id=\"mover_address.state.19\">Maryland</option>\n<option value=\"MA\"
id=\"mover_address.state.20\">Massachusetts</option>\n<option value=\"MI\"
id=\"mover_address.state.21\">Michigan</option>\n<option value=\"MN\"
id=\"mover_address.state.22\">Minnesota</option>\n<option value=\"MS\"
id=\"mover_address.state.23\">Mississippi</option>\n<option value=\"MO\"
id=\"mover_address.state.24\">Missouri</option>\n<option value=\"MT\"
id=\"mover_address.state.25\">Montana</option>\n<option value=\"NE\"
id=\"mover_address.state.26\">Nebraska</option>\n<option value=\"NV\"
id=\"mover_address.state.27\">Nevada</option>\n<option value=\"NH\"
id=\"mover_address.state.28\">New Hampshire</option>\n<option value=\"NJ\"
id=\"mover_address.state.29\">New Jersey</option>\n<option value=\"NM\"
id=\"mover_address.state.30\">New Mexico</option>\n<option value=\"NY\"
id=\"mover_address.state.31\">New York</option>\n<option value=\"NC\"
id=\"mover_address.state.32\">North Carolina</option>\n<option value=\"ND\"
id=\"mover_address.state.33\">North Dakota</option>\n<option value=\"OH\"
id=\"mover_address.state.34\">Ohio</option>\n<option value=\"OK\"
id=\"mover_address.state.35\">Oklahoma</option>\n<option value=\"OR\"
id=\"mover_address.state.36\">Oregon</option>\n<option value=\"PA\"
id=\"mover_address.state.37\">Pennsylvania</option>\n<option value=\"RI\"
id=\"mover_address.state.38\">Rhode Island</option>\n<option value=\"SC\"
id=\"mover_address.state.39\">South Carolina</option>\n<option value=\"SD\"
id=\"mover_address.state.40\">South Dakota</option>\n<option value=\"TN\"
id=\"mover_address.state.41\">Tennessee</option>\n<option value=\"TX\"
id=\"mover_address.state.42\">Texas</option>\n<option value=\"UT\"
id=\"mover_address.state.43\">Utah</option>\n<option value=\"VT\"
id=\"mover_address.state.44\">Vermont</option>\n<option value=\"VA\"
id=\"mover_address.state.45\">Virginia</option>\n<option value=\"WA\"
id=\"mover_address.state.46\">Washington</option>\n<option value=\"WV\"
id=\"mover_address.state.47\">West Virginia</option>\n<option value=\"WI\"
id=\"mover_address.state.48\">Wisconsin</option>\n<option value=\"WY\"
id=\"mover_address.state.49\">Wyoming</option></select>\n</div>\n<div>\n<label
for=\"mover_address.country\">Country</label>\n<input type=\"text\"
name=\"mover_address.country\" id=\"mover_address.country\" value=\"\"
/>\n</div>\n<div>\n<label for=\"mover_address.zip\">Zip</label>\n<input
type=\"text\" name=\"mover_address.zip\" id=\"mover_address.zip\" value=\"\"
/>\n</div>\n</form>';
is_html( $form->render,  $expected,  'form renders ok' );

done_testing();
