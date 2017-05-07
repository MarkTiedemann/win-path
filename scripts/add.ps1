
param([string] $dir, [string] $target)

$path = [System.Environment]::GetEnvironmentVariable('path', $target)

if (!($path.Contains("$dir;") -Or $path.EndsWith($dir)))
{
    try 
    {
        $newPath = "$path;$dir"
        [System.Environment]::SetEnvironmentVariable('path', $newPath, $target)
        return $newPath
    } 
    catch [System.Security.SecurityException] 
    {
        return 'ERR_SECURITY_EXCEPTION'
    }
}
else
{
    return 'WARN_DIR_ALREADY_IN_PATH'
}
