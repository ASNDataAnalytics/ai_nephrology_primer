author_string = "Mohammad S Sheikh  1 , Benjamin Dreesman  2 , Erin F Barreto  2 , Charat Thongprayoon  1 , Jing Miao  1 , Supawadee Suppadungsuk  1   3 , Michael A Mao  4 , Fawad Qureshi  1 , Justin H Pham  1 , Iasmina M Craici  1 , Kianoush B Kashani  1   5 , Wisit Cheungpasitporn  1"


format_authors <- function(author_string) {
  
  # Split authors by comma
  authors <- gsub(pattern = "[0-9]", replacement = "", author_string)
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
  )
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