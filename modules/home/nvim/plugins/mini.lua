local statusline = require 'mini.statesline'
statusline.setup { use_icons = vim.g.have_nerd_font }
statusline.section_location = function()
        return '%2l:%-2v'
end
