
param([string] $dir)

$path = [System.Environment]::GetEnvironmentVariable('path', 'Machine')

if ($path.Contains("$dir;"))
{
    try 
    {
        $newPath = $path -Replace [Regex]::Escape("$dir;"), ''
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
    if ($path.EndsWith($dir)) 
    {
        try 
        {
            $newPath = $path.Substring(0, $path.Length - $dir.Length - 1)
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
        return 'WARN_DIR_NOT_IN_PATH'
    }
}

