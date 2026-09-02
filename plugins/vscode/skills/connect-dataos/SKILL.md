---
name: connect-dataos
description: After DataProduct MCP install in VS Code, ask for the DataOS FQDN in chat, add the HTTP MCP server, then start OAuth. Use on first chat, when tools are missing, or when the user mentions DataProduct / DataOS / add-plugin.
---

Follow [AGENTS.md](../../AGENTS.md). Ask for the FQDN in chat, then run `code --add-mcp` (or write `.vscode/mcp.json`). If OAuth does not start, send them to **MCP: List Servers → dataproduct-mcp → Authenticate**.
