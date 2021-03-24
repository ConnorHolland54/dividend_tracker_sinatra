class Stock < ActiveRecord::Base
  belongs_to :user

  def self.yearly_divs(user)
    amount = 0
    user.stocks.each do |stock|
      amount += stock.shares * stock.dividend_per_share.to_i
    end
    return amount != nil ? amount : 0
  end
end
