return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear() end)
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>hsq", function() harpoon:list():replace_at(1) end)
    vim.keymap.set("n", "<leader>hsw", function() harpoon:list():replace_at(2) end)
    vim.keymap.set("n", "<leader>hse", function() harpoon:list():replace_at(3) end)
    vim.keymap.set("n", "<leader>hsr", function() harpoon:list():replace_at(4) end)
    vim.keymap.set("n", "<leader>hst", function() harpoon:list():replace_at(5) end)
    vim.keymap.set("n", "<leader>hsy", function() harpoon:list():replace_at(6) end)

    vim.keymap.set("n", "<leader>hq", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>hw", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>he", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>hr", function() harpoon:list():select(4) end)
    vim.keymap.set("n", "<leader>ht", function() harpoon:list():select(5) end)
    vim.keymap.set("n", "<leader>hy", function() harpoon:list():select(6) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>h<Tab>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<leader>h<S-Tab>", function() harpoon:list():next() end)

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    vim.keymap.set("n", "<C-h>", function() toggle_telescope(harpoon:list()) end,
      { desc = "Open harpoon window" })
  end
}
