# Candidate Number: 48372

# Part 1. Import packages
library(car)   
library(ggplot2) 
library(pROC)   
library(dplyr)
library(forcats)


# Part 2. Load data
gambling.dat <- read.csv("./gambling2.csv")


# Part 3. Deal with missingness
# Part 3.1 classify categorical and continuous variables
column_names <- c(
  "HHSize" ,"Sex", "age", "maritalg","totinc", "hhdtypb", "OwnRnt08",
  "numcars", "Religsc", "ethnicC", "SrcInc7", "SrcInc15",
  "eqv5", "Econact_2", "EducEnd", "HighQual", "hpnssec5", "RG15a",
  "docinfo1", "compm3", "compm7", "compm8", "compm9", "genhelf2",
  "longill12","bmival", "Active", "ActPhy", "country", "PROBGAM", 
  "ghq12scr", "wemwbs", "SXORIEN", "cigst1", "drating","eqvinc"
)

# Based on the data dictionary, I can tell these variables are continuous:
continuous_vars <- c("age", "HHSize", "eqvinc", "drating", "ghq12scr", "wemwbs","bmival")

# And all others are categorical
categorical_vars <- setdiff(column_names, c(continuous_vars))



# Part 3.2 Recode missing values
# from data dictionary, I know that missing codes are:
missing_codes_cat <- c(-1, -2, -6, -8, -9, 96, 97)

# For categorical variables: recode according to missing codes
for (v in categorical_vars) {
  if (v %in% names(gambling.dat)) {
    gambling.dat[[v]][ gambling.dat[[v]] %in% missing_codes_cat ] <- NA
  }
}

# For continuous variables: recode according to missing codes
missing_codes_con <- c(-1, -2, -6, -8, -9, -90)

for (v in continuous_vars) {
  if (v %in% names(gambling.dat)) {
    gambling.dat[[v]][ gambling.dat[[v]] %in% missing_codes_con ] <- NA
  }
}



# Part 3.3 Convert categorical variables (but not including "PROBGAM" - my target) to factors
for (v in setdiff(categorical_vars, "PROBGAM")) {
  gambling.dat[[v]] <- factor(gambling.dat[[v]])
}


# Part 4. variable selection

# Part 4.1 Single logistic regression model: one variable
for (i in setdiff(names(gambling.dat), "PROBGAM")) {
  cat("Predictor Name:", i, "\n")
  
  formula_str <- as.formula(paste("PROBGAM ~", i))
  model <- glm(formula_str, family = binomial(link = "logit"), data = gambling.dat)
  print(anova(model, test = "Chisq"))
  
  cat("\n============================\n")
}


# Part 4.2 Full logistic regression model: all variables
# (SrcInc7, SrcInc15, and docinfo1 are not included because, in the full model, there is only 1 category left for them after NA filtering)

model_full <- glm(PROBGAM ~ age + HHSize + eqvinc + drating + ghq12scr + 
                      wemwbs + bmival + Sex + maritalg + totinc + hhdtypb + OwnRnt08 + 
                      numcars + SXORIEN + Religsc + ethnicC +  
                      eqv5 + Econact_2 + EducEnd + HighQual + hpnssec5 + RG15a +
                      compm3 + compm7 + compm8 + compm9 + genhelf2 + longill12 + Active +
                      ActPhy + country + cigst1, 
                    family = binomial(link = "logit"), 
                    data = gambling.dat
)
anova(model_full, test = "Chisq")

# Based on these 2 models:
# final selection of "non socio-economic" variables are: "sex, age, maritalg, Religsc, RG15a, acompm9, wemwbs, drating, cigst1"
# final selection of "socio-economic" variables are: "SrcInc7, SrcInc15, eqv5, eqvinc, Totinc, Econact_2, OwnRnt08, Hhdtypb, Numcars, EducEnd, HighQual"


# Part 5. Exploratory Analysis

