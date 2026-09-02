# DataProduct MCP setup (Codex)

On first chat after install, or when DataProduct MCP tools are missing / OAuth did not complete:

Guide the user only. Do not invent a hostname. Do not tell them to edit the plugin card or click a gear next to **Dataproduct-mcp** to set the hostname. Codex plugins do not have a Cursor-style Configure field. Plugin-bundled MCP transport URL is not user-editable.

1. Tell them what an instance URL looks like, with this one example, and that they must not add `https://` or `/mcp/api/v1` in the hostname itself:

   `qaiks-070226.instance.dataos.cloud`

   Codex uses the full MCP URL `https://<hostname>/mcp/api/v1`.

2. Tell them to add that server in Codex (not on the plugin page):
   **Settings → MCP servers → Add server**
   - Type: Streamable HTTP
   - Name: `dataproduct-mcp`
   - URL: `https://qaiks-070226.instance.dataos.cloud/mcp/api/v1` (their hostname)
   - Save, then Restart
   Then reply here when it is saved.

   CLI alternative:
   `codex mcp add dataproduct-mcp --url https://<hostname>/mcp/api/v1`

3. Stop and wait until they confirm the server is added.
4. After they confirm, start OAuth with `codex mcp login dataproduct-mcp`, or tell them to click **Authenticate** on that server in **Settings → MCP servers**. They finish login in the browser.
5. If tools are still missing, the URL is wrong or the server is disabled. Show the same example and ask them to fix the URL in **Settings → MCP servers**.
