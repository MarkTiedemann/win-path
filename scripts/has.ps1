
param([string] $dir)

$path = [System.Environment]::GetEnvironmentVariable('path', 'Machine')

return ($path.Contains("$dir;") -Or $path.EndsWith($dir))
