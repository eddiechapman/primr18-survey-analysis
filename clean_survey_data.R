library(tidyverse)



# Load data, normalize column names, remove unused columns.
survey <- read_csv("data/prim&r18.csv") %>%
  rename_all(funs(str_replace(., "Q", ""))) %>%
  select("ResponseId", "3":"133")
  

# Recode -99 as NA. 
# -99 indicates that the multipart question was seen but unanswered.
survey <- survey %>%
  mutate_all(~na_if(., "-99"))


# Remove question info row
survey <- slice(survey, -1:-2)


# Rename columns
survey <- survey %>%
  rename(
    "id" = "ResponseId",
    "consent" = "3",
    "org_type" = "6",
    "org_type_text" = "6_5_TEXT",
    "irb_ethics_primary_concern" = "7",
    "irb_ethics_primary_concern_text" = "7_5_TEXT",
    "academic_institution_type" = "8",
    "role_ethical_review" = "9_4",
    "role_conduct_research" = "9_5",
    "role_administration" = "9_6",
    "role_irb_professional_staff" = "10_1",
    "role_irb_member" = "10_2",
    "role_researcher" = "11_1",
    "role_pi" = "11_2",
    "role_lab_manager" = "11_4",
    "role_grad_student" = "11_5",
    "role_postdoc" = "11_6",
    "role_provost" = "12_1",
    "role_dean_of_research" = "12_2",
    "role_university_institutional_official" = "12_4",
    "academic_research_type" = "13",
    "annual_pervasive_protocols" = "70",
    "percent_pervasive_not_human_subject" = "71_1",
    "percent_pervasive_exempt" = "71_2",
    "percent_pervasive_expedited" = "71_3",
    "percent_pervasive_full_board" = "71_4",
    "percent_pervasive_not_sure" = "71_6",
    "reviewed_social_media_posts" = "72_1",
    "reviewed_social_media_images" = "72_2",
    "reviewed_social_media_profiles" = "72_3",
    "reviewed_network_traffic" = "72_4",
    "reviewed_locational_data" = "72_5",
    "reviewed_sensor_data" = "72_6",
    "reviewed_other" = "72_7",
    "reviewed_other_text" = "72_7_TEXT",
    "most_pervasive_data_in_social_sciences" = "73_1",
    "most_pervasive_data_in_computer_science_engineering" = "73_2",
    "most_pervasive_data_in_natural_sciences" = "73_3",
    "most_pervasive_data_in_arts_humanities" = "73_4",
    "most_pervasive_data_in_medical_health" = "73_5",
    "most_pervasive_data_in_other" = "73_6",
    "most_pervasive_data_in_other_text" = "73_6_TEXT",
    "confidence_researchers_pervasive_data_ethical" = "74_1",
    "confidence_irb_members_pervasive_data_technical" = "74_2",
    "confidence_irb_members_pervasive_data_ethical" = "74_3",
    "irb_has_policy_for_pervasive_data" = "75",
    "irb_policy_for_pervasive_data_usefulness" = "77",
    "irb_guidelines_common_rule" = "78_1",
    "irb_guidelines_belmont_report" = "78_2",
    "irb_guidelines_menlo_report" = "78_3",
    "irb_guidelines_sachrp" = "78_4",
    "irb_guidelines_acm_sigchi" = "78_5",
    "irb_guidelines_aoir" = "78_6",
    "irb_guidelines_apa" = "78_7",
    "irb_guidelines_other" = "78_8",
    "irb_guidelines_none" = "78_9",
    "irb_guidelines_other_text" = "78_8_TEXT",
    "institution_trains_researchers_pervasive_data_ethics" = "79",
    "institution_trains_irb_members_pervasive_data_ethics" = "80",
    "irb_implemented_changes_to_common_rule" = "93"
    )


# Rename case study columns

