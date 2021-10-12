library(tidytext)
library(wordcloud)


tidy_resp <- responses %>%
  group_by(`Which theme were you?`) %>%
  mutate(ans_number = row_number()) %>%
  ungroup() %>%
  unnest_tokens(word, Summary)




data(stop_words)
tidy_resp <- tidy_resp %>%
  anti_join(stop_words)

# A. How can all staff work together to improve the UG/PGT student research experience and outcomes?

png("figs/A.png")
tidy_resp %>%
  filter(`Which theme were you?` == "A. How can all staff work together to improve the UG/PGT student research experience and outcomes?") %>%
  count(word) %>%
  with(wordcloud(word, n,
                 min.freq = 2,
                 max.words = 100,
                 colors = brewer.pal(8, "Dark2")))
dev.off()

# B. How can all staff work together to improve professional training programmes?
png("figs/B.png")
tidy_resp %>%
  filter(`Which theme were you?` == "B. How can all staff work together to improve professional training programmes?") %>%
  count(word) %>%
  with(wordcloud(word, n,
                 min.freq = 1,
                 max.words = 100,
                 colors = brewer.pal(8, "Dark2")))
dev.off()

# C. Strategically, how do we create more interactions between staff groups?
png("figs/C.png")
tidy_resp %>%
  filter(`Which theme were you?` == "C. Strategically, how do we create more interactions between staff groups?") %>%
  count(word) %>%
  with(wordcloud(word, n,
                 min.freq = 2,
                 max.words = 100,
                 colors = brewer.pal(8, "Dark2")))
dev.off()

