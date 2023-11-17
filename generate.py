import os
import pillow_avif

import numpy as np
from PIL import Image

colors = np.random.rand(16, 3)

os.makedirs('blob', exist_ok=True)

for i, color in enumerate(colors, start=1):
    image = np.ones((64, 64, 3), dtype=np.uint8) * (color * 255)    

    Image.fromarray(image, 'RGB').save(f'blob/{i:02d}.avif', format='avif')