case_study_rename <- function(survey, case_number, cols) {
  c <- paste0("c", case_number)
  kf <- "key_factor"
  
  irb_would_consider_proposal <- paste(c, "irb_would_consider_proposal", sep = "_")
  site <- paste(c, kf, "public_or_private_site", sep = "_")
  factor_data <- paste(c, kf, "public_or_private_data", sep = "_")
  level_analysis <- paste(c, kf, "level_of_analysis", sep = "_")
  pid <- paste(c, kf, "pid", sep = "_")
  tos <- paste(c, kf, "tos", sep = "_")
  data_reuse <- paste(c, kf, "data_reuse", sep = "_")
  combine_dataset <- paste(c, kf, "combine_dataset", sep = "_")
  method_obtain_data <- paste(c, kf, "method_obtain_data", sep = "_")
  type_of_data <- paste(c, kf, "type_of_data", sep = "_")
  informed_consent <- paste(c, kf, "informed_consent", sep = "_")
  research_purpose <- paste(c, kf, "research_purpose", sep = "_")
  research_impact <- paste(c, kf, "research_impact", sep = "_")
  other <- paste(c, kf, "other", sep = "_")
  other_text <- paste(c, kf, "other", "text", sep = "_")
  personally_consider_proposal <- paste(c, "personally_consider_proposal", sep = "_")
  ethical_concerns_outside_irb_purview <- paste(c, "ethical_concerns_outside_irb_purview", sep = "_")
  ethical_concerns_outside_irb_purview_text <- paste(c, "ethical_concerns_outside_irb_purview_text", sep = "_")
  
  survey <- survey %>%
    rename(
      !!irb_would_consider_proposal := cols[1],
      !!site := !!paste0(cols[2], "_1"),
      !!factor_data := !!paste0(cols[2], "_2"),
      !!level_analysis := !!paste0(cols[2], "_3"),
      !!pid := !!paste0(cols[2], "_4"),
      !!tos := !!paste0(cols[2], "_5"),
      !!data_reuse := !!paste0(cols[2], "_6"),
      !!combine_dataset := !!paste0(cols[2], "_7"),
      !!method_obtain_data := !!paste0(cols[2], "_8"),
      !!type_of_data := !!paste0(cols[2], "_9"),
      !!informed_consent := !!paste0(cols[2], "_10"),
      !!research_purpose := !!paste0(cols[2], "_11"),
      !!research_impact := !!paste0(cols[2], "_12"),
      !!other := !!paste0(cols[2], "_13"),
      !!other_text := !!paste0(cols[2], "_13_TEXT"),
      !!personally_consider_proposal := !!cols[3],
      !!ethical_concerns_outside_irb_purview := !!cols[4],
      !!ethical_concerns_outside_irb_purview_text := !!cols[5])
  
  return(survey)
  
}

survey <- case_study_rename(survey, "1", c("137", "138", "139", "140", "141"))
survey <- case_study_rename(survey, "2", c("20", "21", "111", "114", "115"))
survey <- case_study_rename(survey, "3", c("40", "41", "42", "124", "125"))
survey <- case_study_rename(survey, "4", c("30", "31", "32", "120", "121"))
survey <- case_study_rename(survey, "5", c("45", "46", "47", "126", "127"))
survey <- case_study_rename(survey, "6", c("50", "51", "52", "128", "129"))
survey <- case_study_rename(survey, "7", c("65", "66", "67", "134", "135"))
survey <- case_study_rename(survey, "8", c("55", "56", "57", "130", "131"))
survey <- case_study_rename(survey, "9", c("25", "26", "112", "116", "117"))
survey <- case_study_rename(survey, "10", c("35", "36", "37", "122", "123"))
survey <- case_study_rename(survey, "11", c("60", "61", "62", "132", "133"))




# Recode factor responses

