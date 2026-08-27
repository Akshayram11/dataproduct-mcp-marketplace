# DataProduct MCP Codex Plugin

This marketplace provides a Codex plugin for the DataProduct MCP server.

## Configuration

Set these environment variables before using the plugin:

```bash
export DATAPRODUCT_MCP_URL="https://leidos-sandbox.instance.dataos.cloud/dataproduct-mcp/api/v1"
export DATAPRODUCT_MCP_TOKEN="replace-with-your-bearer-token"
```

On Windows PowerShell:

```powershell
$env:DATAPRODUCT_MCP_URL = "https://leidos-sandbox.instance.dataos.cloud/dataproduct-mcp/api/v1"
$env:DATAPRODUCT_MCP_TOKEN = "replace-with-your-bearer-token"
```

For a permanent Windows user variable:

```powershell
[Environment]::SetEnvironmentVariable("DATAPRODUCT_MCP_URL", "https://leidos-sandbox.instance.dataos.cloud/dataproduct-mcp/api/v1", "User")
[Environment]::SetEnvironmentVariable("DATAPRODUCT_MCP_TOKEN", "replace-with-your-bearer-token", "User")
```

`DATAPRODUCT_MCP_URL` controls the editable server URL. `DATAPRODUCT_MCP_TOKEN`
contains only the token value, without the `Bearer ` prefix.

The bearer token is intentionally not stored in this repository.
