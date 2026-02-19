library(tidyverse)

sigmoid <- function(x) 1 / (1 + exp(-x))

generate_synthetic_ckd_risk_data <- function(n = 1000, seed = 123) {
  set.seed(seed)

  age <- pmin(pmax(rnorm(n, 60, 12), 18), 90)
  sex <- sample(c("F", "M"), size = n, replace = TRUE, prob = c(0.52, 0.48))

  bmi <- rnorm(n, 28.5 + if_else(sex == "M", 1.0, 0.0), 5.0) %>% pmin(60) %>% pmax(16)
  sbp <- (110 + 0.55 * (age - 50) + 0.70 * (bmi - 27) + rnorm(n, 0, 12)) %>% pmin(220) %>% pmax(80)
  hba1c <- (5.4 + 0.03 * (bmi - 27) + 0.01 * (age - 50) + rnorm(n, 0, 0.6)) %>% pmin(14) %>% pmax(4)
  egfr <- (105 - 0.75 * (age - 40) - 0.10 * (sbp - 120) - 2.2 * (hba1c - 5.5) + rnorm(n, 0, 12)) %>% pmin(140) %>% pmax(5)

  linpred <- -7 +
    0.035 * age +
    0.045 * bmi +
    0.015 * sbp +
    0.55  * (hba1c - 5.5) -
    0.030 * egfr +
    0.20  * (sex == "M")

  p_risk <- sigmoid(linpred)
  at_risk <- rbinom(n, 1, p_risk)

  risk_label <- if_else(at_risk == 1, 1L, 2L)      # 1/2 coding
  intervention <- if_else(risk_label == 1L, 1L, 0L)

  df <- tibble(
    age = age,
    sex = sex,
    bmi = bmi,
    sbp = sbp,
    hba1c = hba1c,
    egfr = egfr,
    risk_label = risk_label,
    intervention = intervention
  )

  # --- Missingness ---
  # MAR: sbp missing more in younger
  p_miss_sbp <- sigmoid(-2.2 - 0.02 * (df$age - 50))
  df$sbp[rbinom(n, 1, p_miss_sbp) == 1] <- NA_real_

  # MAR: egfr missing more in females and lower BMI
  p_miss_egfr <- sigmoid(-2.5 + 0.35 * (df$sex == "F") - 0.02 * (df$bmi - 27))
  df$egfr[rbinom(n, 1, p_miss_egfr) == 1] <- NA_real_

  # MNAR: hba1c missing more when high
  p_miss_hba1c <- sigmoid(-3.0 + 0.7 * (df$hba1c - 6.0))
  df$hba1c[rbinom(n, 1, p_miss_hba1c) == 1] <- NA_real_

  # MNAR: bmi missing more when high
  p_miss_bmi <- sigmoid(-3.2 + 0.12 * (df$bmi - 30))
  df$bmi[rbinom(n, 1, p_miss_bmi) == 1] <- NA_real_

  df
}

df <- generate_synthetic_ckd_risk_data(n = 1000, seed = 123)
df
