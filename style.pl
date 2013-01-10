use strict;
use warnings;

#when setting out a paranthesised list over multiple lines,
#put the opening parenthesis at the end of the controlling expression;
#arrange the list elements on the subsequent lines, indented by
#one level; and place the closing parenthesis on its own line, outdenting
#it back to the level of the controlling expressions.
my @names = (
    'Damian',   #primary key
    'Matthew',  #Disambiguator
    'Conway',   #General class or category
);

my @planes = (
    'Jumbo',
    'Airbus',
    'Conair',
);

#seperate control keywords from the following opening bracket
for (@results) {
    ...
}

while (1) {
    ...
}
#not this:
for(@results) {
while(1) {
 

#dont seperate subroutine or variable names from the following
#bracket
my @candidates = get_canditates($marker);

$candidates[$i] 
    = $incumbent{ $candidates[$i]{region} };
#not this:
my @candidates = get_candidates ($marker);

$candidates[$i] 
    = $incumbent{ $candidates [$i] {region} };

#dont use unnecessary parentheses for builtins and honorary builtins
split "\t", $records;
#not:
split("\t", $records);

#seperate complex keys or indices from their surrounding brackets.
$candidates[$i]
    = $incumbent{ $candidates[$i]{ get_region() } };

#use white space to help binary operators stand out from their operands:
my $displacement 
    = $initial_velocity * $ime + 0.5 * $accelaration * $time**2;

#symbolicunary operators should always be kept with their operands:
my $spring_force = !$hyperextended ? -$spring_constant : 0;

#named unary operators should be treater like builtins and spaced from
#operators:
my $tan_theta = sin $theta / cos $theta;
my $forward_differential = $price * exp -$interest_rate;


