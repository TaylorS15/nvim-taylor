# Neovim Configuration Guidelines

## Commands
- Format code: `:lua vim.lsp.buf.format()`
- Lint current file: Uses built-in LSP diagnostics (automatic)
- Run stylua (Lua formatter): `:MasonToolsUpdate stylua`
- Install/update LSP servers: `:MasonToolsUpdate`

## Code Style Guidelines
- **Indentation**: 2 spaces (shiftwidth=2, tabstop=2)
- **Line Endings**: Unix-style (LF)
- **Imports**: Group by source, sort alphabetically
- **Plugin Structure**: Each plugin in separate file under `lua/plugins/`
- **LSP Configuration**: Use mason.nvim for managing LSP servers
- **Naming**: Use snake_case for variables and functions
- **Error Handling**: Use vim.notify for user-facing errors
- **Keymaps**: Define in lua/config/keymaps.lua with descriptive comments
- **Formatting**: Use conform.nvim with prettier and stylua

## Project Structure
- `init.lua`: Main entry point
- `lua/config/`: Core configuration files
- `lua/plugins/`: Plugin-specific configurations