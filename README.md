# onedark-minimal

This is a very (very) minimal port of [onedark.vim](https://github.com/joshdick/onedark.vim) to lua. It strips the colorscheme of lots of features:

- No support for cterm, only gui. If you are using a modern terminal, you can `set termguicolors` to use the gui colors on your terminal.
- No support for language-specific highlighting. You can instead use treesitter for improved language-specific highlighting.
- No support for extra plugins (except Neovim LSP) or statuslines. If you would like support for plugins, you can make use of the exposed highlight function (see below).

### Installation

Use your preferred plugin manager to clone this repo.

### Usage

The `g:onedark_hide_endofbuffer` option from the original colorscheme is supported. Set this to true if you'd like to hide the tilde characters (`~`) marking the end of buffer.

Although cterm is not supported at all, a `g:onedark_use_italics` option is provided. Italics are disabled by default, if your terminal has support and you would like to use it, set it to true.

Overrides are also supported:
```vim
let g:onedark_overrides = {
    \ "red": "#RRGGBB",
    \ "comment_grey": "#RRGGBB",
    \ " See onedark-minimal.lua for all options.
    \ }
```

You can also use the highlight function:
```lua
-- Inside a lua block
local hi = require"onedark-minimal".hi
hi("Group", {fg = "", bg = "", sp = "", gui = ""})
```

### LICENSE

```
The MIT License (MIT)

Copyright (c) 2021 quintik

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```

