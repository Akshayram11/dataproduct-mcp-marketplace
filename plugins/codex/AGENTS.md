# DataProduct MCP setup (Codex)

On `/add-plugin`, first chat after install, or when DataProduct MCP tools are missing:

Ask for the FQDN in this chat. Do not skip that question. Do not invent a hostname. Codex has no plugin Configure field for the instance URL.

1. Ask the user to reply with their DataOS instance FQDN only. Hostname, no `https://`, no `/mcp/api/v1`. Show this one example:

   `qaiks-070226.instance.dataos.cloud`

2. Stop and wait until they send a hostname.
3. After they send it, immediately add the MCP and start OAuth (do not send them to Settings first):

   ```bash
   codex mcp add dataproduct-mcp --url https://<their-fqdn>/mcp/api/v1
   codex mcp login dataproduct-mcp
   ```

   Tell them a browser window will open. They finish login there.
4. If add/login fails, show the same example and ask for the hostname again. Do not treat `fetch failed` as a password problem.
