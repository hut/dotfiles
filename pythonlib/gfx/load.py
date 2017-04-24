import numpy as np
import os.path
from PIL import Image

def imgload(filename):
    i = Image.open(os.path.expanduser(filename))
    return np.asarray(i)

def imgshow(array):
    Image.fromarray(array, mode="RGBA").show()
