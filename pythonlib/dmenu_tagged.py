import subprocess
import os.path

from pythonlib import prefs

_CODING = "utf-8"

def _get_tagged_files(tags, conffile=None):
    if conffile is None:
        conffile = os.path.expanduser("~/.config/ranger/tagged")
    files = subprocess.check_output(["grep", "-a", "^[%s]:" % tags, conffile])
    filelist = files.decode(_CODING).rstrip("\n").split("\n")
    filelist = [f[2:] for f in filelist]
    return filelist

def _postprocess_list(filelist):
    for item in list(filelist):
        if os.path.isdir(item):
            filelist.remove(item)
            filelist.extend([os.path.join(item, f) for f in os.listdir(item) \
                    if os.path.isfile(os.path.join(item, f))])
        if not os.path.exists(item):
            filelist.remove(item)
    return filelist

def _call_dmenu(filelist):
    names = dict((f.split("/")[-1], f) for f in filelist)
    input_data = "\n".join(sorted(names, key=lambda n: n.lower())).encode(_CODING)

    p = subprocess.Popen(prefs.dmenu, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    out, err = p.communicate(input_data)
    selected = out.decode("utf-8").rstrip("\n")

    if not p.poll() and selected in names:
        target = names[selected]
        filetype = subprocess.check_output(['file', names[selected]]).decode(_CODING)
        if 'executable' in filetype:
            os.execl(target, target)
        else:
            os.execl("/usr/bin/rifle", "/usr/bin/rifle", "-f", "f", target)

def dmenu_tagged(tag):
    files = _postprocess_list(_get_tagged_files(tag))
    _call_dmenu(files)
