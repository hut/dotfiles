SRC=~/repos/dotfiles

define link
    echo "linking $(2) to $(1)..."
    mkdir -p $(shell dirname $(2))
    if [ -e $(2) -a ! -h $(2) ]; then \
        echo "WARNING: $(2) already exists"; \
        ls -ld $(2); \
    else \
        ln -sf $(SRC)/$(1) $(2); \
    fi
endef

install:
	@$(call link,deploy/payload/tmux.conf,~/.tmux.conf)
	@$(call link,config/bashrc,~/.bashrc)
	@$(call link,config/vim,~/.config/nvim)
	@$(call link,config/screenrc,~/.screenrc)
	@$(call link,config/i3,~/.i3)
	@$(call link,config/ranger/colorschemes,~/.config/ranger/colorschemes)
	@$(call link,config/ranger/plugins,~/.config/ranger/plugins)
	@$(call link,config/gitconfig,~/.config/git/config)
	@$(call link,config/gtkrc,~/.gtkrc)
	@$(call link,config/tigrc,~/.tigrc)
	@$(call link,config/Xdefaults,~/.Xdefaults)
	@$(call link,config/Xmodmap,~/.Xmodmap)

.PHONY: install
