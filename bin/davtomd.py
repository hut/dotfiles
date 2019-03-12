#!/usr/bin/python

import sys
import os
import re

if socket.gethostname() == 'fez':
    root = '/home/hut/me/radicale/collections/collection-root/hut/'
    destination = '/home/hut/me/notes/wiki/lists/auto.md'
else:
    root = '/home/hut/radicale/collections/collection-root/hut/'
    destination = '/home/hut/syncthing/notes/wiki/lists/auto.md'

directories = [
    root + 'Personal',
    root + 'FYI',
    root + 'Aga',
]
date_re = '^DTSTART;(?:TZID=Europe/[^:]+|VALUE=DATE):([^T]{4})([^T]{2})([^T]{2})(?:T.*)?'

class CalDavFile(object):
    def __init__(self, path):
        self.path = path
        self.summary = ''
        self.date = ''

    def parse(self):
        f = open(self.path, 'r')
        for line in f:
            match = re.match('^SUMMARY:(.*)$', line)
            if match:
                self.summary = match.group(1).strip()
            match = re.match(date_re, line)
            if match:
                self.date = '%s-%s-%s' % match.groups()

    def __repr__(self):
        return '<CDF "%s">' % self.summary

    def __str__(self):
        return self.summary

    def markdownlist(self):
        if self.date:
            return '- %s: %s' % (self.date, self.summary)
        return '- %s' % self.summary

concerts = []
movies = []

for directory in directories:
    for f in os.listdir(directory):
        path = os.path.join(directory, f)
        if not os.path.isfile(path):
            continue

        cdf = CalDavFile(path)
        cdf.parse()
        summary = cdf.summary.lower()

        if 'concert' in summary or 'konzert' in summary:
            concerts.append(cdf)

        if 'movie' in summary:
            movies.append(cdf)

for title, items in [('Concerts', concerts), ('Movies', movies)]:
    print("# %s\n" % title)
    items.sort(key=lambda cdf: cdf.date)
    for item in items:
        print(item.markdownlist())
    print("")
