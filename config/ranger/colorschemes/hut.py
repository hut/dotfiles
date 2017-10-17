# This file is part of ranger, the console file manager.
# License: GNU GPL version 3, see the file "AUTHORS" for details.

from ranger.gui.color import *
from ranger.colorschemes.default import Default

class Scheme(Default):
    def use(self, context):
        fg, bg, attr = Default.use(self, context)

        if getattr(context, 'scaffold', False):
            fg = 208

        return fg, bg, attr
