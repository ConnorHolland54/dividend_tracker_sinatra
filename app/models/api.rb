require 'httparty'
class Api
  def self.get_info
    response = HTTParty.get("https://www.alphavantage.co/query?function=OVERVIEW&symbol=AAPL&apikey=#{ENV['API_KEY']}")
  end
end
