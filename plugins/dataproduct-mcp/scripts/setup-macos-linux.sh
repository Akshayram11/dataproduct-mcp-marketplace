#!/usr/bin/env sh
set -eu

default_url="https://leidos-sandbox.instance.dataos.cloud/dataproduct-mcp/api/v1"

printf 'DataProduct MCP URL [%s]: ' "$default_url"
IFS= read -r entered_url
mcp_url=${entered_url:-$default_url}

case "$mcp_url" in
  http://*|https://*) ;;
  *)
    printf '%s\n' "Enter a valid URL beginning with http:// or https://." >&2
    exit 1
    ;;
esac

printf 'Bearer token (input is hidden): '
stty -echo
trap 'stty echo' EXIT HUP INT TERM
IFS= read -r mcp_token
stty echo
trap - EXIT HUP INT TERM
printf '\n'

if [ -z "$mcp_token" ]; then
  printf '%s\n' "Bearer token cannot be empty." >&2
  exit 1
fi

escape_single_quotes() {
  printf '%s' "$1" | sed "s/'/'\\\\''/g"
}

escaped_url=$(escape_single_quotes "$mcp_url")
escaped_token=$(escape_single_quotes "$mcp_token")
config_file="$HOME/.dataproduct-mcp.env"

umask 077
{
  printf "export DATAPRODUCT_MCP_URL='%s'\n" "$escaped_url"
  printf "export DATAPRODUCT_MCP_TOKEN='%s'\n" "$escaped_token"
} > "$config_file"
chmod 600 "$config_file"

mcp_file=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)/.mcp.json
escaped_json_url=$(printf '%s' "$mcp_url" | sed 's/[\/&]/\\&/g')
temporary_mcp_file="$mcp_file.tmp.$$"
sed "s/\"url\": \"[^\"]*\"/\"url\": \"$escaped_json_url\"/" "$mcp_file" > "$temporary_mcp_file"
mv "$temporary_mcp_file" "$mcp_file"

shell_name=$(basename "${SHELL:-sh}")
case "$shell_name" in
  zsh) profile_file="$HOME/.zshrc" ;;
  bash) profile_file="$HOME/.bashrc" ;;
  *) profile_file="$HOME/.profile" ;;
esac

source_line='. "$HOME/.dataproduct-mcp.env"'
if ! grep -F "$source_line" "$profile_file" >/dev/null 2>&1; then
  printf '\n%s\n' "$source_line" >> "$profile_file"
fi

if command -v launchctl >/dev/null 2>&1; then
  launchctl setenv DATAPRODUCT_MCP_URL "$mcp_url"
  launchctl setenv DATAPRODUCT_MCP_TOKEN "$mcp_token"
fi

printf '%s\n' "DataProduct MCP configuration saved in $config_file."
printf '%s\n' "MCP endpoint updated in $mcp_file."
printf '%s\n' "Fully quit and reopen Codex before using the plugin."