survey <- survey %>%
  mutate(
    org_type = fct_recode(
      org_type,
      "school" = "A school, college, or university",
      "for-profit" = "A non-school for-profit organization",
      "non-profit" = "A non-school non-profit organization",
      "government" = "A non-school governmental organization",
      "other" = "Other:"
      ),
    irb_ethics_primary_concern = fct_recode(
      irb_ethics_primary_concern,
      "academic research" = "Academic research",
      "corporate research" = "Corporate research",
      "government research" = "Government research",
      "non-profit research" = "Not-for-profit research",
      "other" = "Other:"
      ),
    academic_institution_type = fct_recode(
      academic_institution_type,
      "r1" = "R1",
      "r2" = "R2",
      "r3" = "R3",
      "liberal arts" = "Liberal Arts",
      "community college" = "Community College"
      ),
    academic_research_type = fct_recode(
      academic_research_type,
      "medical" = "Medical",
      "nonmedical" = "Nonmedical (Social/Behavioral/Psychological/Economic)",
      "both" = "Both"
      ),
    annual_pervasive_protocols = fct_recode(
      annual_pervasive_protocols,
      "none" = "0",
      "low" = "1-10",
      "medium" = "20-50",
      "high" = "More than 50",
      "not sure" = "I don\'t know"
      ),
    confidence_researchers_pervasive_data_ethical = fct_recode(
      confidence_researchers_pervasive_data_ethical,
      "strongly disagree" = "Strongly disagree",
      "somewhat disagree" = "Somewhat disagree",
      "neither agree nor disagree" = "Neither agree nor disagree",
      "somewhat agree" = "Somewhat agree",
      "strongly agree" = "Strongly agree"
      ),
    confidence_researchers_pervasive_data_ethical = ordered(
      confidence_researchers_pervasive_data_ethical,
      c("strongly disagree", 
        "somewhat disagree", 
        "neither agree nor disagree",
        "somewhat agree", 
        "strongly agree")
      ),
    confidence_irb_members_pervasive_data_technical = fct_recode(
      confidence_irb_members_pervasive_data_technical,
      "strongly disagree" = "Strongly disagree",
      "somewhat disagree" = "Somewhat disagree",
      "neither agree nor disagree" = "Neither agree nor disagree",
      "somewhat agree" = "Somewhat agree",
      "strongly agree" = "Strongly agree"
      ),
    confidence_irb_members_pervasive_data_technical = ordered(
      confidence_irb_members_pervasive_data_technical,
      c("strongly disagree", 
        "somewhat disagree", 
        "neither agree nor disagree",
        "somewhat agree", 
        "strongly agree")
    ),
    confidence_irb_members_pervasive_data_ethical = fct_recode(
      confidence_irb_members_pervasive_data_ethical,
      "strongly disagree" = "Strongly disagree",
      "somewhat disagree" = "Somewhat disagree",
      "neither agree nor disagree" = "Neither agree nor disagree",
      "somewhat agree" = "Somewhat agree",
      "strongly agree" = "Strongly agree"
      ),
    confidence_irb_members_pervasive_data_ethical = ordered(
      confidence_irb_members_pervasive_data_ethical,
      c("strongly disagree", 
        "somewhat disagree", 
        "neither agree nor disagree",
        "somewhat agree", 
        "strongly agree")
    ),
    irb_has_policy_for_pervasive_data = fct_recode(
      irb_has_policy_for_pervasive_data,
      "yes" = "Yes",
      "no" = "No",
      "under development" = "Under development",
      "not sure" = "I don\'t know"
      ),
    irb_policy_for_pervasive_data_usefulness = fct_recode(
      irb_policy_for_pervasive_data_usefulness,
      "excellent" = "Excellent",
      "adequate" = "Adequate",
      "poor" = "Poor"
      ),
    institution_trains_researchers_pervasive_data_ethics = fct_recode(
      institution_trains_researchers_pervasive_data_ethics,
      "required" = "Yes, it is part of required training",
      "optional" = "Yes, but it is optional",
      "no" = "No",
      "not sure" = "I don\'t know"
      ),
    institution_trains_irb_members_pervasive_data_ethics = fct_recode(
      institution_trains_irb_members_pervasive_data_ethics,
      "required" = "Yes, it is part of required training",
      "optional" = "Yes, but it is optional",
      "no" = "No",
      "not sure" = "I don\'t know"
      ),
    irb_implemented_changes_to_common_rule = fct_recode(
      irb_implemented_changes_to_common_rule,
      "yes" = "Yes",
      "no" = "No",
      "not sure" = "I don\'t know"
      ))



# Recode factor responses from case studies

