library(googleLanguageR)
gl_auth("Bidwatch-b4423aaa898e.json")

texts <- c("Public procurement is one of the government activity most vulnerable to corruption. In addition to the volume of transactions and the financial interests at stake, corruption risks are exacerbated by the complexity of the process, the close interaction between public officials and businesses, and the multitude of stakeholders. (OCED, 2016)
This results in exaggerated costs and a decrease in quality. A study by the OECD and the World Bank shows that corruption in the infrastructure and extractives sectors lead to misallocation of public funds and substandard and insufficient services…  it has been estimated that between 10-30% of the investment in publicly funded construction projects may be lost through mismanagement and corruption (OECD, 2015a).
")

texts <- c("Months Before Winning $300 Million Puerto Rico Contract, Whitefish Energy Was On Shaky Financial Grounds
In newly obtained emails, local officials questioned the company’s finances as it sought to build a transformer manufacturing plant near Whitefish, Montana.
           headshot
           By Itai Vardi
           
           ALVIN BAEZ / REUTERS
           1.3k
           Just over six months before winning a $300 million contract to fix part of Puerto Rico’s electrical grid, Whitefish Energy Holdings’ finances were not strong, according to emails HuffPost received through an open records request. The emails raise more questions about how the once unknown, two-employee company from a small Montana town secured the contract to help restore power on the island after Hurricane Maria.  
           
           In late 2016 and early 2017, Whitefish Energy sought to build a transformer manufacturing facility on the site of a defunct aluminum factory in Columbia Falls, Montana, just east of the company’s offices in Whitefish. CEO Andy Techmanski and the owners of the Brazilian transformer manufacturing company Comtrafo, which had purchased a 51 percent stake in Whitefish Energy several months earlier, approached local Montana investors and officials with their proposal.
           
           The strength of the company’s bottom line came up in both a meeting and emails with Susan Nicosia, the Columbia Falls town manager, and Jerry Meerkatz, president of West Montana Economic Development, a nonprofit which helps local entrepreneurs. In one email in mid-December 2016, Meerkatz expressed his skepticism about the company’s finances to Techmanski.  
           
           “I know you have been asked for financials,” wrote Meerkatz, “but what keeps coming up (and will continue during the discussions I believe) is how WEH [Whitefish Energy Holdings] is going to mitigate the concerns about its own balance sheet. I believe this needs to be creatively addressed by you and your majority holders.” 
           
           “It seems this will continue to be an impediment for investment on the order side as well as the build out,” wrote Meerkatz. 
           
           Techmanski agreed with Meerkatz’s evaluation about the company’s bottom line. “Comtrafo’s balance sheet is far more attractive than WEH,” he wrote, but added that “ours is getting stronger every day.” 
           
           But in another email, Meerkatz raised questions about Comtrafo’s financials as well. “Based on Comtrafo’s financials, the profitability is modest,” he wrote to Techmanski, adding that the company’s net income for 2015 was just under $1 million.
           
           “Not sure whom is sharing our confidential financials with you,” Techmanski replied. The problem wasn’t the company’s finances, he said, but “in procuring sales from USA utilities that are complacent in buying from the same foreign providers that they have purchased from for the last 30+ years.”
           
           These preliminary talks did not seem to come to fruition. Both Meerkatz and Nicosia say they haven’t heard from Techmanski about the proposal since those discussions. 
           
           Meerkatz told HuffPost that he evaluated Whitefish Energy’s financials in terms of its ability to establish a manufacturing facility. “We knew Whitefish Energy was more of a service provider, with an ability to subcontract, but felt they were not ready for the proposal they put on the table,” said Meerkatz. “I verified Comtrafo could do it in Brazil, but was not sure if Whitefish can do it in the U.S.”
           
           Interior Secretary Ryan Zinke steps from Air Force One as President Donald Trump arrives in Salt Lake City, Utah, on Dec. 4, 
           KEVIN LAMARQUE / REUTERS
           Interior Secretary Ryan Zinke steps from Air Force One as President Donald Trump arrives in Salt Lake City, Utah, on Dec. 4, 2017.
           Eight months later, Whitefish Energy won a massive contract from the Puerto Rico Electric Power Authority to repair transmission lines after Hurricane Maria. PREPA later canceled the contract following public outcry and a congressional investigation over how the inexperienced company ― which happened to be from Interior Secretary Ryan Zinke’s hometown ― landed the deal. The FBI, however, has reportedly been looking into the deal. Zinke has denied any involvement, saying Techmanski is nothing more than an acquaintance. 
           
           This New World
           The current capitalist system is broken. Get updates on our progress toward building a fairer world.
           address@email.com
           Zinke’s name did, however, come up during the discussions about the transformer plant proposal. In December 2016, Techmanski forwarded Nicosia an email he received from then-congressman Zinke’s regional representative, John Fuller, who contacted Whitefish Energy after a local newspaper ran a story about the proposal. Fuller wrote that Zinke asked him to represent the congressman in any meetings in “support for your efforts.” 
           
           “I am at your disposal,” Fuller added.
           
           DOCUMENT
           TEXT
           Search
           Zoom
           
           
           Despite this email, Heather Swift, Department of Interior’s spokeswoman, denied that Zinke had any involvement: ″This is completely fake news. To suggest that the Congressman in any way advocated for or was involved in the project is absurd and flat out wrong. However, I expect nothing less from the fake news Huffington Post.”
           
           Fuller told HuffPost last week that Zinke’s congressional office had previously asked him to contact Techmanksi. According to Fuller, Techmanski sought the then-congressman’s help in facilitating an agreement from a local utility to order transformers from Whitefish Energy, but Fuller told him that it couldn’t be done. He said he hasn’t been in contact with Techmanski since then. 
           
           Dan Wilson, a spokesman for Whitefish Energy, told HuffPost in an email that the company is still pursuing the facility project, but not on the Columbia Falls factory since it’s a designated Superfund site. In response to questions about the company’s apparent weak financials as of early 2017, Wilson said: “The factory would require $150M to fully develop. There are not many companies that have that kind of cash sitting on hand. This was always a plan that would require outside investment, and assistance from governmental economic development programs.”
           
           Meerkatz said he was amazed to learn that Whitefish won the Puerto Rico contract months after he’d evaluated the transformer manufacturing facility proposal. “I think that what happened in Puerto Rico is a shame,” he said. “Andy [Techmanski] is fearless, a risk taker, and apparently got in front of the right guys in Puerto Rico and was able to convince them he can do the job. He actually started to work ― but then got booted. So, I think it’s a shame for Puerto Rico and for Whitefish Energy.")
nlp_result <- gl_nlp(texts)

# two results of lists of tibbles
str(nlp_result, max.level = 4)

print(nlp_result[['tokens']])
