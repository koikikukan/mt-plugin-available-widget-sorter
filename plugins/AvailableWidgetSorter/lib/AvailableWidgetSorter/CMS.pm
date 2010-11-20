package AvailableWidgetSorter::CMS;

use strict;

sub edit_template_param {
    my ($cb, $app, $param, $tmpl) = @_;
    my $avail_modules = $param->{available};

    my @sorted_avail_modules = sort { $a->{name} cmp $b->{name} } @$avail_modules; 
    $param->{available} = \@sorted_avail_modules;
}

1;