survey <- survey %>%
  mutate_at(
    vars(matches("irb_would_consider_proposal")), 
    ~fct_recode(.,
      "not human subjects research" = "Not human subjects research",
      "exempt" = "Exempt",
      "expedited" = "Expedited",
      "full review" = "Requiring full board review")) %>%
  mutate_at(
    vars(matches("personally_consider_proposal")), 
    ~fct_recode(., 
      "more" = "More oversight",
      "same" = "Same oversight",
      "left" = "Less oversight")) %>%
  mutate_at(
    vars(matches("ethical_concerns_outside_irb_purview")),
    ~fct_recode(.,
      "no" = "No", 
      "yes" = "Yes"))




# Convert y/n responses to boolean

boolean_columns <- c(
  "role_ethical_review",
  "role_conduct_research",
  "role_administration",
  "role_irb_professional_staff",
  "role_irb_member",
  "role_researcher",
  "role_pi",
  "role_lab_manager",
  "role_grad_student",
  "role_postdoc",
  "role_provost",
  "role_dean_of_research",
  "role_university_institutional_official",
  "reviewed_social_media_posts",
  "reviewed_social_media_images",
  "reviewed_social_media_profiles",
  "reviewed_network_traffic",
  "reviewed_locational_data",
  "reviewed_sensor_data",
  "reviewed_other",
  "most_pervasive_data_in_social_sciences",
  "most_pervasive_data_in_computer_science_engineering",
  "most_pervasive_data_in_natural_sciences",
  "most_pervasive_data_in_arts_humanities",
  "most_pervasive_data_in_medical_health",
  "most_pervasive_data_in_other",
  "irb_guidelines_common_rule",
  "irb_guidelines_belmont_report",
  "irb_guidelines_menlo_report",
  "irb_guidelines_sachrp",
  "irb_guidelines_acm_sigchi",
  "irb_guidelines_aoir",
  "irb_guidelines_apa",
  "irb_guidelines_other",
  "irb_guidelines_none",
  "c1_key_factor_public_or_private_site",
  "c1_key_factor_public_or_private_data",
  "c1_key_factor_level_of_analysis",
  "c1_key_factor_pid",
  "c1_key_factor_tos",
  "c1_key_factor_data_reuse",
  "c1_key_factor_combine_dataset",
  "c1_key_factor_method_obtain_data",
  "c1_key_factor_type_of_data",
  "c1_key_factor_informed_consent",
  "c1_key_factor_research_purpose",
  "c1_key_factor_research_impact",
  "c1_key_factor_other",
  "c2_key_factor_public_or_private_site",
  "c2_key_factor_public_or_private_data",
  "c2_key_factor_level_of_analysis",
  "c2_key_factor_pid",
  "c2_key_factor_tos",
  "c2_key_factor_data_reuse",
  "c2_key_factor_combine_dataset",
  "c2_key_factor_method_obtain_data",
  "c2_key_factor_type_of_data",
  "c2_key_factor_informed_consent",
  "c2_key_factor_research_purpose",
  "c2_key_factor_research_impact",
  "c2_key_factor_other",
  "c3_key_factor_public_or_private_site",
  "c3_key_factor_public_or_private_data",
  "c3_key_factor_level_of_analysis",
  "c3_key_factor_pid",
  "c3_key_factor_tos",
  "c3_key_factor_data_reuse",
  "c3_key_factor_combine_dataset",
  "c3_key_factor_method_obtain_data",
  "c3_key_factor_type_of_data",
  "c3_key_factor_informed_consent",
  "c3_key_factor_research_purpose",
  "c3_key_factor_research_impact",
  "c3_key_factor_other",
  "c4_key_factor_public_or_private_site",
  "c4_key_factor_public_or_private_data",
  "c4_key_factor_level_of_analysis",
  "c4_key_factor_pid",
  "c4_key_factor_tos",
  "c4_key_factor_data_reuse",
  "c4_key_factor_combine_dataset",
  "c4_key_factor_method_obtain_data",
  "c4_key_factor_type_of_data",
  "c4_key_factor_informed_consent",
  "c4_key_factor_research_purpose",
  "c4_key_factor_research_impact",
  "c4_key_factor_other",
  "c5_key_factor_public_or_private_site",
  "c5_key_factor_public_or_private_data",
  "c5_key_factor_level_of_analysis",
  "c5_key_factor_pid",
  "c5_key_factor_tos",
  "c5_key_factor_data_reuse",
  "c5_key_factor_combine_dataset",
  "c5_key_factor_method_obtain_data",
  "c5_key_factor_type_of_data",
  "c5_key_factor_informed_consent",
  "c5_key_factor_research_purpose",
  "c5_key_factor_research_impact",
  "c5_key_factor_other",
  "c6_key_factor_public_or_private_site",
  "c6_key_factor_public_or_private_data",
  "c6_key_factor_level_of_analysis",
  "c6_key_factor_pid",
  "c6_key_factor_tos",
  "c6_key_factor_data_reuse",
  "c6_key_factor_combine_dataset",
  "c6_key_factor_method_obtain_data",
  "c6_key_factor_type_of_data",
  "c6_key_factor_informed_consent",
  "c6_key_factor_research_purpose",
  "c6_key_factor_research_impact",
  "c6_key_factor_other",
  "c7_key_factor_public_or_private_site",
  "c7_key_factor_public_or_private_data",
  "c7_key_factor_level_of_analysis",
  "c7_key_factor_pid",
  "c7_key_factor_tos",
  "c7_key_factor_data_reuse",
  "c7_key_factor_combine_dataset",
  "c7_key_factor_method_obtain_data",
  "c7_key_factor_type_of_data",
  "c7_key_factor_informed_consent",
  "c7_key_factor_research_purpose",
  "c7_key_factor_research_impact",
  "c7_key_factor_other",
  "c8_key_factor_public_or_private_site",
  "c8_key_factor_public_or_private_data",
  "c8_key_factor_level_of_analysis",
  "c8_key_factor_pid",
  "c8_key_factor_tos",
  "c8_key_factor_data_reuse",
  "c8_key_factor_combine_dataset",
  "c8_key_factor_method_obtain_data",
  "c8_key_factor_type_of_data",
  "c8_key_factor_informed_consent",
  "c8_key_factor_research_purpose",
  "c8_key_factor_research_impact",
  "c8_key_factor_other",
  "c9_key_factor_public_or_private_site",
  "c9_key_factor_public_or_private_data",
  "c9_key_factor_level_of_analysis",
  "c9_key_factor_pid",
  "c9_key_factor_tos",
  "c9_key_factor_data_reuse",
  "c9_key_factor_combine_dataset",
  "c9_key_factor_method_obtain_data",
  "c9_key_factor_type_of_data",
  "c9_key_factor_informed_consent",
  "c9_key_factor_research_purpose",
  "c9_key_factor_research_impact",
  "c9_key_factor_other",
  "c10_key_factor_public_or_private_site",
  "c10_key_factor_public_or_private_data",
  "c10_key_factor_level_of_analysis",
  "c10_key_factor_pid",
  "c10_key_factor_tos",
  "c10_key_factor_data_reuse",
  "c10_key_factor_combine_dataset",
  "c10_key_factor_method_obtain_data",
  "c10_key_factor_type_of_data",
  "c10_key_factor_informed_consent",
  "c10_key_factor_research_purpose",
  "c10_key_factor_research_impact",
  "c10_key_factor_other",
  "c11_key_factor_public_or_private_site",
  "c11_key_factor_public_or_private_data",
  "c11_key_factor_level_of_analysis",
  "c11_key_factor_pid",
  "c11_key_factor_tos",
  "c11_key_factor_data_reuse",
  "c11_key_factor_combine_dataset",
  "c11_key_factor_method_obtain_data",
  "c11_key_factor_type_of_data",
  "c11_key_factor_informed_consent",
  "c11_key_factor_research_purpose",
  "c11_key_factor_research_impact",
  "c11_key_factor_other"
)   

survey <- survey %>%
  mutate_at(boolean_columns, ~ifelse(str_detect(., "0"), 
                                     FALSE, 
                                     ifelse(is.na(.), 
                                            NA, 
                                            TRUE)))

survey <- survey %>%
  mutate_at(vars(matches("percent")), ~as.numeric(.))


# Filter rows for valid respondents 
survey <- survey %>%
  semi_join(tibble("id" = read_lines("data/valid_responses.txt")))   


write_rds(survey, 'data/survey_data.rds')




