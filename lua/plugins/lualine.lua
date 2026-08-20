return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
    require('lualine').setup({
      options = {
        theme = 'dracula', -- or your preferred theme
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          {
            'buffers',
            show_filename_only = true,      -- only show filename (not full path)
            show_modified_status = true,    -- show ● when buffer is modified
            mode = 0,                       -- 0 = just name
            max_length = vim.o.columns * 2 / 3,
            symbols = {
              modified = ' ●',              -- symbol for modified buffers
              alternate_file = '#',
              directory = '',
            },
            buffers_color = {
                active = 'lualine_a_normal',     -- uses the same color as mode section
                inactive = 'lualine_c_inactive',
            },
          },
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    })
    end
}
