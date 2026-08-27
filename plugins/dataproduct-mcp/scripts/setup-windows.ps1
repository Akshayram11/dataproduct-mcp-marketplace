$ErrorActionPreference = "Stop"

$defaultUrl = "https://leidos-sandbox.instance.dataos.cloud/dataproduct-mcp/api/v1"
$enteredUrl = Read-Host "DataProduct MCP URL [$defaultUrl]"
$mcpUrl = if ([string]::IsNullOrWhiteSpace($enteredUrl)) { $defaultUrl } else { $enteredUrl.Trim() }

if (-not [Uri]::IsWellFormedUriString($mcpUrl, [UriKind]::Absolute)) {
    throw "Enter a valid absolute URL, for example https://example.com/dataproduct-mcp/api/v1"
}

$secureToken = Read-Host "Bearer token (input is hidden)" -AsSecureString
$tokenPointer = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureToken)

try {
    $token = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($tokenPointer)
    if ([string]::IsNullOrWhiteSpace($token)) {
        throw "Bearer token cannot be empty."
    }

    [Environment]::SetEnvironmentVariable("DATAPRODUCT_MCP_URL", $mcpUrl, "User")
    [Environment]::SetEnvironmentVariable("DATAPRODUCT_MCP_TOKEN", $token.Trim(), "User")

    $env:DATAPRODUCT_MCP_URL = $mcpUrl
    $env:DATAPRODUCT_MCP_TOKEN = $token.Trim()

    $mcpConfigPath = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot "..\.mcp.json"))
    $mcpConfig = Get-Content -Raw -Path $mcpConfigPath | ConvertFrom-Json
    $mcpConfig.mcpServers.'dataproduct-mcp'.url = $mcpUrl
    $mcpConfig | ConvertTo-Json -Depth 10 | Set-Content -Encoding UTF8 -Path $mcpConfigPath
}
finally {
    [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($tokenPointer)
    $token = $null
}

Write-Host "DataProduct MCP configuration saved for the current Windows user."
Write-Host "MCP endpoint updated in $mcpConfigPath."
Write-Host "Fully quit and reopen Codex, then enable the dataproduct-mcp plugin."
