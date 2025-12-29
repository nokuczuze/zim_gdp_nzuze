# Install if needed
install.packages("WDI")
install.packages("dplyr")
install.packages("ggplot2")
library(ggplot2)
library(dplyr)
library(WDI)

# Download Zimbabwe GDP (current USD) and GDP growth (%)
data <- WDI(
  country = "ZWE",
  indicator = c("gdp_usd" = "NY.GDP.MKTP.CD",
                "gdp_growth" = "NY.GDP.MKTP.KD.ZG"),
  start = 2009,
  end = 2017
)

# Remove NA values
data <- na.omit(data)

# View data
print(data)


df <- data %>%
  select(year, gdp_usd, gdp_growth) %>%
  arrange(year)



ggplot(df, aes(x = year, y = gdp_growth)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  scale_x_continuous(breaks = 2009:2017) +
  scale_y_continuous(breaks = seq(-20, 20, by = 5)) +
  labs(
    title = "Zimbabwe GDP Growth Rate (%)",
    x = "Year",
    y = "GDP Growth (%)"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(hjust = 0.5)
  ) +
  labs(caption = "Source: World Bank, World Development Indicators")


ggplot(df, aes(x = year, y = gdp_usd / 1e9)) +
  geom_line(size = 1.2) +
  geom_point(size = 2) +
  scale_x_continuous(breaks = 2009:2017) +
  labs(
    title = "Zimbabwe GDP (Billions of Current US Dollars)",
    x = "Year",
    y = "GDP (billion USD)"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(hjust = 0.5)
  ) + 
  labs(caption = "Source: World Bank, World Development Indicators")



