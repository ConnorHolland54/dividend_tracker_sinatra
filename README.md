
# dividend_tracker_sinatra

About:
Dividend Tracker is a web application to help users track their dividends and show them how much they should expect to make for the year. The web application uses an api to make requests and retrieve stock info based on a ticker and then calculates the dividend for each stock by multiplying that by the number of shares the user has.

Setup:
In order to use the application, you will need to first go to https://www.alphavantage.co/ and create a free api key.

Next, when opening the app you will need to run bundle install in the terminal to have all the necessary gems required to run the app.

You will then need to create a .env file in root of the project and create a new environment variable called API_KEY and set it to your api key that you recieved from alphavantage.

Running the App:
In order to run the app you will need to run shotgun in your terminal and copy and past the http url and add "/login" to the end.

Once done, you should be able to see the login page in which you can either sign up or login.

Enjoy!
