{
  lib,
  config,
  pkgs,
  ...
}: {
  # Neovim configuration via nvf
  vim = {
    globals.mapleader = " ";
    options.shiftwidth = 2;

    ############
    # Cosmetic #
    ############

    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
      transparent = true;
    };

    statusline.lualine.enable = true;

    ui = {
      breadcrumbs.enable = true;
      noice.enable = true;
      borders = {
        enable = true;

        plugins = {
          which-key.enable = true;
          nvim-cmp.enable = true;
        };
      };
    };

    visuals = {
      highlight-undo.enable = true;
      indent-blankline.enable = true;
      nvim-scrollbar.enable = true;
      nvim-web-devicons.enable = true;
    };

    #############
    # Utilities #
    #############

    utility = {
      sleuth.enable = true; # Auto indent-size adjust
      yazi-nvim = {
        # Terminal File explorer
        enable = true;
        setupOpts.open_for_directories = true;
      };
    };
    binds.whichKey.enable = true; # Keymap helper pop-up

    # Parametrable fuzzy finder
    telescope = {
      enable = true;
      mappings = {
        # File navigation
        findFiles = "<leader>sf";
        liveGrep = "<leader>sg";

        # Git navigation
        gitCommits = "<leader>gc";
        gitStatus = "<leader>gs";

        # LSP navigation
        lspDefinitions = "<leader>gd";
        lspReferences = "<leader>gr";
      };
    };

    # Git integrations
    git = {
      enable = true;
      gitsigns.enable = true;
    };

    autocomplete.nvim-cmp.enable = true;
    autopairs.nvim-autopairs.enable = true;

    diagnostics = {
      enable = true;
      nvim-lint.enable = true;
    };

    formatter = {
      conform-nvim.enable = true;
    };

    #############
    # Languages #
    #############

    languages = {
      enableLSP = true;
      enableTreesitter = true;
      enableDAP = true;
      enableFormat = true;
      enableExtraDiagnostics = true;

      # Enabled languages, a->z
      bash.enable = true;
      clang.enable = true;
      css.enable = true;
      html.enable = true;
      java.enable = true;
      markdown = {
        enable = true;
        extensions.render-markdown-nvim.enable = true;
      };
      nix.enable = true;
      python.enable = true;
      sql.enable = true;
      tailwind.enable = true;
      ts.enable = true;
    };

    debugger.nvim-dap = {
      enable = true;
      ui.enable = true;
      mappings = {
        toggleBreakpoint = "<leader>db";
        continue = "<leader>dc";
        stepInto = "<leader>dgi";
        restart = "<leader>dR";

        toggleDapUI = "<leader>du";
      };
    };
  };
}
