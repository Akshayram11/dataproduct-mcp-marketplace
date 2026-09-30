# DataOS Products for Codex

This repository contains one Codex marketplace plugin: **DataOS Products**. Each customer supplies their DataOS instance hostname, and Codex registers that instance's MCP endpoint before OAuth sign-in.

Examples:

| Customer enters | MCP endpoint Codex registers |
| --- | --- |
| `productsandbox.instance.dataos.cloud` | `https://productsandbox.instance.dataos.cloud/mcp/api/v1` |
| `clienttech.instance.dataos.cloud` | `https://clienttech.instance.dataos.cloud/mcp/api/v1` |

The customer enters only the hostname, without `https://` or `/mcp/api/v1`. The setup skill accepts only hosts under `*.instance.dataos.cloud`. It does not store OAuth passwords or tokens in this repository.

## Install from the marketplace

```bash
codex plugin marketplace add https://github.com/Akshayram11/dataproduct-mcp-marketplace
codex plugin add dataos-products@dataproduct
```

Then start a new Codex task and say **“Connect my DataOS Products instance.”** Give the agent your hostname when it asks. The plugin's `dataos-connect` skill checks the hostname, runs `codex mcp add`, and starts `codex mcp login`. Complete OAuth in the browser.

The marketplace file is [`.agents/plugins/marketplace.json`](.agents/plugins/marketplace.json), and the plugin is in [`plugins/dataos-products`](plugins/dataos-products). This is a Codex marketplace plugin with an interactive setup skill; it intentionally contains no fixed MCP URL that would connect every customer to the sandbox.

## If OAuth does not start

`codex mcp add` only saves the URL. If `codex mcp login dataos-products` reports `No authorization support detected`, use **Plugins → MCPs → Servers → dataos-products → Authenticate** in the ChatGPT desktop app. The setup skill will try to open this action when desktop UI control is available; otherwise it will point you to the button. Keep the server enabled, complete browser sign-in, and then verify its tools load. This UI action can work even when CLI OAuth discovery fails.

If the app's Authenticate action also fails, the DataOS server team should check the following at that customer instance:

1. An unauthenticated MCP request returns `401 Unauthorized` with a `WWW-Authenticate: Bearer` header that points to the protected-resource metadata URL.
2. The protected-resource metadata is publicly reachable and contains `resource` plus an `authorization_servers` list with the real issuer URL.
3. The issuer publishes OAuth authorization-server or OpenID discovery metadata, including authorization and token endpoints, PKCE `S256`, and an OpenAI-compatible client registration method.
4. Cloudflare or another edge layer permits the MCP and discovery requests from Codex. A Cloudflare `403` can block discovery before the DataOS application responds.

Automatic OAuth linking during tool use needs the server's protected-resource metadata, per-tool `securitySchemes`, and an authentication challenge in the tool result. The local setup skill cannot itself press the app's Authenticate button. See [OpenAI's authentication guide](https://developers.openai.com/plugins/build/auth) and the [MCP authorization specification](https://modelcontextprotocol.io/specification/2025-06-18/basic/authorization).

## Scope

This repository provides local Codex setup. It does not create a public ChatGPT plugin or a hostname field on a plugin card. For a public plugin with customer-specific MCP hosts, OpenAI documents [Template MCP Server URLs](https://developers.openai.com/plugins/deploy/app-review), currently limited to trusted developers with an established relationship. The other production route is a stable DataOS MCP gateway that chooses the tenant during OAuth login.
