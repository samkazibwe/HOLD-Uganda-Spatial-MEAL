# Logistic Regression: Impact of VSLA Participation on SRHR Uptake in Kamuli
# Measuring the "Economic Empowerment" link as detailed in HOLD Uganda projects

model_empowerment <- function(data) {
  # Testing if VSLA participation predicts increased health uptake in Bugaya and Kitayunjwa
  empowerment_model <- glm(health_uptake ~ vsla_savings_total + subcounty_group, 
                           data = data, family = "binomial")
  return(summary(empowerment_model))
}
