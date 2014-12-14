
makeBigramsRDS <- function() {
    bigrams <- read.table(
        '../bigrams.txt',
        sep = ' ',
        col.names = c('first', 'second'),
        as.is = TRUE
    )
    saveRDS(bigrams, file = 'data/bigrams.rds')
}
