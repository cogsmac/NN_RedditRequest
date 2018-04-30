
NNIn = read.table('NNExample.csv', header = TRUE, sep = ",")
library(ggplot2)
library(reshape2)

# create long format
longFormDataNN <- melt(NNIn, id.vars = c('LearningRate', 'Performance'))

# drop nonsense
longFormDataNNVis <- longFormDataNN[longFormDataNN$variable!='X',] # lose X
longFormDataNNVis <- longFormDataNNVis[longFormDataNNVis$variable!='idunno',] # lose 'idunno'
longFormDataNNVis <- longFormDataNNVis[longFormDataNNVis$variable!='X.1',] # lose 'X.1'
longFormDataNNVis <- longFormDataNNVis[longFormDataNNVis$variable!='X.2',] # lose 'X.2'


# simply vis for sake of example; show only one performance
longFormDataNNVis <- longFormDataNNVis[longFormDataNNVis$variable!='performance1',] # lose 'performance1'
longFormDataNNVis <- longFormDataNNVis[longFormDataNNVis$variable!='time1',] # lose 'time1'
longFormDataNNVis <- longFormDataNNVis[longFormDataNNVis$variable!='performance2',] # lose 'performance2'
longFormDataNNVis <- longFormDataNNVis[longFormDataNNVis$variable!='time2',] # lose 'time2'

# coerce layer number to numeric from string
longFormDataNNVis$value = as.numeric(longFormDataNNVis$value)

# quick parallel coordinate plot
ggplot(longFormDataNNVis, aes(x = variable, y = Performance, group = LearningRate)) +   # group = id is important!
  geom_path(,
            alpha = 0.5,
            lineend = 'round', linejoin = 'round') + theme_bw() + geom_text(label = longFormDataNNVis$value)
