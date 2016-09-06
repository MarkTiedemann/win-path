
param([string] $dir)

$path = [System.Environment]::GetEnvironmentVariable('path', 'Machine')

if (!($path.Contains("$dir;") -Or $path.EndsWith($dir)))
{
    try 
    {
        $newPath = "$path;$dir"
        [System.Environment]::SetEnvironmentVariable('path', $newPath, 'Machine')
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