# 5.1  Define Variable Groups based on types for EDA
categorical_socio_eco_variables <- c(
  "SrcInc7", "SrcInc15", "eqv5",
  "EducEnd", "HighQual", "Econact_2",
  "OwnRnt08", "hhdtypb", "numcars", "totinc")

continous_socio_eco_variables <- c("eqvinc")

categorical_other_variables <- c("Religsc","Sex", "maritalg", "RG15a", "cigst1", "compm9")

continous_other_variables <- c("age", "drating", "wemwbs")

# 5.2 Continuous Variables
par(mfrow = c(1,2))
for (v in c(continous_socio_eco_variables, continous_other_variables)) {
  boxplot(log1p(gambling.dat[[v]]) ~ gambling.dat$PROBGAM,
          names = c("Non-Gam", "Gam"),
          main = paste("log(", v, ") by PROBGAM"),
          col = "lightblue")
}


# 5.3 Categorical Variables
par(mfrow = c(1, 2), mar = c(8, 4, 4, 2))  # Increase bottom margin for longer labels

for (v in c(categorical_socio_eco_variables, categorical_other_variables)) {
  tab <- prop.table(table(gambling.dat[[v]], gambling.dat$PROBGAM), 1)
  
  barplot(t(tab),
          main = paste(v, "vs PROBGAM"),
          ylab = "Within group %",
          las = 2,                      # Rotate axis labels
          col = c("grey", "lightblue"),
          cex.names = 0.8,
          ylim = c(0.7, 1))              # Shrink x-label font size
  
  legend("bottomright", inset = c(0, -0.75), xpd = TRUE,
         legend = c("Non-Gam", "Gam"),
         fill = c("grey", "lightblue"),
         cex = 0.8,
         bty = "n")
}


# Part 6. Rename & Merge categories
# (1) Rename categories from numbers to meaningful text labels to make sense + 
# (2) Combine some categories if multicollinearity (GVIF) / sample within the one category is too small

gambling.dat <- gambling.dat %>% 
  mutate(
    # Sex
    Sex = fct_recode(as.factor(Sex),
                     Male   = "1",
                     Female = "2") %>% droplevels(),
    
    # Marital status (merge happend)
    maritalg = fct_collapse(as.factor(maritalg),
                          Married           = c("1","2","4"),
                          Not_Married    = c("3","5","6")) %>% droplevels(),
    
    ## Income support?
    SrcInc7  = fct_recode(as.factor(SrcInc7),
                          No  = "0",
                          Yes = "1") %>% droplevels(),
    
    ## No source of income?
    SrcInc15 = fct_recode(as.factor(SrcInc15),
                          No  = "0",
                          Yes = "1") %>% droplevels(),
    
    ## Equivalised income
    eqv5 = fct_recode(as.factor(eqv5),
                      `Top >£49k`    = "1",
                      `2nd £30-£49k`  = "2",
                      `3rd £19-£30k`  = "3",
                      `4th £13-£19k`  = "4",
                      `Bottom <£13k` = "5") %>% droplevels(),
    
    ## Age finished full time education (merge happend)
    EducEnd = fct_collapse(as.factor(EducEnd),
                           Yet_to_finish = "1",
                           finished_before_14  = c("2","3"),
                           `finished_15-18`    = c("4","5","6","7"),
                           `finished_after_19`      = "8") %>% droplevels(),
    
    ## Highest qualification achieved (merge happend)
    HighQual = fct_collapse(as.factor(HighQual),
                            `Degree_or_higher`             = "1",
                            Higher_but_below_Degree   = "2",
                            `A/GCSE`              = c("3","4"),
                            Other_None            = c("5","6")) %>% droplevels(),
    
    ## Economic activity condensed (merge happend)
    Econact_2  = fct_collapse(as.factor(Econact_2),
                            Employed        = "1",
                            Student_full    = "2",
                            Inactive        = c("3","4","5"))  %>% droplevels(),
    
    ## Housing tenure (merge happend)
    OwnRnt08 = fct_collapse(as.factor(OwnRnt08),
                            Owned  = c("1","2"),
                            Rented = c("3","4"), 
                            Free   = "5") %>% droplevels(),
    
    ## Household type (merge happend)
    hhdtypb = fct_collapse(as.factor(hhdtypb),
                           U60Adult_NoChild  = c("1","2"),
                           Family             = c("3","4"),
                           Large_Adult_HH     = "5",
                           OldAdult_NoChild = c("6","7")) %>% droplevels(),
    
    ## Number of cars
    numcars = fct_recode(as.factor(numcars),
                         `1 car` = "1",
                         `2 cars` = "2",
                         `3+ cars`= "3") %>% droplevels(),
    
    ## Regular carer
    RG15a = fct_recode(as.factor(RG15a),
                       Yes = "1",
                       No  = "2") %>% droplevels(),
    
    ## Total household income (merge happend)
    totinc = fct_collapse(as.factor(totinc),
                          `<£1.6.k`      = as.character(1:2),
                          `£1.6-20.8k`  = as.character(3:10),
                          `£20.8-46.8k` = as.character(11:19),
                          `£46.8-120k`   = as.character(20:27),
                          `£120k+`       = as.character(28:31)) %>% droplevels(),
    ## Religion (merge happend)
    Religsc = fct_collapse(as.factor(Religsc),
                           No_Religion     = "1",
                           Christian       = c("2", "3"),
                           Buddish         = "4",
                           Other_Religion  = c("5", "6", "7", "8", "9")) %>% droplevels(),
    ## smoking (merge happend)
    cigst1 = fct_collapse(as.factor(cigst1),
                        Never_smoke     = "1",
                        smoked_before       = c("2", "3"),
                        smoke_now       = "4") %>% droplevels(),
    ## Digestive system issue
    compm9 = fct_collapse(as.factor(compm9),
                          has_condition     = "1",
                          no_condition      = "0") %>% droplevels()
  )


