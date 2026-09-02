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

This repository is a Cursor marketplace plus an optional install page.

## Import in Cursor (Customize → + Add)

1. Open **Customize → Plugins → + Add**.
2. In **Import Marketplace**, paste this repository URL:

   `https://github.com/Akshayram11/dataproduct-mcp-marketplace`

3. Keep **Scope** as **User** and click **Import**.
4. Open **dataproduct-mcp**, click **Add** / **Install**.
5. In Agent chat you can also run
   `/add-plugin dataproduct-mcp@https://github.com/Akshayram11/dataproduct-mcp-marketplace`.
   The agent shows one example hostname, guides you to save yours in
   **Configure**, enable **dataproduct-mcp-11** on the same plugin page,
   then starts OAuth from chat. Complete login in the browser that opens.
   You do not need the MCP tab Authenticate button.
6. FQDN is hostname only, for example
   `your-instance.instance.dataos.cloud`. Do not include `https://` or
   `/mcp/api/v1`.

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

## Codex / ChatGPT (Add plugin marketplace)

The Codex plugin lives at [`plugins/codex`](plugins/codex). Codex looks for
`.agents/plugins/marketplace.json` at the **marketplace root**, not only inside
`plugins/codex`. In the **Add plugin marketplace** dialog:

1. **Source:** `https://github.com/Akshayram11/dataproduct-mcp-marketplace`
   or `Akshayram11/dataproduct-mcp-marketplace`
2. **Git ref:** `main`
3. **Sparse paths:** leave empty, **or** put both of these lines:

   ```text
   .agents/plugins
   plugins/codex
   ```

   Do not use only `plugins/codex`. That checkout has no marketplace manifest
   at the root, so Codex shows `marketplace root does not contain a supported manifest`.
4. Click **Add marketplace**.
5. Install **DataProduct MCP**. The plugin page has no hostname edit field.
   The gear next to **Dataproduct-mcp** does not change the instance URL.
6. Add your instance in **Settings → MCP servers → Add server**:
   - Type: Streamable HTTP
   - URL: `https://your-instance.instance.dataos.cloud/mcp/api/v1`
   - Example hostname: `qaiks-070226.instance.dataos.cloud`
     (no `https://` in the hostname; the URL includes the path)
   - Save, then Restart
7. Click **Authenticate** on that server, or run
   `codex mcp login dataproduct-mcp`. Finish login in the browser.

   CLI alternative:

   ```bash
   codex mcp add dataproduct-mcp --url https://your-instance.instance.dataos.cloud/mcp/api/v1
   codex mcp login dataproduct-mcp
   ```

Codex uses [`.agents/plugins/marketplace.json`](.agents/plugins/marketplace.json)
and [`plugins/codex/.codex-plugin/plugin.json`](plugins/codex/.codex-plugin/plugin.json).
The MCP URL is `https://<hostname>/mcp/api/v1`.
