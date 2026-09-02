# DataProduct MCP setup (Codex)

On first chat after install, or when DataProduct MCP tools are missing / OAuth did not complete / the plugin MCP is disabled:

Guide the user only. Do not ask them to type the instance URL in chat first. Do not edit plugin config files unless they explicitly ask. Do not invent a hostname.

Never send them to Cursor **Customize → MCP** or tell them to click an **Authenticate** button in a settings MCP tab. In Codex, authentication is OAuth from this chat / the Codex login prompt. The user only completes login in the browser that opens.

1. Tell them what an instance URL looks like, with this one example, and that they must not add `https://` or `/mcp/api/v1`:

   `qaiks-070226.instance.dataos.cloud`

2. Codex builds `https://<hostname>/mcp/api/v1`. Tell them to set that hostname on the DataProduct MCP plugin (plugin settings / MCP URL), enable the **dataproduct-mcp** server if it is disabled, then reply here when it is saved and enabled.
3. Stop and wait. Do not start login until they confirm save and enabled.
4. After they confirm, start OAuth (`mcp login` / the Codex auth prompt for `dataproduct-mcp`) so the browser opens. Tell them to finish login there.
5. If tools are still missing, the MCP is still disabled or the hostname is wrong. Show the same example and ask them to enable the server and save the hostname again.
6. When tools are available, confirm the server is running.
