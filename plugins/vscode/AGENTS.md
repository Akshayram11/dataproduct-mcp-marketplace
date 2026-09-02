# DataProduct MCP setup (VS Code)

On first chat after install, `/add-plugin`, or when DataProduct MCP tools are missing:

Ask for the FQDN in this chat. Do not skip that question. Do not invent a hostname. Do not send them to Command Palette first.

1. Ask the user to reply with their DataOS instance FQDN only. Hostname, no `https://`, no `/mcp/api/v1`. Show this one example:

   `qaiks-070226.instance.dataos.cloud`

2. Stop and wait until they send a hostname.
3. After they send it, add the MCP from this chat (do not ask them to click Add Server):

   ```bash
   code --add-mcp '{"name":"dataproduct-mcp","type":"http","url":"https://<their-fqdn>/mcp/api/v1"}'
   ```

   Use the real hostname in the URL. Never write `${DATAOS_INSTANCE_FQDN}` or
   `${input:DATAOS_INSTANCE_FQDN}` into user config.

   If `code` is missing, write workspace `.vscode/mcp.json`:

   ```json
   {
     "servers": {
       "dataproduct-mcp": {
         "type": "http",
         "url": "https://<their-fqdn>/mcp/api/v1"
       }
     }
   }
   ```

4. Tell them VS Code may open a browser for OAuth. If no browser opens, tell them:

   **MCP: List Servers → dataproduct-mcp → Authenticate**

   Do not ask for the FQDN again if they already confirmed it.
5. After they confirm login, check that DataProduct tools are available.
