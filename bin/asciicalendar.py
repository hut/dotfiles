#!/usr/bin/python3

import math
import os.path
import datetime
import random
import subprocess
import time
import sys
import socket
import dateutil.parser

PLAN_PATH = os.environ.get("ASCIICALENDAR_PATH", os.path.expanduser("~/sync/notes/vimwiki/plan.md"))
MAX_WEEKS_TO_DISPLAY = int(sys.argv[1]) if len(sys.argv) > 1 else 4
MAX_LOOKAHEAD_DAYS = MAX_WEEKS_TO_DISPLAY * 7
COLUMN_WIDTH = 8

TR = "\u2510"
BR = "\u2518"
BL = "\u2514"
TL = "\u250C"
H = "\u2500"
V = "\u2502"
JT = "\u252C"
JR = "\u2524"
JL = "\u251C"
JB = "\u2534"
JC = "\u253C"
UNDERLINE = ""
#UNDERLINE = "\u0332"
ETC = "\u2026"

CLR = 208
CLR_REGULAR = CLR
CLR_IMPORTANT = 73
CLR_TODAY_BG = 24
CLR_TODAY = CLR
CLR_QUOTE = 211
CLR_NEWMONTH = 159

def _strtodate(string):
    return dateutil.parser.parse(string).date()

def _clr(string, fg=None, bg=None):
    color = []
    if fg: color.append("38;5;%s" % fg)
    if bg: color.append("48;5;%s" % bg)
    return "\033[%sm%s\033[0m" % (";".join(color), string)

def _underline(string, fg=None, bg=None):
    print(_clr(string, fg=fg, bg=bg), end="")
    #print(_clr("".join(c + UNDERLINE for c in string), fg=fg, bg=bg), end="")

class AsciiCalendar(object):
    def __init__(self):
        pass

    def read_file(self, filename):
        today = datetime.date.today()
        with open(filename, "r") as planfile:
            plan = planfile.read().rstrip("\n").split("\n")
        self.items = items = dict()
        for item in plan:
            if item.startswith("#"):
                continue
            date, name = item.split(" ", 1)
            date = _strtodate(date)

            if (date - today).days < MAX_LOOKAHEAD_DAYS:
                items[date] = name
        self.dates = list(sorted(items))

    def anything_to_display(self):
        today = datetime.date.today()
        finalday = today + datetime.timedelta(days=7 * MAX_WEEKS_TO_DISPLAY - today.weekday())
        return any(today <= date <= finalday for date in self.items)

    def printweek(self, date):
        today = datetime.date.today()
        _underline('{:>2}'.format(date.day) + V, fg=CLR)
        for weekday in range(7):
            bg = None
            fg = CLR
            important = False
            day = date + datetime.timedelta(weekday-date.weekday())
            if day in self.items:
                description = self.items[day]
                if description.endswith("!"):
                    description = description[:-1]
                    important = True
                    fg = "%d" % (CLR if day == today else CLR_IMPORTANT)
                else:
                    fg = "%d" % CLR_REGULAR
                if day == today:
                    fg = CLR_TODAY
                days_until = (day - today).days
                if days_until > 1 and important:
                    w = COLUMN_WIDTH - len(str(days_until))
                    if len(description) > w:
                        description = description[:w][:-1] + ETC
                    entry = "{s:<{w}}{d}".format(
                            s=description[:w],
                            w=w,
                            d=days_until)
                else:
                    entry = "{s:%(fillchar)s<{w}}" % {'fillchar': H}
                    entry = entry.format(s=description[:COLUMN_WIDTH], w=COLUMN_WIDTH)
            else:
                entry = H * COLUMN_WIDTH
            if day == today:
                bg = CLR_TODAY_BG
            separator_color = fg
            if (date + datetime.timedelta(weekday-date.weekday() + 1)).day == 1:
                separator_color = CLR_NEWMONTH
            _underline(entry, fg=fg, bg=bg)
            _underline(V, fg=separator_color)
        print("")

    def print(self):
        #print(TL + JT.join([H * COLUMN_WIDTH] * 7) + TR)
        today = datetime.date.today()
        date = today - datetime.timedelta(today.weekday())
        oneweek = datetime.timedelta(weeks=1)
        count = 0
        while date <= self.dates[-1] and count < MAX_WEEKS_TO_DISPLAY:
            #if date != today: print(JL + JC.join([H * COLUMN_WIDTH] * 7) + JR)
            self.printweek(date)
            date += oneweek
            count += 1
        #print(BL + JB.join([H * COLUMN_WIDTH] * 7) + BR)

def main():
    if os.path.exists(PLAN_PATH):
        cal = AsciiCalendar()
        cal.read_file(PLAN_PATH)
        if cal.anything_to_display():
            cal.print()

if __name__ == '__main__':
    main()
