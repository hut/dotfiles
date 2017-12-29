# What?

This is a custom keyboard layout.  Only the part in 'xkb_symbols "basic"' after
"// Hut" is really relevant.

I use this command after each system update to update my us layout:

vimdiff ...path/to/us_hut /usr/share/X11/xkb/symbols/us

## why not xmodmap?

xmodmaps won't be applied to newly connected keyboards.  I'd have to write an
udev rule for it and meh, this is easier.

## why not simply a patch?

the base file constantly changes and a patch wouldn't apply cleanly anymore
after a while
