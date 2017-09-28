import re as _re


def grep(what, regexp):
    if isinstance(what, str):
        match = _re.search(regexp, what)
        if match:
            return match.group(0)
        else:
            return what
    else:
        cls = what.__class__
        result = []
        for item in what:
            if _re.search(regexp, item):
                result.append(item)
        return cls(result)


def sed(string, pattern, replace, count=0):
    if isinstance(string, str):
        return _re.sub(pattern, replace, string, count=count)
    elif hasattr(string, '__iter__'):
        return list(sed(item, pattern, replace, count=count)
                for item in string)


def dictForPartialFormatting(dict):
    def __missing__(self, key):
        return '{%s}' % key
