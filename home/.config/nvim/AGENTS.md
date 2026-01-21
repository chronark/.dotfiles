# Agent Guidelines for NvChad Config

## Build/Lint/Test Commands
- Format Lua files: `stylua <file>.lua`
- No test suite (this is a Neovim configuration)
- Reload config: Restart Neovim or use `:source %`

## Code Style
- **Language**: Lua only
- **Formatting**: Use StyLua with settings from `.stylua.toml` (120 char width, 2 spaces, double quotes preferred, no call parentheses)
- **Imports**: Use `require` statements; load NvChad modules with `require "nvchad.modulename"`
- **Structure**: Place custom plugins in `lua/plugins/init.lua`, configs in `lua/configs/`, mappings in `lua/mappings.lua`
- **Plugin Configuration**: Follow lazy.nvim spec format with `opts` tables for plugin options
- **Comments**: Minimal; use only for important clarifications
- **Naming**: Use snake_case for variables and file names

## Architecture
- This repo uses NvChad (v2.5) as a base plugin framework
- Custom configurations extend NvChad defaults via `require` statements
- Plugin management via lazy.nvim
- Keep customizations minimal; prefer NvChad defaults when possible
