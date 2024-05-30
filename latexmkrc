$out_dir = 'build';
$pdf_mode = 5;
$silent = 1;
$xelatex = "xelatex -shell-escape -synctex=1 -file-line-error %O %S";
$xelatex_silent_switch = "-interaction=batchmode";
@default_files = ('main.tex');