# Part 7. Setting baselines for categorical variables
# Part 7.1 Count frequency for categorical variables
for (v in c(categorical_socio_eco_variables, categorical_other_variables)) {
  cat("Variable Name:", v, "\n")
  freq <- table(gambling.dat[[v]], useNA = "ifany")
  print(freq)
  cat("--------------------------\n")
}

# Part 7.2 set the baseline
gambling.dat <- gambling.dat %>%
  mutate(
# socio-economic ones
    SrcInc7   = relevel(factor(SrcInc7),   ref = "No"),
    SrcInc15  = relevel(factor(SrcInc15),  ref = "No"),
    eqv5      = relevel(factor(eqv5),      ref = "Bottom <£13k"),
    EducEnd   = relevel(factor(EducEnd),   ref = "finished_15-18"),
    HighQual  = relevel(factor(HighQual),  ref = "A/GCSE"),
    Econact_2 = relevel(factor(Econact_2), ref = "Employed"),
    OwnRnt08  = relevel(factor(OwnRnt08),  ref = "Owned"),
    hhdtypb   = relevel(factor(hhdtypb),   ref = "Family"),
    numcars   = relevel(factor(numcars),   ref = "1 car"),
    totinc    = relevel(factor(totinc),    ref = "£20.8-46.8k"),
# others
    Religsc   = relevel(factor(Religsc),   ref = "No_Religion"),
    cigst1    = relevel(factor(cigst1),    ref = "Never_smoke"),
    compm9    = relevel(factor(compm9),    ref = "no_condition"),
    Sex       = relevel(factor(Sex),       ref = "Male"),
    maritalg  = relevel(factor(maritalg),  ref = "Married"),
    RG15a     = relevel(factor(RG15a),     ref = "No")
  )



# Part 8. Logistic regression model
# Part 8.1 model
model_socio_eco <- glm(
  PROBGAM ~ SrcInc7 + SrcInc15 + eqv5 + Religsc +
    EducEnd + HighQual + Econact_2 + eqvinc +
    OwnRnt08 + hhdtypb + numcars + totinc + cigst1 + compm9 +
    age + drating + wemwbs + Sex + maritalg + RG15a,
  family = binomial(link = "logit"),
  data = gambling.dat
)

