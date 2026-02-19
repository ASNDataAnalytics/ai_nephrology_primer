author_string = "Mohammad S Sheikh  1 , Benjamin Dreesman  2 , Erin F Barreto  2 , Charat Thongprayoon  1 , Jing Miao  1 , Supawadee Suppadungsuk  1   3 , Michael A Mao  4 , Fawad Qureshi  1 , Justin H Pham  1 , Iasmina M Craici  1 , Kianoush B Kashani  1   5 , Wisit Cheungpasitporn  1"


format_authors <- function(author_string) {
  
  # Split authors by comma
  authors <- gsub(pattern = "[0-9]&∗∙", replacement = "", author_string)
  authors <- strsplit(authors, ",")[[1]]
  authors <- trimws(authors)
  
  formatted <- sapply(authors, function(author) {
    
    # Split into parts by space
    parts <- unlist(strsplit(author, "\\s+"))
    
    # Last name is last element
    last_name <- parts[length(parts)]
    
    # First name initial
    first_initial <- substr(parts[1], 1, 1)
    
    # Middle initial (remove period if present)
    middle_initial <- if (length(parts) > 2) {
      gsub("\\.", "", parts[2])
    } else {
      ""
    }
    
    paste0(last_name, " ", first_initial, middle_initial)
  })
  
  paste(formatted, collapse = ", ")
}


authors <- "Abe C. First, Barney R. Second, Robert C. Third"

format_authors(authors)

format_authors_2 <- function(author_string) {
  
  sapply(author_string, function(x) {
    
    authors <- strsplit(x, ",")[[1]]
    authors <- trimws(authors)
    
    formatted <- sapply(authors, function(author) {
      
      parts <- unlist(strsplit(author, "\\s+"))
      last_name <- parts[length(parts)]
      first_initial <- substr(parts[1], 1, 1)
      middle_initial <- if (length(parts) > 2) {
        gsub("\\.", "", parts[2])
      } else {
        ""
      }
      
      paste0(last_name, " ", first_initial, middle_initial)
    })
    
    paste(formatted, collapse = ", ")
  })
}


format_authors(authors)

a1 <- c(
  "Lin-Chun Wang, Hanjie Zhang, Nancy Ginsberg, Andrea Nandorine Ban, Jeroen P. Kooman, Peter Kotanko"
)

format_authors(a1)

  Title = "Artificial Intelligence and Machine Learning in Dialysis Ready for Prime Time?"
  URL = "https://journals.lww.com/cjasn/fulltext/2023/06000/artificial_intelligence_and_machine_learning_in.17.aspx"
  authors = "Kotanko P, Zhang H, Wang Y" 
  journal = "Clinical Journal of the American Society of Nephrology"
  year = "2023"
  DOI = "10.2215/CJN.0000000000000089"

