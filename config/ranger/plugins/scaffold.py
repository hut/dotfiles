"""
With this plugin, you can mark certain directories as "scaffold", to denote
that they are a fixed part of your directory structure. The effect is that they
will be sorted first, and can be highlighted by a color scheme, using the key
'scaffold'.

New key bindings:

"++" marks a directory as a scaffold directory
"--" unmarks it again
"""

# Load list of scaffold files from database
import os.path
import ranger.gui.context
import ranger.gui.widgets.browsercolumn
from ranger.container.directory import Directory
from ranger.api.commands import Command

TARGET_PATH = os.path.expanduser("~/.hut/ranger_scaffold")
def set_scaffold_paths():
    ranger.scaffold_paths = [line.rstrip('\n') for line in open(TARGET_PATH).readlines()]
set_scaffold_paths()

# Change sorting method so that scaffold files are displayed on top
old_sort_method = Directory.sort_dict['natural']
def sort_method(path):
    key = old_sort_method(path)
    if path.path in ranger.scaffold_paths:
        key.insert(0, "0000")
    return key
Directory.sort_dict['natural'] = sort_method

# Extend colorscheme
ranger.gui.context.CONTEXT_KEYS.append("scaffold")
ranger.gui.context.Context.scaffold = False

# Add commands to add/remove scaffold files
class scaffold_add(Command):
    def execute(self):
        f = open(TARGET_PATH, 'r')
        files = f.read().rstrip("\n").split("\n")
        f.close()

        f = None

        for file in self.fm.thistab.get_selection():
            if file.path not in files:
                if not f:
                    f = open(TARGET_PATH, 'a')
                f.write(file.path)
                f.write("\n")

        if f is not None:
            f.close()

        set_scaffold_paths()

class scaffold_remove(Command):
    def execute(self):
        f = open(TARGET_PATH, 'r')
        files = f.read().rstrip("\n").split("\n")
        f.close()

        new_files = list(files)
        for file in self.fm.thistab.get_selection():
            while file.path in new_files:
                new_files.remove(file.path)

        if len(new_files) != len(files):
            f = open(TARGET_PATH, 'w')
            f.write("\n".join(new_files) + "\n")
            f.close()
        set_scaffold_paths()


# Bind those commands to keys
old_hook_init = ranger.api.hook_init
def hook_init(fm):
    old_hook_init(fm)
    fm.execute_console("map ++ chain scaffold_add; reset")
    fm.execute_console("map -- chain scaffold_remove; reset")
ranger.api.hook_init = hook_init

# Bind a hook that injects the "scaffold" color key
hook_before_drawing = ranger.gui.widgets.browsercolumn.hook_before_drawing
def hook_before_drawing__scaffold(drawn, this_color):
    if drawn.path in ranger.scaffold_paths:
        this_color.append("scaffold")
    return hook_before_drawing(drawn, this_color)
ranger.gui.widgets.browsercolumn.hook_before_drawing = hook_before_drawing__scaffold
