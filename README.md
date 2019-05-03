# zsh-dircolors

[Solarized dircolors](https://github.com/seebi/dircolors-solarized) plugin for
zsh.

## Installation

Note that after installing this plugin, the terminal must be restarted or a new terminal session must be created.

### Manual

1. Clone this repository somewhere on your computer. For example:

    ```sh
    git clone --recursive https://github.com/pszynk/zsh-dircolors ~/.zsh/zsh-dircolors
    ```

2. Add the following snippet to your `.zshrc`:

    ```sh
    source ~/.zsh/zsh-dircolors/zsh-dircolors.plugin.zsh
    ```

### Antigen

I recommend using [antigen](https://github.com/zsh-users/antigen), but it is
also compatible with other plugin managers.

1. Add the following line in your `.zshrc`:

    ```
    antigen bundle pszynk/zsh-dircolors.git
    ```

### Oh-my-zsh

1. Clone this repository into `$ZSH_CUSTOM/plugins` (by default `~/.oh-my-zsh/custom/plugins`)

    ```sh
    git clone --recursive git://github.com/pszynk/zsh-dircolors $ZSH_CUSTOM/plugins/zsh-dircolors
    ```

2. Add the plugin to the list of plugins for Oh My Zsh to load:

    ```sh
    plugins=(zsh-dircolors)
    ```

## Usage

This plugin offers two commands:

* `lsdircolors` which lists the available solarized themes. For now there are:
    * `dircolors.ansi-universal` (universal theme for 16- and 256-color terminals)
    * `dircolors.ansi-dark` (optimized version of universal for dark background)
    * `dircolors.ansi-light` (optimized version of universal for light background)
    * `dircolors.256dark` (degraded solarized dark theme)

* `setupdircolors` which installs a theme and saves the current configuration to
  the configuration file (`$HOME/.zsh-dircolors.config` by default). Without any
  argument, `setupdircolors` will use the theme `dircolors.ansi-universal`.
  
`setupdircolors` must be run at least once in order to create the configuration file. After doing so, the plugin will automatically load your configuration each time a zsh session is started.
