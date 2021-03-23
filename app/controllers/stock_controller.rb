
class StockController < ApplicationController

  get '/stocks' do
    if logged_in?
      @stocks = fetch_stocks
      erb :index
    else
      redirect '/Login'
    end
  end

  get '/stocks/new' do
    erb :new
  end

  post '/stocks' do
    ticker = params[:ticker].upcase
    stock_info = Api.get_info(ticker)
    stock = Stock.new(:symbol => stock_info['Symbol'], :name => stock_info["Name"], :description => stock_info["Description"], :dividend_per_share => stock_info["DividendPerShare"], :dividend_date => stock_info["DividendDate"], :ex_dividend_date => stock_info['ExDividendDate'], :shares => 0, :user_id => current_user.id)
    if stock.save
      redirect '/stocks'
    else
      # Failure
    end
  end

  get '/stocks/:id' do
    @stock = Stock.find(params[:id])
    erb :show
  end

  patch '/stocks/update' do
    stock = current_user.stocks.find_by(:name => params[:stock])
    stock.shares = params[:value]
    stock.save
    redirect '/stocks'
  end

  delete '/stocks/:id' do
    stock = Stock.find(params[:id])
    stock.destroy
    redirect '/stocks'
  end



end
