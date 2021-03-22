require 'httparty'
class Api
  def self.get_info
    response = HTTParty.get("https://www.alphavantage.co/query?function=OVERVIEW&symbol=AAPL&apikey=OEBLH41A4WH06WRA")
    response.body
  end
end
