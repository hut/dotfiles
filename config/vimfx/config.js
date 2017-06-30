let map = (shortcuts, command, custom=false) => {
    vimfx.set(`${custom ? 'custom.' : ''}mode.normal.${command}`, shortcuts)
}

// https://github.com/akhodakivskiy/VimFx/blob/master/extension/lib/commands.coffee
map('b', 'history_back')
map('v', 'history_forward')
map('J', 'tab_select_next')
map('K', 'tab_select_previous')
map('<a-`>', 'tab_select_next')
map('<a-~>', 'tab_select_previous')
//map('x', 'sto')
map('D', 'tab_close')
