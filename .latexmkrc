#!/usr/bin/env perl

# $makeindex = 'mendex %O %D %S';
# $makeindex = 'mendex -E -U -I utf8 %O -o %D %S';
$makeindex = 'mendex -U %O -o %D %S';
# $biber = "biber --output_safechars  %O %S";
# $makeindex = 1;
# $makeindex = 'mendex %O -o %D %S';
$bibtex = 'upbibtex';

# $biber = 'biber --bblencoding=utf8 -u -U --output_safechars';

$pdf_mode = 4;
$lualatex = 'lualatex -synctex=0 -shell-escape -interaction nonstopmode -file-line-error %O %S';
$shell_escape = 1;



# $xelatex = "internal mylatex xelatex -shell-escape -interaction nonstopmode -output-directory %O %S";
# $xelatex = "xelatex -shell-escape -interaction nonstopmode -output-directory %O %S";
# $pdflatex = "xelatex -shell-escape -interaction nonstopmode -output-directory %O %S";
# $biber = "biber --output_safechars  %O %S";
# $biber = "biber";
# $biber = 'biber --bblencoding=utf8 -u -U --output_safechars';

# $pdf_mode = 5;
# $dvi_mode = 0;
# $postscript_mode = 0;

# sub mylatex {
#     my ($engine, $base, @args) = @_;
#     my $com = join(' ', @args);
#     unless (-e "$base.fmt"){
#         print "mylatex: making $base.fmt in ini mode... \n";
#         Run_subst("$engine -ini -jobname=\"$base\" \\\&$engine mylatexformat.ltx %S");
#     }
#     print "mylatex: $base.fmt detected, so running normal latex... \n";
#     return Run_subst("$engine -fmt $base $com");
# }
