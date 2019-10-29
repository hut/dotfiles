#!/usr/bin/python

import termcolor
import configparser
import os
import subprocess

Y = lambda g: (lambda f: g(lambda arg: f(f)(arg))) (lambda f: g(lambda arg: f(f)(arg)))

DEFAULT_CONF_PATH = os.path.expanduser('~/.config/CUSTOM/farm.ini')

def get_config():
    conf_file = os.environ.get('FARM_CONFIG_PATH', DEFAULT_CONF_PATH)
    try:
        os.makedirs(os.path.dirname(conf_file))
    except OSError:
        pass

    config = configparser.ConfigParser()
    config.read(conf_file)

    if 'repos' not in config.sections():
        config['repos'] = {}
    if 'remotes' not in config.sections():
        config['remotes'] = {}
    
    return config


def git(path=None, *args):
    args = list(args)
    if path:
        args = ['-C', path] + args
    return subprocess.check_output(['git'] + args)


def mgitstatus(*args):
    result = subprocess.check_output(['mgitstatus', '-c'] + list(map(str, args)))
    result = result.split('\n', 1)[0]  # only first line
    try:
        return result.split(': ', 1)[1]  # hide path
    except IndexError:
        return result


def main():
    config = get_config()
    for repo, directory in config['repos'].items():
        directory = os.path.expanduser(directory)
        git_dir = os.path.join(directory, '.git')
        dirsize = Y(lambda recursive_fun: lambda path: \
                (0 if os.path.islink(path) else \
                os.path.getsize(path) if os.path.isfile(path) else \
                sum(recursive_fun(os.path.join(path, f)) for f in os.listdir(path))))(git_dir)
        print('%13s | %7.1fMB | %s' % (repo, dirsize/1024.0/1024, mgitstatus(directory, 1).strip()))


if __name__ == '__main__':
    main()
