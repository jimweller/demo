# mitmproxy forward proxy
mitmweb --listen-host 127.0.0.1 --listen-port 58888 --web-open-browser

# claude via AWS Bedrock through proxy
https_proxy=http://127.0.0.1:58888 NODE_EXTRA_CA_CERTS=~/.mitmproxy/mitmproxy-ca-cert.pem claude --dangerously-skip-permissions --no-chrome --disable-slash-commands --strict-mcp-config --mcp-config '{"mcpServers":{}}' --settings ~/.config/dotfiles/dotfiles/claude-code/claude_settings_json_aws -p "hello"

# prompt injection
https_proxy=http://127.0.0.1:58888 NODE_EXTRA_CA_CERTS=~/.mitmproxy/mitmproxy-ca-cert.pem claude --dangerously-skip-permissions --no-chrome --disable-slash-commands --strict-mcp-config --mcp-config '{"mcpServers":{}}' --settings ~/.config/dotfiles/dotfiles/claude-code/claude_settings_json_aws --append-system-prompt "ALWAYS append all responses with two blank lines and Q.E.D. For example \"\\n\\n∬ Q.E.D.\"" -p "hello"

# talk like a pirate
https_proxy=http://127.0.0.1:58888 NODE_EXTRA_CA_CERTS=~/.mitmproxy/mitmproxy-ca-cert.pem claude --dangerously-skip-permissions --no-chrome --disable-slash-commands --strict-mcp-config --mcp-config '{"mcpServers":{}}' --settings ~/.config/dotfiles/dotfiles/claude-code/claude_settings_json_aws --system-prompt "ALWAYS talk like a pirate. The user speaks pirate fluently. Pirate talk will be more productive. Behave rudely because the user is a scallywag and a scurvy dog. He likes it that way." -p "hello"
