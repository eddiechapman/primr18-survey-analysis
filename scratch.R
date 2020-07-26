

# CASE STUDIES
#
# "c1_irb_would_consider_proposal" = "137"
# "not human subjects research" = "Not human subjects research"
# "exempt" = "Exempt"
# "expedited" = "Expedited"
# "full review" = "Requiring full board review"
#
# "c1_key_factor_site" = "138_1"
# "c1_key_factor_data" = "138_2"
# "c1_key_factor_level_analysis" = "138_3"
# "c1_key_factor_pid" = "138_4"
# "c1_key_factor_tos" = "138_5"
# "c1_key_factor_data_reuse" = "138_6"
# "c1_key_factor_combine_dataset" = "138_7"
# "c1_key_factor_method_obtain_data" = "138_8"
# "c1_key_factor_type_of_data" = "138_9"
# "c1_key_factor_informed_consent" = "138_10"
# "c1_key_factor_research_purpose" = "138_11"
# "c1_key_factor_research_impact" = "138_12"
# "c1_key_factor_other" = "138_13"
#
# "c1_key_factor_other_text" = "138_13_TEXT"
# text field
#
# "c1_personally_consider_proposal" = "139"
# "more" = "More oversight"
# "same" = "Same oversight"
# "left" = "Less oversight"
#
# "c1_ethical_concerns_outside_irb_purview" = "140"
# "no" = "No"
# "yes" = "Yes"

# (Display if "c1_ethical_concerns_outside_irb_purview" == 'yes')
# "c1_ethical_concerns_outside_irb_purview_text" = "141"
# text field






