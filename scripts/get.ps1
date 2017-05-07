
param([string] $target)

return [System.Environment]::GetEnvironmentVariable('path', $target)
