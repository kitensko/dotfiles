from IPython import get_ipython
ipython = get_ipython()
# Reload modules automatically
if '__IPYTHON__' in globals():
    ipython.magic('load_ext autoreload')
    ipython.magic('autoreload 2')

# Preload modules
import matplotlib.pyplot as plt
import numpy as np
# Chainer
import chainer
import chainer.functions as F, chainer.links as L
