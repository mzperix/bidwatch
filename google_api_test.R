library(googleLanguageR)
gl_auth("Bidwatch-b4423aaa898e.json")

texts <- c("Public procurement is one of the government activity most vulnerable to corruption. In addition to the volume of transactions and the financial interests at stake, corruption risks are exacerbated by the complexity of the process, the close interaction between public officials and businesses, and the multitude of stakeholders. (OCED, 2016)
This results in exaggerated costs and a decrease in quality. A study by the OECD and the World Bank shows that corruption in the infrastructure and extractives sectors lead to misallocation of public funds and substandard and insufficient services…  it has been estimated that between 10-30% of the investment in publicly funded construction projects may be lost through mismanagement and corruption (OECD, 2015a).
")
nlp_result <- gl_nlp(texts)

# two results of lists of tibbles
str(nlp_result, max.level = 4)

print(nlp_result[['tokens']])
