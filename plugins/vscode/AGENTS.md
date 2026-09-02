# DataProduct MCP setup (VS Code)

On first chat after install, or when DataProduct MCP tools are missing:

Ask for the FQDN in this chat. Do not invent a hostname. The VS Code plugin card has no Cursor-style Configure field.

1. Ask the user to reply with their DataOS instance FQDN only. Hostname, no `https://`, no `/mcp/api/v1`. Example:

   `qaiks-070226.instance.dataos.cloud`

2. After they send it, tell them to add the MCP server:
   **Command Palette → MCP: Add Server → HTTP**
   URL: `https://<their-fqdn>/mcp/api/v1`
   Then start the server and complete OAuth / **Authenticate** if VS Code shows it.
3. If tools are still missing, ask them to open **MCP: List Servers**, select **dataproduct-mcp**, and click **Authenticate**.
