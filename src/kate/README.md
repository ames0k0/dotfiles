# Kate Editor NOTES

Config data for this.editor

### LSP :: Python
- [Example: Setting The Python LSP](https://discuss.kde.org/t/setting-the-python-lsp-to-use-pylint-in-kate/2321)
- [Example: PYLS](https://github.com/palantir/python-language-server/issues/229#issuecomment-358689188)
```json
{
  "servers": {
    "python": {
      "command": ["$HOME/.venv/p3116/bin/pylsp", "--check-parent-process"],
      "url": "https://github.com/python-lsp/python-lsp-server",
      "highlightingModeRegex": "^Python$",
      "settings":{
        "pylsp": {
          "plugins": {
            "pycodestyle": {
              "enabled": true,
              "ignore": ["E114"]
            }
          }
        }
      }
    }
  }
}
```
