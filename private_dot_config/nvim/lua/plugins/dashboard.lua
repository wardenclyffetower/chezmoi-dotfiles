local newheader = [[
 _______                ____   ____.__          
 \      \    ____   ____\   \ /   /|__|  _____  
 /   |   \ _/ __ \ /  _ \\   Y   / |  | /     \ 
/    |    \\  ___/(  <_> )\     /  |  ||  Y Y  \
\____|__  / \___  >\____/  \___/   |__||__|_|  /
        \/      \/                           \/ 
]]
return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = newheader,
      },
      sections = {
        { section = "header" },
        -- { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        -- { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        -- { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        -- { section = "startup" },
      },
    },
  },
}
