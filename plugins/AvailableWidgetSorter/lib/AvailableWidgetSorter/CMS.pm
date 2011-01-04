package AvailableWidgetSorter::CMS;

use strict;

sub edit_template_param {
    my ($cb, $app, $param, $tmpl) = @_;

    my $plugin = MT->component("AvailableWidgetSorter");
    my $sort_order = $plugin->get_config_value('sort_order', 'blog:'.$app->blog->id);
    my $avail_modules = $param->{available};

    my @sorted_avail_modules;
    if ($sort_order eq 'descend') {
        @sorted_avail_modules = sort { $b->{name} cmp $a->{name} } @$avail_modules;
    } else {
        @sorted_avail_modules = sort { $a->{name} cmp $b->{name} } @$avail_modules;
    }
    $param->{available} = \@sorted_avail_modules;
}

1;
