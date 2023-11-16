library(bayesrules)
library(bayesplot)
library(tidyverse)
library(rstanarm)

data("weather_WU")

weather_WU %>% 
  group_by(location) %>% 
  tally()

weather_WU %>% 
  select(location, windspeed9am, humidity9am, pressure9am, temp9am, temp3pm)

ggplot(weather_WU, aes(x = temp9am, y = temp3pm)) +
  geom_point()

weather_model = stan_glm(
  temp3pm ~ temp9am,
  data = weather_WU, family = gaussian,
  prior_intercept = normal(25,5),
  prior = normal(0,2.5,autoscale = TRUE),
  prior_aux = exponential(1,autoscale = TRUE),
  chains = 4, iter = 5000*2, seed = 8675309)

prior_summary(weather_model)

# posterior credible interval
posterior_interval(weather_model, prob = 0.80)

# pp_check

pp_check(weather_model)



# Using categorical regression
# Here we define now that our Beta0 is the standard afternoon temperature in Uluru and that our Beta1 is a standard increase or decrease in temperature that is the difference between Uluru and Wollongong

weather_model_2 = stan_glm(
  temp3pm ~ location,
  data = weather_WU, family = gaussian,
  prior_intercept = normal(25,5),
  prior = normal(0,2.5, autoscale = TRUE),
  prior_aux = exponential(1, autoscale = TRUE),
  chains = 4, iter = 5000*2, seed = 8675309)

# Evaluation
mcmc_trace(weather_model_2)
mcmc_dens_overlay(weather_model_2)

# Data Frame analysis
weather_model_2_df = as.data.frame(weather_model_2)

weather_model_2_df %>% 
  mutate(uluru = `(Intercept)`, wollongong = `(Intercept)` + locationWollongong) %>% 
  mcmc_areas(pars = c('uluru', 'wollongong'))






