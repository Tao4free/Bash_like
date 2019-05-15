#!/bin/bash
# https://stackoverflow.com/questions/6605006/convert-pdf-to-image-with-high-resolution

convert -density 300 -trim test.pdf -quality 100 test.jpg
