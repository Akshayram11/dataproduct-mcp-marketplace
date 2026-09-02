---
name: connect-dataos
description: Collect the DataOS instance FQDN in chat and complete DataProduct MCP OAuth until tools are available. Use after /add-plugin, when DataProduct MCP is missing, fetch failed, or OAuth did not finish.
---

# Connect DataOS

Guide setup in chat. Do not write plugin variables or edit MCP config files.

## Steps

1. Ask for the DataOS instance FQDN (hostname only). Example: `your-instance.instance.dataos.cloud`. No `https://`, no `/mcp/api/v1`.
2. Tell the user to save it in **Customize → Plugins → DataProduct MCP → Configure**, then wait for confirmation.
3. Find the DataProduct MCP namespace (name contains `dataproduct`). Read its `STATUS.md`.
4. Call `mcp_auth` with no arguments when the server needs login.
5. Loop STATUS + `mcp_auth` until the namespace is ready and tools are listed.

`fetch failed` means the URL is missing, wrong, or unreachable. Ask for the FQDN again.
