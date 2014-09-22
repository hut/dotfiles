<?php
// A simple script listing the content of a directory on any php-capable server
$dir = opendir ('.');
$ignore = array ('index.php');
define (br, "\n");
define (sl, "/");
define (wid, 50);
$color = array('eeeeff', 'ffffff');

$dirs = array('..');
$files = array();
$total_size = 0;

while ($item = readdir($dir))
    if (!in_array ($item, $ignore) && $item[0] != '.')
        if (is_dir($item))
            $dirs[] = $item;
        else {
            $files[] = $item;
            $total_size += filesize($item);
        }

sort($dirs);
sort($files);

print '<pre>index of '.dirname ($_SERVER['PHP_SELF']).' ['.floor($total_size/1024).'K]'.br.br;

$i = 0;
foreach (array_merge($dirs, $files) as $key => $val) {
    print '<div style="background:#'.$color[$i%count($color)].';">';
    if (is_dir($val))
        print "<b><a href='$val'>$val</a></b>".sl.br;
    else {
        $size = filesize ($val);
        if ($size > 1024)
            $size = floor($size / 1024)."K";
        print "<a href='$val'>".str_pad ($val."</a>", (wid-strlen($size))).$size.br;
    }
    $i++;
    print '</div>';
}
?>

