# DataProduct MCP

Install the DataProduct MCP into Cursor against your own DataOS instance.
The server is OAuth-based. Enter the instance URL, then complete the browser
login. No bearer token is stored in this repository.

After install, Cursor uses:

```json
{
  "dataproduct-mcp": {
    "url": "https://YOUR-INSTANCE.instance.dataos.cloud/mcp/api/v1"
  }
}
```

This repository is a **single Cursor plugin**, not a marketplace. The plugin
manifest is [`.cursor-plugin/plugin.json`](.cursor-plugin/plugin.json).

## Add to Cursor (instance URL popup)

1. Open [`install.html`](install.html) in a browser.
2. Enter your instance URL hostname only, for example:

   ```text
   your-instance.instance.dataos.cloud
   ```

3. Click **Add to Cursor**.
4. Confirm the Cursor install prompt, then complete OAuth.

Do not include `https://` or `/mcp/api/v1`. The page builds
`https://<instance-url>/mcp/api/v1`.

## Install the plugin locally

If you want the plugin card (with **Configure → Instance URL**) instead
of the install link:

1. Copy this repository into `~/.cursor/plugins/local/dataproduct-mcp`.
   Do not symlink out of that folder.
2. Reload Cursor.
3. Open **Customize**, find **DataProduct MCP**, click **Configure**, and save
   the instance URL.

Cursor does not auto-open that Configure dialog on Add. Use `install.html` when
you want the instance URL prompt first.

## Codex

Codex still uses [`.agents/plugins/marketplace.json`](.agents/plugins/marketplace.json)
and the plugin under `plugins/dataproduct-mcp/.codex-plugin/`.

### Guided setup

Windows PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\setup-windows.ps1
```

macOS or Linux:

```bash
chmod +x ./scripts/setup-macos-linux.sh
./scripts/setup-macos-linux.sh
```

Both scripts ask for the DataProduct MCP URL and hide the bearer token while it
is typed. Fully quit and reopen Codex after setup.
