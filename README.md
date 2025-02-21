# nvim-autosave

A simple Neovim Lua plugin that autosaves your files after a specified period of inactivity.
The delay is determined by the `NVIM_AUTOSAVE` environment variable (in milliseconds).

## Features

- **Debounced Autosave:** Files are automatically saved after a period of inactivity.
- **Configurable:** Enable autosave by setting the `NVIM_AUTOSAVE` variable to your desired debounce delay.

## Installation with lazy.nvim

Add the following to your lazy.nvim configuration:

```lua
{
  "your-username/nvim-autosave",  -- Replace with the correct repository path
  config = function()
    require("autosave").setup()
  end,
}
```

## Configuration

Set the environment variable `NVIM_AUTOSAVE` in your shell before launching Neovim. For example:

```sh
export NVIM_AUTOSAVE=5000
```

This configuration will autosave files 5 seconds after you stop typing. If set to `0` or unset,
utosave is disabled.

## Usage

Once installed and configured, the plugin automatically monitors your changes and saves any modified
buffers after the specified delay.

Enjoy seamless autosaving!
