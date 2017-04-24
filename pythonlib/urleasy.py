import urllib.request, sys, re, subprocess, os
import html.parser

class Website(str):
    @property
    def links(self):
        links = []
        class Parser(html.parser.HTMLParser):
            def handle_starttag(self, tag, attrs):
                if tag == 'a':
                    attrs = dict(attrs)
                    if 'href' in attrs:
                        links.append(attrs['href'])
        pars = Parser()
        pars.feed(self)
        return links

def get(url):
    f = urllib.request.urlopen(url)
    s = f.read()
    return Website(s)

def wget(url, filename=None):
    if isinstance(url, list):
        for item in url:
            wget(item, filename=filename)
    else:
        if filename:
            subprocess.call(['wget', '-c', yrl])
        else:
            subprocess.call(['wget', '-c', url, '-O', filename])

def ydl(url):
    if isinstance(url, list):
        for item in url:
            ydl(item)
    else:
        subprocess.call(['youtube-dl', url])

youtubedl = youtube_dl = ydl
