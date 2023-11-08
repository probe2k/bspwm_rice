local global = require('core.global')

local function load_options()
	local global_local = {
		termguicolors  = true;
		fileformats    = "unix";
		encoding       = "utf-8";
		clipboard      = "unnamedplus";
		wildignorecase = true;
		backup         = true;
		writebackup    = true;
		undofile       = true;
		swapfile       = false;
		directory      = global.cache_dir .. "swag/";
		undodir        = global.cache_dir .. "undo/";
		backupdir      = global.cache_dir .. "backup/";
		viewdir        = global.cache_dir .. "view/";
		history        = 4000;
		backupskip     = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim";
		tabstop        = 2;
		shiftwidth     = 2;
		smartindent    = true;
		shiftround     = true;
		ignorecase     = true;
		smartcase      = true;
		infercase      = true;
		incsearch      = true;
		wrap           = true;
		cmdheight      = 0;
		splitbelow     = true;
		splitright     = true;
		showtabline    = 1;
		showcmd        = true;
		showcmdloc     = 'statusline';
		equalalways    = false;
		laststatus     = 3;
		display        = "lastline";
		list           = true;
		showbreak      = "󱞩";
		listchars      = "tab:┊ ,nbsp:+,trail:·,extends:→,precedes:←,eol:↲";
		title          = true;
		background     = "dark";
		fileencoding   = "utf-8";
		mouse          = "";
		hlsearch       = true;
		autowrite      = true;
		autoread       = true;
		breakindent    = true;
		showmatch      = true;
		numberwidth    = 4;
		relativenumber = true;
		linebreak      = true;
		cursorline     = false;
		number         = true;
		guicursor      = "";
	}

	for name, value in pairs(global_local) do
		vim.o[name] = value
	end
end

load_options()