anova(model_socio_eco, test = "Chisq")
summary(model_socio_eco)

# Part 8.2 Multicollinearity for baseline logistic model
print(vif(model_socio_eco))


# Part 8.3: Confusion Matrix & Accuracy at 0.5 cutoff
mf     <- model.frame(model_socio_eco)
probs  <- predict(model_socio_eco, type = "response")
actual <- factor(mf$PROBGAM, levels = c(0, 1), labels = c("Non-Gambler", "Gambler"))

# Binary classification at 0.5 threshold
pred <- factor(ifelse(probs > 0.5, "Gambler", "Non-Gambler"),
               levels = c("Non-Gambler", "Gambler"))

# Confusion matrix
conf_mat <- table(Predicted = pred, Actual = actual)
print(conf_mat)

# Accuracy
accuracy <- sum(diag(conf_mat)) / sum(conf_mat)
cat("\nOverall Accuracy:", round(accuracy, 4), "\n")



# Part 8.4 ROC curve & AUC
par(mfrow = c(1,1))

roc_obj <- roc(actual, probs)
print(auc(roc_obj))

roc_df <- data.frame(
  FPR = 1 - roc_obj$specificities,
  TPR = roc_obj$sensitivities
)

ggplot(roc_df, aes(x = FPR, y = TPR)) +
  geom_line(color = "blue", size = 1.5) +
  geom_abline(linetype = "dashed", color = "grey") +
  labs(
    title = "ROC Curve No.1: for Baseline Logistic Model",
    x = "False Positive Rate (1 - Specificity)",
    y = "True Positive Rate (Sensitivity)"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(hjust = 0.5)
  )




# Part 9. Improved Logistic regression model
# Part 9.1 Improved Model
model_refined <- glm(
  PROBGAM ~ HighQual + Econact_2 + OwnRnt08 + hhdtypb + SrcInc7 + SrcInc15 + EducEnd +
    numcars + age + drating + wemwbs + Sex + eqvinc + Religsc + cigst1,
  family = binomial(link = "logit"),
  data = gambling.dat
)
anova(model_refined, test = "Chisq")
summary(model_refined)


# Part 9.2 Multicollinearity for improved model
print(vif(model_refined))


# Part 9.3 Confusion Matrix & Accuracy at 0.5 cutoff
mf_imp     <- model.frame(model_refined)
probs_imp  <- predict(model_refined, type = "response")
actual_imp <- factor(mf_imp$PROBGAM, levels = c(0, 1), labels = c("Non-Gambler", "Gambler"))

pred_imp <- factor(ifelse(probs_imp > 0.5, "Gambler", "Non-Gambler"),
                   levels = c("Non-Gambler", "Gambler"))

conf_mat_imp <- table(Predicted = pred_imp, Actual = actual_imp)
print(conf_mat_imp)

accuracy_imp <- sum(diag(conf_mat_imp)) / sum(conf_mat_imp)
cat("\n Overall Accuracy (Improved):", round(accuracy_imp, 4), "\n")


# Part 9.4 ROC Curve & AUC
roc_obj_imp <- roc(actual_imp, probs_imp)
print(auc(roc_obj_imp))

roc_df_imp <- data.frame(
  FPR = 1 - roc_obj_imp$specificities,
  TPR = roc_obj_imp$sensitivities
)

ggplot(roc_df_imp, aes(x = FPR, y = TPR)) +
  geom_line(color = "blue", size = 1.5) +
  geom_abline(linetype = "dashed", color = "grey") +
  labs(
    title = "ROC Curve No.2: for Improved Logistic Model",
    x = "False Positive Rate (1 - Specificity)",
    y = "True Positive Rate (Sensitivity)"
  ) +
  theme_minimal(base_size = 14) +
  theme(plot.title = element_text(hjust = 0.5))

