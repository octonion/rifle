sink("diagnostics/lmer.txt")

library("lme4")
library("RPostgreSQL")

drv <- dbDriver("PostgreSQL")

con <- dbConnect(drv, dbname="rifle")

query <- dbSendQuery(con, "
select
s.name,
s.home,
s.meet_id,
(s.score::float/100) as score

from ncaa.scores s

where
    s.type='air_rifle'
and s.score is not null
;")

scores <- fetch(query,n=-1)

dim(scores)

attach(scores)

pll <- list()

# Fixed parameters

name <- as.factor(name)
home <- as.factor(home)

fp <- data.frame(name,home)
fpn <- names(fp)

# Random parameters

meet_id <- as.factor(meet_id)

rp <- data.frame(meet_id)
rpn <- names(rp)

for (n in fpn) {
  df <- fp[[n]]
  level <- as.matrix(attributes(df)$levels)
  parameter <- rep(n,nrow(level))
  type <- rep("fixed",nrow(level))
  pll <- c(pll,list(data.frame(parameter,type,level)))
}

for (n in rpn) {
  df <- rp[[n]]
  level <- as.matrix(attributes(df)$levels)
  parameter <- rep(n,nrow(level))
  type <- rep("random",nrow(level))
  pll <- c(pll,list(data.frame(parameter,type,level)))
}

# Model parameters

parameter_levels <- as.data.frame(do.call("rbind",pll))
dbWriteTable(con,c("ncaa","_parameter_levels"),parameter_levels,row.names=TRUE)

g <- cbind(fp,rp)

model <- score ~ -1+name+home+(1|meet_id)
fit <- glmer(model,
	     data=scores,
	     family=binomial(logit),
	     verbose=TRUE,
	     nAGQ=0,
             control=glmerControl(optimizer = "nloptwrap"))

fit
summary(fit)
anova(fit)

# List of data frames

# Fixed factors

f <- fixef(fit)
fn <- names(f)

# Random factors

r <- ranef(fit)
rn <- names(r) 

results <- list()

for (n in fn) {

  df <- f[[n]]

  factor <- n
  level <- n
  type <- "fixed"
  estimate <- df

  results <- c(results,list(data.frame(factor,type,level,estimate)))

 }

for (n in rn) {

  df <- r[[n]]

  factor <- rep(n,nrow(df))
  type <- rep("random",nrow(df))
  level <- row.names(df)
  estimate <- df[,1]

  results <- c(results,list(data.frame(factor,type,level,estimate)))

 }

combined <- as.data.frame(do.call("rbind",results))

dbWriteTable(con,c("ncaa","_basic_factors"),as.data.frame(combined),row.names=TRUE)

quit("no")
