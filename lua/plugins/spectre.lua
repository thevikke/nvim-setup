return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    -- Toggle Spectre
    { "<C-s>", function() require("spectre").toggle() end, desc = "Toggle Spectre" },

    -- Search current word
    { "<C-s>w", function() require("spectre").open_visual({ select_word = true }) end, desc = "Search current word" },

    -- Search in current file
    { "<C-s>p", function() require("spectre").open_file_search({ select_word = true }) end, desc = "Search on current file" },
  },
}
