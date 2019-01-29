import datetime
import math
import os.path
import random
import re
import socket
import sys
import time
from collections import deque

if socket.gethostname().startswith('lem'):
    sys.path.append('/projects/xpy')

elif socket.gethostname().startswith('fez'):
    sys.path.append(os.path.expanduser('~/repos/coms'))

    from coms.all import *
