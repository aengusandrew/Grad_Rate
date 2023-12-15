# Grad_Rate

## Authors
- [Aengus M. Andrew](https://github.com/aengusandrew)
- Sarah Jane Gascoyne

## Description
This repository is for a final project in a *Bayesian Data Analytics* (STAT385) class at Clarkson University. This repo contains all code and all data for this project. The project is written primarily in `R` with the use of the Stan project using the `rstan` package with all coding done in RStudio.

## Paper Goal
The goal of this paper is to use Bayesian Regression techniques to see if there is a linear relationship between certain characteristics and how likely a student is to graduate high school in NYS.

### Data
The data for this project was taken from the [NYS Education Department](https://data.nysed.gov)'s database of graduation rates. We utilized the 2020-2021 data and focused exclusively on the 6-year August Cohort. This means that we looked at the collection of students who had just over 6 years to complete high school. This is the latest that someone can complete high school and have their graduation recorded in this dataset, we felt it was most fair to look at students who had had the most possible time to complete high school and still be reported, so as to not bias the data against students who needed extra time. However it would be interesting as a follow-up project to view the relationships between the demographics we looked at here and the difference in time necessary to graduate high school.

#### Data Cleanup
In this README I will focus on the coding, for a larger overview of the methodology view the paper below. Utilizing `R` we separated our data by school in NYS and in order to best allow for regression using `rstan` for each school the following parameters were defined:
- `beds_code` This is a coding system developed by NYS to assign each school a unique numerical code, in our case it is purely for reference and debugging
- `enroll_count` The number of total students in this graduating class
- `grad_pct` The percentage (as a decimal) after 6 years and 2 months that had successfully graduated with some kind of diploma (the NYS data breaks this up by diploma type, we focus only on whether or nto a diploma was received)
- `nrc_code` The school's **Need to Resource** Code, this is a measure done by the state to express the relative ratio of resources needed by a school to support their students to their available resources, for more details on this see the paper
- `pred_male` Logical value of whether or not the school is predominantly male (more than 50% of the population is male)
- `pred_white` Logical value of whether or not the school is predominantly white (more than 50% of the population is white)
- `exc_disabled`, `exc_ecd`, `exc_esl`, `exc_foster`, `exc_homeless`, `exc_migrant`, `exc_armed` Logical values for whether or not the school has an "excessive" amount of the particular demographic, excessive literally meaning that they are in excess of state of national norms for that demographic, for final values for these ratios see the paper



## Final Paper
The final version of this project is a paper which can be publicly accessed [here](https://google.com) typset in LaTeX using Overleaf. If the link routes to Google, the paper isn't done yet and you should mind your business; Rome wasn't built in a day. Details on the data and code can be best found there or inquiries can be addressed to the authors.