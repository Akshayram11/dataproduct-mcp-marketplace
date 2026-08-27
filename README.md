# DataProduct MCP Codex Plugin

This marketplace provides a Codex plugin for the DataProduct MCP server.

## Configuration

### Guided setup

Windows PowerShell:

After installing the plugin, open PowerShell in the installed plugin folder and run:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\setup-windows.ps1
```

macOS or Linux:

```bash
chmod +x ./scripts/setup-macos-linux.sh
./scripts/setup-macos-linux.sh
```

Both scripts ask for the DataProduct MCP URL and hide the bearer token while it
is typed. The Windows script stores both values as user environment variables.
The macOS/Linux script stores them in `~/.dataproduct-mcp.env` with permissions
limited to the current user and loads that file from the user's shell profile.
Fully quit and reopen Codex after setup.

Codex marketplace manifests do not currently support custom URL and bearer-token
fields inside the Install dialog, so this guided setup runs immediately after
installation.

### Manual setup

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
