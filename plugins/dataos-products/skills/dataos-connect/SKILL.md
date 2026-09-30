---
name: dataos-connect
description: Connect a customer DataOS Products MCP instance to local Codex using its hostname and OAuth. Use when asked to set up, reconnect, or troubleshoot DataOS Products tools.
---

# Connect DataOS Products

The customer provides only a hostname such as `clienttech.instance.dataos.cloud`. The MCP endpoint is `https://<hostname>/mcp/api/v1`.

1. If the hostname is missing, ask for it. Do not invent an instance or default to the sandbox.
2. Accept only one DNS label followed by `.instance.dataos.cloud`. Reject a scheme, path, port, credentials, IP address, or another domain. Normalize the hostname to lowercase. A label must be 1–63 letters, digits, or hyphens, with a letter or digit at each end.
3. Check whether the local MCP name `dataos-products` already exists with `codex mcp get dataos-products --json`. If it points to a different instance, explain the conflict and ask before replacing that connection. Do not remove another customer's connection silently.
4. Register the supplied endpoint with `codex mcp add dataos-products --url https://<hostname>/mcp/api/v1`, then run `codex mcp login dataos-products`. Let the user complete OAuth in the browser. Never ask for or store a password or token in chat.
5. Confirm the configured URL with `codex mcp get dataos-products --json` and check that its tools load. If login says `No authorization support detected`, stop after that failure. Report that the URL was registered but OAuth did not start. Ask the DataOS server owner to verify that unauthenticated MCP requests return a `401` with a `WWW-Authenticate: Bearer` challenge pointing to protected-resource metadata, that the metadata advertises a working authorization server, and that Cloudflare permits these requests. A `404` at a guessed metadata path does not identify the issuer or prove which required endpoint is missing. Do not retry login repeatedly, switch instances, or claim the tools are connected.

This is a local Codex marketplace setup flow. It does not provide a public ChatGPT plugin or an install-time hostname field in the plugin card.
