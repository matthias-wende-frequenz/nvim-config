-- local colorscheme = "onedark"
-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--   vim.notify("colorscheme " .. colorscheme .. " not found!")
--   return
-- end

vim.cmd [[
    set background=light " required to ensure it's using the dark theme

    let g:onedark_terminal_italics = 1
    let g:onedark_hide_endofbuffer = 1
    colorscheme PaperColor

    hi link LspComment Comment

    if &background == 'dark'
        colorscheme nord
        hi Search gui=bold guifg=yellow
        hi LspReferenceText  gui=none guibg=#393939 "guifg=#C0C0C0
        hi LspReferenceRead  gui=bold guibg=#309930 "guifg=#FFFFFF
        hi LspReferenceWrite gui=bold guibg=#994040 "guifg=#FFFFFF

        "hi LspReferenceText  gui=none guibg=#e9e9e9 "guifg=#C0C0C0
        "hi LspReferenceRead  gui=bold guibg=#c9f9c9 "guifg=#FFFFFF
        "hi LspReferenceWrite gui=bold guibg=#f9c0c0 "guifg=#FFFFFF
    else
        colorscheme PaperColor
        hi LspReferenceText  gui=none guibg=#e9e9e9 "guifg=#C0C0C0
        hi LspReferenceRead  gui=bold guibg=#c9f9c9 "guifg=#FFFFFF
        hi LspReferenceWrite gui=bold guibg=#f9c0c0 "guifg=#FFFFFF
        hi Search gui=bold guibg=#c99090 guifg=#FFFFFF
    endif

    hi DiagnosticUnderline gui=undercurl guisp=red
    hi DiagnosticUnderlineError gui=undercurl guisp=red
    hi DiagnosticUnderlineHint gui=undercurl guisp=yellow
    hi DiagnosticUnderlineInfo gui=undercurl guisp=blue
    hi DiagnosticUnderlineInformation gui=undercurl guisp=green
    hi DiagnosticUnderlineWarning gui=undercurl guisp=yellow

    hi DiagnosticVirtualTextHint guifg=gray

    " TODO: port over remaining (Comment, Diagnostics...) to coc.nvim hilight groups (see `:h coc-highlight`)
    hi link CocHighlightText  LspReferenceText
    hi link CocHighlightRead  LspReferenceRead
    hi link CocHighlightWrite LspReferenceWrite

    hi CocInlayHint guifg=#9d8f5e gui=italic

]]

require("onedarkpro").setup({
    options = {
        terminal_colors = true, -- true is actually the default, but better be explicit.
        transparency = true,
        cursorline = true,
    },
    colors = {
        dark_red = "require('onedarkpro.helpers').darken('red', 10, 'onedark')",
        cursorline = "#FF0000", -- This is optional. The default cursorline color is based on the background
        -- highlight_inactive_windows = true,
    },
    highlights = {
        CustomRedHighlight = {
            fg = "${dark_red}",
        },
    }
})

function ToggleTheme()
    if vim.o.background == "dark" then
        vim.cmd("colorscheme onelight")
        -- vim.cmd("set background light")
    else
        vim.cmd("colorscheme PaperColor")
        vim.o.background = 'dark'
        -- vim.cmd("set background dark")
    end
end

-- vim.api.nvim_set_keymap('n', '<Leader>ct', ':lua ToggleTheme()<CR>', { noremap = true, silent = true })

-- vim.cmd [[ autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.buf.semantic_tokens_full() ]]
