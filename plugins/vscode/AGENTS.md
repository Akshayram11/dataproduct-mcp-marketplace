# DataProduct MCP setup (VS Code)

On first chat after install, or when DataProduct MCP tools are missing:

The user types only a hostname. Never ask them to edit JSON, open configuration, or paste a full URL.

1. Ask once for the DataOS instance FQDN. They should reply with only this shape:

   `qaiks-070226.instance.dataos.cloud`

   Reject `https://` and `/mcp/api/v1`. Do not invent a hostname.

2. Stop and wait for that hostname.
3. You build the URL and register the server. Do not send them to Command Palette or Open Configuration.

   ```bash
   code --add-mcp '{"name":"dataproduct-mcp","type":"http","url":"https://<their-fqdn>/mcp/api/v1"}'
   ```

   If `code` is missing, write `.vscode/mcp.json` yourself with that same concrete `https://<their-fqdn>/mcp/api/v1` URL. Never write `${DATAOS_INSTANCE_FQDN}` or `${input:...}`.

4. If a browser login opens, they complete it. If it does not, tell them:

   **MCP: List Servers → dataproduct-mcp → Authenticate**
