
param([string] $dir, [string] $target)

$path = [System.Environment]::GetEnvironmentVariable('path', $target)

return ($path.Contains("$dir;") -Or $path.EndsWith($dir))
