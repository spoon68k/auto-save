# NeoVim Auto Save

A simple Neovim Lua plugin that autosaves your files after a specified period of inactivity.
The delay is configurable during setup.

## Installation with lazy.nvim

Add the following to your lazy.nvim configuration:

```lua
{
  "your-username/auto-save",  -- Replace with the correct repository path
  config = function()
    require("auto-save").setup({
      debounce_timer = 5000, -- save after 5s of inactivity
    })
  end,
}
```

## Usage

Once installed and configured, the plugin automatically monitors your changes and saves any modified
buffers after the specified delay.

Enjoy seamless autosaving!
