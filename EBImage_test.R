
library(EBImage)

pluto <- readImage(files = "nh-pluto-mountain-range.png")
pluto <- channel(pluto,"grey")
display(pluto,method = "raster")

pluto.filter <- medianFilter(pluto, 3)
display(pluto.filter,method = "raster")

pluto.renorm <- Image(pluto[] - pluto.filter[])
display(pluto.renorm,method = "raster")

library(LPCM)

fit <- ms(X = pluto.renorm)


