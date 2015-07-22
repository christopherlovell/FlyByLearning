library(imager)

pluto <- load.image("Projects/RandomForestsSpaceExploration/nh-pluto-mountain-range.png")

imager::display(pluto)

layout(t(1:3))
threshold(pluto,"20%") %>% plot
threshold(pluto,"15%") %>% plot
threshold(pluto,"10%") %>% plot

df <- as.data.frame(pluto)
head(df,5) 

m <- lm(value ~ x + y,data=df) #linear trend
summary(m)

layout(t(1:2))
pluto.f <- pluto-fitted(m)
plot(pluto,main="Before")
plot(pluto.f,main="After trend removal")

layout(t(1:3))
l_ply(paste0(c(20,15,10),"%"),function(v) threshold(pluto.f,v) %>% plot(main=v))


pluto.f.t <- threshold(pluto.f,"16%")
layout(t(1:2))
plot(pluto.f.t,main="Before")
mclosing_square(pluto.f.t,4) %>% plot(main="After morphological closing")
