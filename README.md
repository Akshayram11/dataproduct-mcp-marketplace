# DataProduct MCP Marketplace

Install the DataProduct MCP into Cursor (and Codex) against your own DataOS
instance. The Cursor plugin is OAuth-based: you enter the instance FQDN, then
Cursor opens the browser login. No bearer token is stored in this repo.

After install, Cursor writes a server entry equivalent to:

```json
{
  "dataproduct-mcp": {
    "url": "https://YOUR-INSTANCE.instance.dataos.cloud/mcp/api/v1"
  }
}
```

## Cursor

This repository is a Cursor team/personal marketplace. Cursor discovers it from
[`.cursor-plugin/marketplace.json`](.cursor-plugin/marketplace.json) and loads
only the dedicated Cursor package at `plugins/dataproduct-mcp-cursor`. That
keeps Codex's `.mcp.json` out of the Cursor install path, matching the
[tmdc-dataos-marketplace](https://github.com/Akshayram11/tmdc-dataos-marketplace)
layout.

### Import from GitHub

1. In Cursor, open **Customize** (or the marketplace panel).
2. Open the **Personal** tab and click **+ Add Marketplace**.
3. Choose **Import from GitHub**.
4. Paste `https://github.com/Akshayram11/dataproduct-mcp-marketplace`.
5. The **dataproduct** marketplace should appear with the **dataproduct-mcp** plugin.
6. Click **Install**.
7. When prompted, enter your full instance FQDN only, for example:

   ```text
   sawaniks-081726.instance.dataos.cloud
   ```

   Do not include `https://` or `/mcp/api/v1`. Cursor builds:

   `https://<DATAOS_INSTANCE_FQDN>/mcp/api/v1`

8. Complete the OAuth browser prompt, then reload the window if tools do not
   appear immediately.

If you previously imported this repo, remove that marketplace (and any
`dataproduct-mcp` server that was installed without an FQDN prompt) before
importing again. Older imports used the Codex `.mcp.json` file, which had a
hardcoded URL and never asked for your instance.

### Configure later

If install skipped the prompt, open the plugin and use **Configure**. Set
**DataOS instance FQDN**, then reconnect so Cursor can start OAuth.

## Codex

Codex still uses [`.agents/plugins/marketplace.json`](.agents/plugins/marketplace.json)
and the plugin under `plugins/dataproduct-mcp/.codex-plugin/`.

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
Each script also writes the selected endpoint into the installed `.mcp.json`;
the bearer token is never written into the plugin files or Git repository.
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