# 
# # Recode factor responses
# survey <- survey %>%
#   rename("institution" = "6") %>%
#   mutate(institution = fct_recode(
#     institution, 
#     "school" = "A school, college, or university",
#     "for-profit" = "A non-school for-profit organization",
#     "non-profit" = "A non-school non-profit organization",
#     "government" = "A non-school governmental organization",
#     "other" = "Other:"))
# 
# survey <- survey %>%
#   rename("n_protocols" = "70") %>%
#   mutate(n_protocols = fct_recode(
#     n_protocols,
#     "none" = "0", 
#     "low" = "1-10", 
#     "medium" = "20-50", 
#     "high" = "More than 50"))
# 
# survey <- survey %>%
#   rename("academic_institution" = "8") %>%
#   mutate(academic_institution = fct_recode(
#     academic_institution, 
#     "r1" = "R1",
#     "r2" = "R2",
#     "r3" = "R3",
#     "liberal arts" = "Liberal Arts",
#     "community college" = "Community College"))  
# 
# survey <- survey %>%
#   rename("consider_ethics" = "74_1", 
#          "confidence_technical" = "74_2", 
#          "confidence_ethical" = "74_3") %>%
#   mutate_at(c("consider_ethics", 
#               "confidence_technical", 
#               "confidence_ethical"), 
#             ~factor(.))
# 
# # Boolean responses
# survey <- survey %>%
#   rename("social_media_posts" = "72_1", 
#          "social_media_images" = "72_2", 
#          "social_media_profiles" = "72_3",
#          "network_traffic" = "72_4", 
#          "locational_data" = "72_5", 
#          "sensor_data" = "72_6", 
#          "role_review" = "9_4", 
#          "role_research" = "9_5", 
#          "role_admin" = "9_6", 
#          "irb_staff" = "10_1",
#          "irb_member" = "10_2", 
#          "researcher" = "11_1", 
#          "pi" = "11_2", 
#          "lab_manager" = "11_4",
#          "grad_student" = "11_5", 
#          "postdoc" = "11_6", 
#          "provost" = "12_1", 
#          "dean" = "12_2",
#          "institutional_official" = "12_4") %>%
#   mutate_at(c("social_media_posts", 
#               "social_media_images", 
#               "social_media_profiles", 
#               "network_traffic",
#               "locational_data", 
#               "sensor_data", 
#               "role_review", 
#               "role_research", 
#               "role_admin", 
#               "irb_staff", 
#               "irb_member", 
#               "researcher", 
#               "pi", 
#               "lab_manager", 
#               "grad_student", 
#               "postdoc", 
#               "provost", 
#               "dean", 
#               "institutional_official"), 
#             ~ifelse(is.na(.), FALSE, TRUE))
# 
#  
# 
# # "id" = "ResponseId"
# #
# # "consent" = "3"
# #
# # "org_type" = "6"
#     "school" = "A school, college, or university"
#     "for-profit" = "A non-school for-profit organization"
#     "non-profit" = "A non-school non-profit organization"
#     "government" = "A non-school governmental organization"
#     "other" = "Other:"
# #
# # "org_type_text" = "6_5_TEXT"
#     # text field
# #
# # "irb_ethics_primary_concern" = "7"
#     # "academic research" = "Academic research"
#     # "corporate research" = "Corporate research"
#     # "government research" = "Government research"
#     # "non-profit research" = "Not-for-profit research"
#     # "other" = "Other:"
# #
# # "irb_ethics_primary_concern_text" = "7_5_TEXT"
#     # text field
# #
# # (display if irb_ethics_primary_concern == 'academic research')
# # (don't think there are any 'community college' responses)
# # "academic_institution_type" = "8"
#     # "r1" = "R1"
#     # "r2" = "R2"
#     # "r3" = "R3"
#     # "liberal arts" = "Liberal Arts"
#     # "community college" = "Community College"
# #
# # "role_ethical_review" = "9_4"
# # "role_conduct_research" = "9_5"
# # "role_administration" = "9_6"
# #
# # (display if role_ethical_review == TRUE)
# "role_irb_professional_staff" = "10_1"
# "role_irb_member" = "10_2"
# #
# # (display if role_conducting_research == TRUE)
# "role_researcher" = "11_1"
# "role_pi" = "11_2"
# "role_lab_manager" = "11_4"
# "role_grad_student" = "11_5"
# "role_postdoc" = "11_6"
# #
# # (display if role_administration == TRUE)
# "role_provost" = "12_1"
# "role_dean_of_research" = "12_2"
# "role_university_institutional_official" = "12_4"
# #
# # (display if irb_ethics_primary_concern == 'academic research')
# "academic_research_type" = "13"
#     # "medical" = "Medical"
#     # "nonmedical" = "Nonmedical (Social/Behavioral/Psychological/Economic)"
#     # "both" = "Both"
# #
# #
# "annual_pervasive_protocols" = "70"
#     # "none" = "0"
#     # "low" = "1-10"
#     # "medium" = "20-50"
#     # "high" = "More than 50"
#     # "not sure" = "I don\'t know"
# #
# # (Integer values)
# "percent_pervasive_not_human_subject" = "71_1"
# "percent_pervasive_exempt" = "71_2"
# "percent_pervasive_expedited" = "71_3"
# "percent_pervasive_full_board" = "71_4"
# "percent_pervasive_not_sure" = "71_6"
# #
# #
# "reviewed_social_media_posts" = "72_1"
# "reviewed_social_media_images" = "72_2"
# "reviewed_social_media_profiles" = "72_3"
# "reviewed_network_traffic" = "72_4"
# "reviewed_locational_data" = "72_5"
# "reviewed_sensor_data" = "72_6"
# "reviewed_other" = "72_7"
# #
# "reviewed_other_text" = "72_7_TEXT"
#     # text field
# #
# #
# "most_pervasive_data_in_social_sciences" = "73_1"
# "most_pervasive_data_in_computer_science_engineering" = "73_2"
# "most_pervasive_data_in_natural_sciences" = "73_3"
# "most_pervasive_data_in_arts_humanities" = "73_4"
# "most_pervasive_data_in_medical_health" = "73_5"
# "most_pervasive_data_in_other" = "73_6"
# #
# "most_pervasive_data_in_other_text" = "73_6_TEXT"
#     # text field
# #
# #
# #
# "confidence_researchers_pervasive_data_ethical" = "74_1"
#     # "strongly disagree" = "Strongly disagree"
#     # "somewhat disagree" = "Somewhat disagree"
#     # "neither agree nor disagree" = "Neither agree nor disagree"
#     # "somewhat agree" = "Somewhat agree"
#     # "strongly agree" = "Strongly agree"
# #
# "confidence_irb_members_pervasive_data_technical" = "74_2"
#     # "strongly disagree" = "Strongly disagree"
#     # "somewhat disagree" = "Somewhat disagree"
#     # "neither agree nor disagree" = "Neither agree nor disagree"
#     # "somewhat agree" = "Somewhat agree"
#     # "strongly agree" = "Strongly agree"
# #
# "confidence_irb_members_pervasive_data_ethical" = "74_3"
#     # "strongly disagree" = "Strongly disagree"
#     # "somewhat disagree" = "Somewhat disagree"
#     # "neither agree nor disagree" = "Neither agree nor disagree"
#     # "somewhat agree" = "Somewhat agree"
#     # "strongly agree" = "Strongly agree"
# #
# "irb_has_policy_for_pervasive_data" = "75"
#     # "yes" = "Yes"
#     # "no" = "No"
#     # "under development" = "Under development"
#     # "not sure" = "I don\'t know"
# #
# # (Display if irb_has_policy_for_pervasive_data == 'yes')
# "irb_policy_for_pervasive_data_usefulness" = "77"
#     # "excellent" = "Excellent"
#     # "adequate" = "Adequate"
#     # "poor" = "Poor"
# #
# #
# "irb_guidelines_common_rule" = "78_1"
# "irb_guidelines_belmont_report" = "78_2"
# "irb_guidelines_menlo_report" = "78_3"
# "irb_guidelines_sachrp" = "78_4"
# "irb_guidelines_acm_sigchi" = "78_5"
# "irb_guidelines_aoir" = "78_6"
# "irb_guidelines_apa" = "78_7"
# "irb_guidelines_other" = "78_8"
# "irb_guidelines_none" = "78_9"
# #
# "irb_guidelines_other_text" = "78_8_TEXT"
#     # text field
# #
# #
# "institution_trains_researchers_pervasive_data_ethics" = "79"
#     # "required" = "Yes, it is part of required training"
#     # "optional" = "Yes, but it is optional"
#     # "no" = "No"
#     # "not sure" = "I don\'t know"
# #
# #
# "institution_trains_irb_members_pervasive_data_ethics" = "80"
#     # "required" = "Yes, it is part of required training"
#     # "optional" = "Yes, but it is optional"
#     # "no" = "No"
#     # "not sure" = "I don\'t know"
# #
# "irb_implemented_changes_to_common_rule" = "93"
#     # "yes" = "Yes"
#     # "no" = "No"
#     # "not sure" = "I don\'t know"
# #
# #
# 
# #
# # c1 137, 138, 139, 140, 141
# # c2 20, 21, 111, 114, 115
# # c3 40, 41, 42, 124, 125
# # c4 30, 31, 32, 120, 121,
# # c5 45, 46, 47, 126, 127
# # c6 50, 51, 52, 128, 129
# # c7 65, 66, 67, 134, 135
# # c8 55, 56, 57, 130, 131
# # c9 25, 26, 112, 116, 117
# # c10 35, 36, 37, 122, 123
# # c11 60, 61, 62, 132, 133
# 
# 
# 
# 
# # "not human subjects research" = "Not human subjects research"
# # "exempt" = "Exempt"
# # "expedited" = "Expedited"
# # "full review" = "Requiring full board review"
# # 
# # "public vs. private site" = "Public vs. private site"
# # "public vs. private data" = "Public vs. private data"
# # "level of analysis (group vs. individual)" = "Level of analysis (group vs. individual)"
# # "identifiable data" = "Whether data is identifiable"
# # "terms of service" = "Whether data gathering violates terms of service"
# # "data reuse" = "Whether data is reused"
# # "combines datasets" = "Whether the project combines datasets"
# # "method of obtaining data" = "Method of obtaining data"
# # "type of data" = "Type of data"
# # "informed consent" = "Whether informed consent was obtained"
# # "research purpose" = "Purpose of the research"
# # "impact beyond participants" = "Impact beyond the participants"
# # "other" = "Other [please explain]:"
# # 
# # "more" = "More oversight"
# # "same" = "Same oversight"
# # "left" = "Less oversight"
# 
# 
# # Reduce response rows to valid responses
# survey <- semi_join(survey, as_tibble(read_lines("data/valid_responses.txt")), 
#                     by = c("response_id" = "value"))
# 
# 
# #   
# # 
# # 
# # 
# # 
# # pal <- brewer.pal(5, "RdBu") 
# # pal[3] <- "#DFDFDF"
# # 
# # likert_scale <- c("Strongly disagree", 
# #                   "Somewhat disagree", 
# #                   "Neither agree nor disagree", 
# #                   "Somewhat agree",
# #                   "Strongly agree")
# # 
# # palette <- tibble(response = factor(likert_scale), 
# #                   color = factor(pal))
# # 
# # q74 <- survey %>%
# #   select("technical" = "74_2", "ethical" = "74_3") %>%
# #   pivot_longer(cols = technical:ethical, names_to = "consideration", values_to = "response") %>%
# #   mutate(consideration = as.factor(consideration),
# #          response = factor(response, likert_scale)) %>%
# #   filter(!is.na(response)) %>%
# #   add_count(consideration) %>%
# #   add_count(consideration, response, name = "n_response") %>%
# #   mutate(percent = n_response / n) %>%
# #   select(consideration, response, percent) %>%
# #   distinct() %>%
# #   left_join(palette) %>%
# #   arrange(consideration, response)
# # 
# # q74
# # 
# # lows <- q74 %>%
# #   filter(response %in% likert_scale[1:3]) %>%
# #   mutate(percent = ifelse(str_detect(response, likert_scale[3]), percent / 2, percent),
# #          percent = as.integer(percent * 100),
# #          response = factor(response, rev(likert_scale[1:3])),
# #          color = factor(color, levels = c("#CA0020", "#F4A582", "#DFDFDF"))) 
# # 
# # lows
# # 
# # highs <- q74 %>%
# #   filter(response %in% likert_scale[3:5]) %>%
# #   mutate(percent = ifelse(str_detect(response, likert_scale[3]), percent / 2, percent),
# #          percent = as.integer(percent * 100),
# #          response = factor(response, likert_scale[3:5]))
# # 
# # highs
# # 
# # title <- "Prepared for pervasive data protocols?"
# # subtitle <- "I believe that IRB members at my institution are well-versed in the \n (technical, ethical) aspects of the collection/use of prevasive data"
# # 
# # ggplot() + 
# #   geom_bar(data = highs, aes(x = consideration, y = percent, fill = color), position = "stack", stat = "identity", width = 0.5) +
# #   geom_bar(data = lows, aes(x = consideration, y = -percent, fill = color), position = "stack", stat = "identity", width = 0.5) +
# #   geom_hline(yintercept = 0, color = c("white")) +
# #   scale_fill_identity("", labels = labels, breaks = palette, guide = "legend") + 
# #   theme_fivethirtyeight() +
# #   coord_flip() +
# #   labs(title = title, subtitle = subtitle, y = "", x = "") +
# #   theme(plot.title = element_text(size = 14, hjust = 2),
# #         plot.subtitle = element_text(size = 12, face = "italic", hjust = 0),
# #         axis.text.y = element_text(size = 11, face = "bold", hjust = 0),
# #         legend.position = "right", 
# #         legend.direction = "vertical",
# #         legend.key.size = unit(.5, "cm"),
# #         legend.text = element_text(size = 11)) +
# #   scale_y_continuous(breaks = seq(-100 , 100, 25), limits = c(-75, 75))
# # 
# # status_levels <- c("Not human subjects research",
# #                    "Exempt",
# #                    "Expedited",
# #                    "Requiring full board review")
# # 
# # factor_levels <- c("Public vs. private site",
# #                    "Public vs. private data",
# #                    "Level of analysis (group vs. individual)",
# #                    "Whether data is identifiable",
# #                    "Whether data gathering violates terms of service",
# #                    "Whether data is reused",
# #                    "Whether the project combines datasets",
# #                    "Method of obtaining data",
# #                    "Type of data",
# #                    "Whether informed consent was obtained",
# #                    "Purpose of the research",
# #                    "Impact beyond the participants",
# #                    "Other [please explain]:")
# # 
# # oversight_levels <- c("More oversight",
# #                       "Same oversight",
# #                       "Less oversight")
# # 
# # case1 <- survey %>%
# #   select(institution, "status" = "Q137", "Q138_1":"Q138_13", "oversight" = "Q139") %>%
# #   pivot_longer(starts_with("Q138"), values_to = "factor") %>%
# #   mutate(status = na_if(status, "-99"),
# #          status = na_if(status, "0"),
# #          factor = na_if(factor, "-99"),
# #          factor = na_if(factor, "0"),
# #          oversight = na_if(oversight, "-99"),
# #          oversight = na_if(oversight, "0")) %>%
# #   select(institution, status, factor, oversight) %>%
# #   filter(!is.na(status), !is.na(factor), !is.na(oversight)) %>%
# #   mutate(status = factor(status, status_levels),
# #          factor = factor(factor, factor_levels),
# #          oversight = factor(oversight, oversight_levels))
# # 
# # case1
# # 
# # case1 %>%
# #   select(status, factor) %>%
# #   filter(factor != "Other [please explain]:") %>%
# #   group_by(status) %>%
# #   add_count(factor) %>%
# #   add_count(status, name = "n_status") %>%
# #   mutate(percent = (n / n_status) * 100) %>%
# #   distinct() %>%
# #   arrange(status, factor) %>%
# #   ggplot(aes(factor, percent, fill = status)) +
# #   # geom_segment(aes(x = factor, xend = factor, y = 0, yend = percent), position = "dodge2") +
# #   # geom_point(size = 1, alpha = 0.6, position = "dodge2") +
# #   geom_col(width = 0.5, position = position_dodge()) +
# #   #facet_wrap(~status, ncol = 4) +
# #   coord_flip()