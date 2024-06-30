my $src = $ARGV[0];

open my $fh, '<', "_template.html" or die;
$/ = undef;
my $template_str = <$fh>;
close $fh;

$template_str =~ s/%%%CONTENT%%%/`cat $src`/ge;

print $template_str;
