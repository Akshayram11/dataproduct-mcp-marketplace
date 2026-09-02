# DataProduct MCP

Connect Cursor, Codex, or VS Code to your DataOS DataProduct MCP instance
through OAuth. No bearer token is stored in this repository.

The MCP URL is always:

```text
https://<hostname>/mcp/api/v1
```

You only type the **hostname**. Example:

```text
qaiks-070226.instance.dataos.cloud
```

Do not include `https://` or `/mcp/api/v1`.

---

## Cursor

Plugin: [`plugins/dataproduct-mcp-cursor`](plugins/dataproduct-mcp-cursor)
Marketplace: [`.cursor-plugin/marketplace.json`](.cursor-plugin/marketplace.json)

### Install from chat

In Agent chat, paste this exactly (no markdown link):

```text
/add-plugin dataproduct-mcp@https://github.com/Akshayram11/dataproduct-mcp-marketplace
```

### Or import the marketplace

1. Open **Customize → Plugins → + Add**.
2. Paste `https://github.com/Akshayram11/dataproduct-mcp-marketplace`.
3. Keep **Scope** as **User** and click **Import**.
4. Open **dataproduct-mcp** and click **Add** / **Install**.

### After install

1. The agent shows the hostname example. It does not ask you to type the
   URL in chat first.
2. Open **Customize → Plugins → DataProduct MCP**.
3. Click **Configure**, paste the hostname into **DataOS instance FQDN**,
   click **Save**.
4. On the same page, turn **dataproduct-mcp-11** from **Disabled** to
   **Enabled**. A disabled MCP does not load in chat.
5. Reply in chat that it is saved and enabled.
6. The agent starts OAuth (`mcp_auth`). Finish login in the browser.
   Do not use the MCP tab **Authenticate** button.

### Optional: install page

1. Open [`install.html`](install.html).
2. Enter the hostname only.
3. Click **Add to Cursor** and complete OAuth.

---

## Codex

Plugin: [`plugins/codex`](plugins/codex)
Marketplace: [`.agents/plugins/marketplace.json`](.agents/plugins/marketplace.json)

### Install from chat

```text
/add-plugin dataproduct-mcp@https://github.com/Akshayram11/dataproduct-mcp-marketplace
```

Or:

```bash
codex plugin marketplace add https://github.com/Akshayram11/dataproduct-mcp-marketplace
codex plugin add dataproduct-mcp@dataproduct
```

If an old `codex@dataproduct` install exists, remove it first so you get
`dataproduct-mcp@dataproduct`.

### Or Add plugin marketplace

1. **Source:** `https://github.com/Akshayram11/dataproduct-mcp-marketplace`
2. **Git ref:** `main`
3. **Sparse paths:** leave empty, or both of these lines:

   ```text
   .agents/plugins
   plugins/codex
   ```

   Do not use only `plugins/codex`. That fails with
   `marketplace root does not contain a supported manifest`.
4. Click **Add marketplace**, then install **DataProduct MCP**.

### After install

1. Start a new Codex task so the plugin loads.
2. The agent asks for the hostname in chat. Reply with only:

   ```text
   qaiks-070226.instance.dataos.cloud
   ```

3. The agent runs `codex mcp add` and `codex mcp login`.
4. Finish login in the browser.
5. If CLI OAuth fails (`No authorization support detected`), click
   **Plugins → MCPs → Servers → dataproduct-mcp → Authenticate**.
   The toggle must be on.

The Codex plugin card has no hostname edit field. Do not use the gear
next to **Dataproduct-mcp** to set the FQDN.

---

## VS Code (GitHub Copilot)

Plugin: [`plugins/vscode`](plugins/vscode)
Marketplace: [`.github/plugin/marketplace.json`](.github/plugin/marketplace.json)

VS Code does not use `/add-plugin` and does not read the Cursor or Codex
marketplace files. Do not open `vscode://` links in chat — that shows a
blank page.

### One-time settings

Sign in to GitHub Copilot. In user `settings.json`:

```json
{
  "chat.plugins.enabled": true,
  "chat.plugins.marketplaces": [
    "Akshayram11/dataproduct-mcp-marketplace"
  ]
}
```

Reload VS Code.

### Install the plugin

1. If an older **dataproduct-mcp** is installed, uninstall it first
   (avoids the `DATAOS_INSTANCE_FQDN` start error).
2. **Extensions** (`Cmd+Shift+X`) → search `@agentPlugins` →
   **dataproduct-mcp** → **Install** → **Trust**.

Or Command Palette:

```text
Chat: Install Plugin From Source
```

```text
https://github.com/Akshayram11/dataproduct-mcp-marketplace
```

Copilot CLI:

```bash
copilot plugin marketplace browse Akshayram11/dataproduct-mcp-marketplace
copilot plugin install dataproduct-mcp@dataproduct
```

### After install

1. Open a new **Agent** chat (mode must be **Agent**, not plain Chat).
2. Type:

   ```text
   Connect DataProduct MCP
   ```

3. When asked, send only the hostname:

   ```text
   qaiks-070226.instance.dataos.cloud
   ```

4. The agent registers `https://<hostname>/mcp/api/v1`. Do not edit JSON
   or click **Open Configuration**.
5. Complete OAuth in the browser. If no browser opens:
   **MCP: List Servers → dataproduct-mcp → Authenticate**.
