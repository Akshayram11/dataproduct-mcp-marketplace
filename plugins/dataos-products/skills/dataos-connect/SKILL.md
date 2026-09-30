---
name: dataos-connect
description: Connect a customer DataOS Products MCP instance to local Codex using its hostname and OAuth. Use when asked to set up, reconnect, or troubleshoot DataOS Products tools.
---

# Connect DataOS Products

The customer provides only a hostname such as `clienttech.instance.dataos.cloud`. The MCP endpoint is `https://<hostname>/mcp/api/v1`.

1. If the hostname is missing, ask for it. Do not invent an instance or default to the sandbox.
2. Accept only one DNS label followed by `.instance.dataos.cloud`. Reject a scheme, path, port, credentials, IP address, or another domain. Normalize the hostname to lowercase. A label must be 1–63 letters, digits, or hyphens, with a letter or digit at each end.
3. Check whether the local MCP name `dataproduct-mcp` already exists with `codex mcp get dataproduct-mcp --json`. If it points to a different instance, explain the conflict and ask before replacing that connection. Do not remove another customer's connection silently. For a previous `dataos-products` registration, check its URL before migration; remove it only after the new name is registered for the same instance.
4. Register the supplied endpoint with `codex mcp add dataproduct-mcp --url https://<hostname>/mcp/api/v1`, then run `codex mcp login dataproduct-mcp`. This command should launch browser OAuth when the server's discovery is compatible. Let the user complete browser sign-in. Never ask for or store a password or token in chat.
5. Confirm the configured URL with `codex mcp get dataproduct-mcp --json`. If `codex mcp login dataproduct-mcp` reports `No authorization support detected`, quote that error accurately. Do not claim that OAuth was detected or sign-in started. Do not retry the same command or attempt to control Codex's own app UI: computer use cannot access `com.openai.codex`. Explain that automatic redirect requires the DataOS MCP server's OAuth discovery to work. The user can choose the app's **Plugins → MCPs → Servers → dataproduct-mcp → Authenticate** action as a temporary manual route.
6. If CLI OAuth fails, the DataOS server owner should check its `401` `WWW-Authenticate: Bearer` challenge, protected-resource metadata, authorization-server discovery, and any Cloudflare rules. A `404` at a guessed metadata path does not identify the issuer or prove which required endpoint is missing. Do not switch instances. Verify that tools load before claiming the connection works.

This is a local Codex marketplace setup flow. It does not provide a public ChatGPT plugin or an install-time hostname field in the plugin card.
