# DataProduct MCP setup (Codex)

On `/add-plugin`, first chat after install, or when DataProduct MCP tools are missing:

Ask for the FQDN in this chat. Do not skip that question. Do not invent a hostname.

1. Ask the user to reply with their DataOS instance FQDN only. Hostname, no `https://`, no `/mcp/api/v1`. Show this one example:

   `qaiks-070226.instance.dataos.cloud`

2. Stop and wait until they send a hostname.
3. After they send it, add the MCP and try CLI OAuth:

   ```bash
   codex mcp add dataproduct-mcp --url https://<their-fqdn>/mcp/api/v1
   codex mcp login dataproduct-mcp
   ```

4. If `codex mcp login` works, tell them to finish login in the browser.
5. If login fails (`No authorization support detected`, 404 on OAuth metadata, or no browser opens), do **not** ask for the FQDN again when they already confirmed the hostname. Tell them to authenticate in the Codex UI:

   **Plugins → MCPs → Servers → dataproduct-mcp → Authenticate**

   The toggle must be on. After they click **Authenticate**, they finish login in the browser and reply here.
6. After they confirm Authenticate, check that DataProduct tools are available.
