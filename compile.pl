my $file = $ARGV[0];

open my $fh, '<', $file;
my $content = do { local $/; <$fh> };
close $fh;
my @chars = split(//, $content);

my %keywords;

open $fh, '<', "writing_status.csv";
$content = do { local $/; <$fh> };
close $fh;

my @writing = split(/,/, $content);
my $days = $writing[0];
my $wc = $writing[1];
$wc =~ s/\s//g;

my $wpd = int($wc)/int($days);

$keywords{"wpd"} = int($wpd);
$keywords{"words"} = $wc;
$keywords{"days"} = $days;
$keywords{"books"} = 1;
$keywords{"rating"} = 1801;

if ($wpd >= 500)
  {
    $keywords{"writingstatus"} = "<font color=\"darkgreen\"><b>On track!</b></font>";
  }
else
  {
    $keywords{"writingstatus"} = "<font color=\"red\"><b>Not on track!</b></font>";
  }

my $buffer = "";
my $in_kw = 0;

for (@chars)
  {
    if ($_ eq '*')
      {
        if ($in_kw == 0)
          {
            $in_kw = 1;
          }
        else
          {
            if (exists $keywords{$buffer})
              {
                print $keywords{$buffer};
              }
            $buffer = "";
            $in_kw = 0;
          }
      }
    else
      {
        if ($in_kw==1)
          {
            $buffer = $buffer . $_;
          }
        else
          {
            print $_;
          }
      }
  }

print "\n";


