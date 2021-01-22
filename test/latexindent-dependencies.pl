#!/usr/bin/perl

# Taken from Section A in http://mirrors.ibiblio.org/CTAN/support/latexindent/documentation/latexindent.pdf.

use strict;
use warnings;
use utf8;
use PerlIO::encoding;
use Unicode::GCString;
use open ':std', ':encoding(UTF-8)';
use Text::Wrap;
use Text::Tabs;
use FindBin;
use YAML::Tiny;
use File::Copy;
use File::Basename;
use File::HomeDir;
use Getopt::Long;
use Data::Dumper;
use List::Util qw(max);
use Log::Log4perl qw(get_logger :levels);

print "SUCCESS: Found all latexindent dependencies.\n";

exit