assemble_reference <- function(
  Title,
  URL,
  authors, 
  journal, 
  year, 
  DOI
  ) {
  
  authors_clean <- 
    format_authors(authors)

  stringr::str_glue(
    "::: reference-highlight
    ### [{Title}]({URL}){{target='_blank'}}

    **{authors_clean}**
    <br>
    *{journal},* {year}.
    <br>
    [DOI:]{{.doi-label}} [{DOI}](https://doi.org/{DOI}){{target='_blank'}}
    :::"
  ) |> 
    clipr::write_clip()
}

# ::: reference-highlight
# ### [Title](URL){target="_blank"}

# **First A, Second B, Third C.** 
# <br> 
# *Journal,* 202X. 
# <br> 
# [DOI:]{.doi-label} [DOI](https://doi.org/DOI){target="_blank"}
# :::



# a2 <- "Kotanko P, Zhang H, Wang Y"
# Author Information
# Clinical Journal of the American Society of Nephrology 18(6):p 803-805, June 2023. | DOI: 10.2215/CJN.0000000000000089

assemble_reference(
  Title = "",
  URL = "",
  authors = "",
  journal = "",
  year = "",
  DOI = ""
)
assemble_reference(
  Title = "",
  URL = "",
  authors = "",
  journal = "",
  year = "",
  DOI = ""
)
assemble_reference(
  Title = "",
  URL = "",
  authors = "",
  journal = "",
  year = "",
  DOI = ""
)
assemble_reference(
  Title = "Responsible Use of Artificial Intelligence to Improve Kidney Care
A Statement from the American Society of Nephrology",
  URL = "https://journals.lww.com/jasn/fulltext/9900/responsible_use_of_artificial_intelligence_to.826.aspx",
  authors = "Tangri, Navdeep1; Cheungpasitporn, Wisit2; Crittenden, Stanley D.3; Fornoni, Alessia4; Peralta, Carmen A.5; Singh, Karandeep6; Usvyat, Len A.7; Waterman, Amy D",
  journal = "Journal of the American Society of Nephrology",
  year = "2025",
  DOI = "10.1681/ASN.0000000929"
)
assemble_reference(
  Title = "From bytes to bites: application of large language models to enhance nutritional recommendations",
  URL = "https://academic.oup.com/ckj/article-lookup/doi/10.1093/ckj/sfaf082",
  authors = "
Karin Bergling  1 , Lin-Chun Wang  2 , Oshini Shivakumar  3 , Andrea Nandorine Ban  1 , Linda W Moore  4 , Nancy Ginsberg  5 , Jeroen Kooman  6 , Neill Duncan  3 , Peter Kotanko  1   7 , Hanjie Zhang  1
",
  journal = "Clinical Kidney Journal",
  year = "2025",
  DOI = "10.1093/ckj/sfaf082"
)

assemble_reference(
  Title = "Home Dialysis Prediction Using Artificial Intelligence",
  URL = "https://doi.org/10.1016/j.xkme.2024.100949",
  authors = "Caitlin K. Monaghan PhD 1, Joanna Willetts MS 1, Hao Han MS 1, Sheetal Chaudhuri PhD 1, Linda H. Ficociello DSc 1, Michael A. Kraus MD 1, Harold E. Giles MD 2 3, Len Usvyat PhD 1, Joseph Turk MBA ",
  journal = "Kidney Medicine",
  year = "2025",
  DOI = "10.1016/j.xkme.2024.100949"
)

"https://pubmed.ncbi.nlm.nih.gov/41459576/"
"https://doi.org/10.1093/ckj/sfaf323"
"https://jamanetwork.com/journals/jamainternalmedicine/fullarticle/2840192"
"https://bmcnephrol.biomedcentral.com/articles/10.1186/s12882-025-04206-z"
"https://journals.lww.com/kidney360/fulltext/2025/05000/natural_language_processing_identifies.15.aspx#:~:text=Natural%20Language%20Processing%20Identifies%20Underdocumentation,Symptoms%20in%20Patients%20on%20Hemodialysis"
"https://bmcnephrol.biomedcentral.com/articles/10.1186/s12882-024-03907-1"
"DOI: 10.1186/s12882-025-04133-z"
"https://doi.org/10.62716/kn.000542025"
"https://ai.nejm.org/doi/full/10.1056/AIoa2300099"
"DOI: 10.1136/bmjopen-2024-093920"
"DOI 10.1016/j.ekir.2025.01.012"
"DOI 10.1016/j.ekir.2023.10.029"
"https://www.nature.com/articles/s41581-025-00961-2"
"https://www.nature.com/articles/s41591-025-03669-9"

assemble_reference(
  Title = "The dawn of multimodal artificial intelligence in nephrology",
  URL = "https://www.nature.com/articles/s41581-023-00799-6",
  authors = "Benjamin Shickel & Azra Bihorac",
  journal = "Nature Reviews Nephrology",
  year = "2024",
  DOI = "10.1038/s41581-023-00799-6"
)


assemble_reference(
  Title = "Non-invasive biopsy diagnosis of diabetic kidney disease via deep learning applied to retinal images: a population-based study
",
  URL = "https://www.thelancet.com/journals/landig/article/PIIS2589-7500(25)00040-8/fulltext",
  authors = "Ziyao Meng, MEnga,b,∗ ∙ Zhouyu Guan, MDa,∗ ∙ Shujie Yu, MBBSa,∗ ∙ Yilan Wu, BScc,∗ ∙ Yaoning Zhao, BScc,∗ ∙ Jie Shen, PhDd,∗ ∙ et al. ",
  journal = "The Lancet Digital Health",
  year = "2025",
  DOI = "10.1016/j.landig.2025.02.008"
)

assemble_reference(
  Title = "Imaging and spatially resolved mass spectrometry applications in nephrology",
  URL = "https://doi.org/10.1038/s41581-025-00946-1",
  authors = "

    Brittney L. Gorman, Catelynn C. Shafer, Nagarjunachary Ragi, Kumar Sharma, Elizabeth K. Neumann & Christopher R. Anderton ",
  journal = "Nature Reviews Nephrology",
  year = "2025",
  DOI = "10.1038/s41581-025-00946-1"
)





assemble_reference(
  Title = "Multicenter Development and Validation of a Multimodal Deep Learning Model to Predict Moderate to Severe AKI",
  URL = "https://journals.lww.com/cjasn/abstract/2025/06000/multicenter_development_and_validation_of_a.5.aspx",
  authors = "Koyner, Jay L.1; Martin, Jennie2; Carey, Kyle A.1; Caskey, John2; Edelson, Dana P.1; Mayampurath, Anoop2,3; Dligach, Dmitriy4; Afshar, Majid2,3; Churpek, Matthew M.2,3",
  journal = "Clinical Journal of the American Society of Nephrology",
  year = "2025",
  DOI = "10.2215/CJN.0000000695"
)


assemble_reference(
  Title = "Artificial Intelligence in Nephrology: Clinical Applications and Challenges",
  URL = "https://doi.org/10.1016/j.xkme.2024.100927",
  authors = "Prabhat Singh1,  Lokesh Goyal2, Deobrat C. Mallick2, Salim R. Surani3, Nayanjyoti Kaushik4, Deepak Chandramohan5, Prathap K. Simhadri6",
  journal = "Kidney Medicine",
  year = "2025",
  DOI = "10.1016/j.xkme.2024.100927"
)

assemble_reference(
  Title = "Systematic Review and Meta-Analysis of Machine Learning Models for Acute Kidney Injury Risk Classification",
  URL = "https://journals.lww.com/jasn/abstract/2025/10000/systematic_review_and_meta_analysis_of_machine.10.aspx",
  authors = "Cama-Olivares, Augusto1; Braun, Chloe2; Takeuchi, Tomonori1,3; O'Hagan, Emma C.4; Kaiser, Kathryn A.5; Ghazi, Lama6; Chen, Jin1; Forni, Lui G.7; Kane-Gill, Sandra L.8; Ostermann, Marlies9; Shickel, Benjamin10; Ninan, Jacob11; Neyra, Javier A.1
",
  journal = "Journal of the American Society of Nephrology",
  year = "2025",
  DOI = "10.1681/ASN.0000000702"
)




assemble_reference(
  Title = "AI Scribes Are Not Productivity Tools (Yet)",
  URL = "https://ai.nejm.org/doi/pdf/10.1056/AIe2501051",
  authors = "Authors: Eileen Kim, Vincent X. Liu, and Karandeep Singh",
  journal = "NEJM",
  year = "2025",
  DOI = "10.1056/AIe2501051"
)

assemble_reference(
  Title = "Generalizability of an acute kidney injury prediction model across health systems",
  URL = "https://www.nature.com/articles/s42256-022-00563-8",
  authors = "Jie Cao, Xiaosong Zhang, Vahakn Shahinian, Huiying Yin, Diane Steffick, Rajiv Saran, Susan Crowley, Michael Mathis, Girish N. Nadkarni, Michael Heung & Karandeep Singh",
  journal = "Nature Machine Intelligence",
  year = "2022",
  DOI = "10.1038/s42256-022-00563-8"
)




format_authors("Jing Miao, Charat Thongprayoon, Wisit Cheungpasitporn, Lynn D Cornell")


assemble_reference(
  Title = "Performance of GPT-4 Vision on kidney pathology exam questions",
  URL = "https://academic.oup.com/ajcp/article-lookup/doi/10.1093/ajcp/aqae030",
  authors = "Miao J, Thongprayoon C, Cheungpasitporn W, Cornell LD",
  journal = "Am J Clin Pathol",
  year = "2024",
  DOI = "10.1093/ajcp/aqae030"
)






"Mohammad S Sheikh  1 , Benjamin Dreesman  2 , Erin F Barreto  2 , Charat Thongprayoon  1 , Jing Miao  1 , Supawadee Suppadungsuk  1   3 , Michael A Mao  4 , Fawad Qureshi  1 , Justin H Pham  1 , Iasmina M Craici  1 , Kianoush B Kashani  1   5 , Wisit Cheungpasitporn  1"

format_authors("Mohammad S Sheikh  1 , Benjamin Dreesman  2 , Erin F Barreto  2 , Charat Thongprayoon  1 , Jing Miao  1 , Supawadee Suppadungsuk  1   3 , Michael A Mao  4 , Fawad Qureshi  1 , Justin H Pham  1 , Iasmina M Craici  1 , Kianoush B Kashani  1   5 , Wisit Cheungpasitporn  1")

assemble_reference(
  Title = "Identification of kidney-related medications using AI from self-captured pill images",
  URL = "https://www.tandfonline.com/doi/10.1080/0886022X.2024.2402075?url_ver=Z39.88-2003&rfr_id=ori:rid:crossref.org&rfr_dat=cr_pub%20%200pubmed",
  # authors = "Sheikh MS, Dreesman B, Barreto EF, Thongprayoon C, Miao J, Suppadungsuk S, Mao MA, Qureshi F, Pham JH, Craici IM, Kashani KB, Cheungpasitporn W",
  authors = "Mohammad S Sheikh  1 , Benjamin Dreesman  2 , Erin F Barreto  2 , Charat Thongprayoon  1 , Jing Miao  1 , Supawadee Suppadungsuk  1   3 , Michael A Mao  4 , Fawad Qureshi  1 , Justin H Pham  1 , Iasmina M Craici  1 , Kianoush B Kashani  1   5 , Wisit Cheungpasitporn  1",
  journal = "Ren Fail",
  year = "2024",
  DOI = "10.1080/0886022X.2024.2402075"
)







assemble_reference(
  Title = "Clinical Applications of Artificial Intelligence in Autosomal Dominant Polycystic Kidney Disease",
  URL = "https://academic.oup.com/ndt/article-lookup/doi/10.1093/ndt/gfag010",
  authors = "Niloufar Ebrahimi  1 , Wisit Cheungpasitporn  2 , Fouad T Chebib  3 , Abdul Hamid Borghol  3 , Zohreh Gholizadeh Ghozloujeh  1 , Sayna Norouzi  1 , Amir Abdipour  1",
  journal = "Nephrol Dial Transplant",
  year = "2026",
  DOI = "10.1093/ndt/gfag010"
)


# ::: reference-highlight
# ### [Title](URL){target="_blank"}

# **First A, Second B, Third C.** 
# <br> 
# *Journal,* 202X. 
# <br> 
# [DOI:]{.doi-label} [DOI](https://doi.org/DOI){target="_blank"}
# :::

assemble_reference(
  Title = "Evaluation of performance measures in predictive artificial  intelligence models to support medical decisions: overview  and guidance",
  URL = "https://www.thelancet.com/journals/landig/article/PIIS2589-7500(25)00098-6/fulltext",
  authors = "  Ben Van Calster, Gary S Collins, Andrew J Vickers, Laure Wynants, Kathleen F Kerr, Lasai Barreñada, Gael Varoquaux, Karandeep Singh, Karel GM Moons, Tina Hernandez-Boussard, Dirk Timmerman, David J McLernon, Maarten van Smeden, Ewout W Steyerberg, on behalf of Topic Group 6 of the STRATOS initiative",
  journal = "Lancet Digit Health",
  year = "2025",
  DOI = "/10.1016/j.landig.2025.100916"
)



assemble_reference(
  Title = "Prospective comparison of econometric, machine learning, and foundation models for forecasting emergency department boarding patients",
  URL = "https://doi.org/10.1038/s44401-025-00054-z",
  authors = "Lily Poursoltan1,2, Jie Cao2, Brian Clay3,4,5, Beth Trimble3, Leah Adrid3, Jeffrey Pan2, Andrew Chua2, John Bell5, Christopher A. Longhurst2,4, Kevin Zhu1,6 & Karandeep Singh2,4,6",
  journal = "npj Health Systems",
  year = "2025",
  DOI = "10.1038/s44401-025-00054-z"
)

assemble_reference(
  Title = "Evaluation of electronic health record-integrated artificial intelligence chart review",
  URL = "https://www.nature.com/articles/s44401-025-00064-x",
  authors = "    Nicolas M. Kahl, Marshall J. Frieden, Zach R. Pope, Marlene M. Millen, Vaishal M. Tolia, Theodore C. Chan, Christopher A. Longhurst, Karandeep Singh & Alan X. You ",
  journal = "npj Health Systems",
  year = "2026",
  DOI = "10.1038/s44401-025-00064-x"
)
