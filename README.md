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

## Scope

This repository provides local Codex setup. It does not create a public ChatGPT plugin or a hostname field on a plugin card. For a public plugin with customer-specific MCP hosts, OpenAI documents [Template MCP Server URLs](https://developers.openai.com/plugins/deploy/app-review), currently limited to trusted developers with an established relationship. The other production route is a stable DataOS MCP gateway that chooses the tenant during OAuth login.
