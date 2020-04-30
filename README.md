# Bitcoin_S2F

This project is my own implementation of the Bitcoin Stock to Flow price models first published by [@100trillionUSD](https://twitter.com/100trillionUSD) on Twitter.

Stock to flow = Total existing stock of bitcoin / Flow of newly created bitcoins (annually)

Using publicly accessible data of both the bitcoin price (you can get this from a variety of different sources online) and bitcoin's stock to flow (available online or from a bitcoin full node) I created the following linear regressions.

![Bitcoin Stock to Flow](https://github.com/NickChubb27/Bitcoin_S2F/blob/master/S2F_3LinearRegressions.png)

All the linear regressions performed had a relatively high r-squared (above 0.8). The green line is a linear regression on bitcoin price and stock to flow data up until 2012. The blue line is a linear regression on bitcoin price and stock to flow data up until 2016. The red line is a linear regression on bitcoin price and stock to flow data up until early 2020.

The most interesting part about the results of these linear regressions is that you could have used price and stock to flow data from 2009-2012 to accurately predict the future price of bitcoin for the next 8 years. It shows that bitcoin's price is highly correlated with bitcoin's stock to flow. Although correlation does not necessarily mean causation, it does make sense that the price of a bitcoin would be related to its increasing scarcity.
