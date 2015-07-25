library(LPCM)

data(faithful)
foo <- ms.self.coverage(faithful,gridsize= 10, taumin=0.1, taumax=0.5,
                        plot.type="o")    # need higher gridsizes in practice!
h <- select.self.coverage(foo)$select
fit <- ms(faithful,h=h[1])
coverage(fit$data, fit$cluster.center)

