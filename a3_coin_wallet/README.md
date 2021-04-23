# Digital Currency Wallet

#### Background
- The dramatic price-rising of bitcoin has led to a new wave of investment in digital currency.
- To help people better manage their coins, let's build a wallet app for managing digital currencies using Flutter.

<div style="text-align:center"><img src='./images/overview.png' width='200' style='border:1px solid #555'></div>

#### Tasks
You are asked to implement the following features:
1. A landing page with __2__ major sections: ```Accounts``` and ```News```.
    - Accounts
        - Users may invest/manage multiple digital currencies, and each will have a unique account represented as a bank card in the app.
        - Each card should display correct account __name__, __balance__, and __transfer__ icon button.
        - All cards are stacked together but with a fixed distance in y-axis. One can swipe the card on the top to the bottom. 
        - ```Package:``` [Swipe Stack](https://pub.dev/packages/swipe_stack)
    
    <div style="text-align:center"><img src='./images/swipe_card.gif' width='400'></div>

    - News
        - Fetch Bitcoin news from ```https://newsapi.org/```.
        - Attach progress indicator while waiting the response and perform proper error handling.
        - After clicking the news card, it will navigate to a different page that you can view the whole news. 
        - ```Package:``` [Dio](https://pub.dev/packages/dio), [Cached Network Image](https://pub.dev/packages/cached_network_image) 

    <div style="text-align:center"><img src='./images/news.gif' width='300'></div>
                  
2. Account Transfer
    - Tapping the transfer icon button will trigger the transfer bottom-up sheet.
    - ```Package:``` [Modal Bottom Sheet](https://pub.dev/packages/modal_bottom_sheet)
    <div style="text-align:center"><img src='./images/transfer.gif' width='300'></div>