User.create(:email => "123@gmail.com", :password => "1234567")
User.create(:email => "321@gmail.com", :password => "7654321")

Stock.create(:symbol => "AAPL", :name => "Apple", :description => "xyz", :dividend_per_share => "Sdsfs", :dividend_date => "sdfsdf", :ex_dividend_date => "SDfsdf", :shares => "sdfsdf", :user_id => 1)
Stock.create(:symbol => "ABBV", :name => "Abbvie", :description => "xyz", :dividend_per_share => "Sdsfs", :dividend_date => "sdfsdf", :ex_dividend_date => "SDfsdf", :shares => "sdfsdf", :user_id => 1)
