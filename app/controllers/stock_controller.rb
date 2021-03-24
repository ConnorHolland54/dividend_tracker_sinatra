
class StockController < ApplicationController

  get '/stocks' do
    if logged_in?
      @stocks = fetch_stocks
      erb :'stocks/index'
    else
      redirect '/Login'
    end
  end

  get '/stocks/new' do
    erb :'stocks/new'
  end

  post '/stocks' do
    ticker = params[:ticker].upcase
    stock_info = Api.get_info(ticker)
    stock = Stock.new(:symbol => stock_info['Symbol'], :name => stock_info["Name"], :description => stock_info["Description"], :dividend_per_share => stock_info["DividendPerShare"], :dividend_date => stock_info["DividendDate"], :ex_dividend_date => stock_info['ExDividendDate'], :shares => 0, :user_id => current_user.id)
    user_stocks = current_user.stocks.map {|stock| stock.symbol}
    if !user_stocks.include?(ticker)
      if stock.save
        redirect '/stocks'
      else
        flash[:notice] = "Could not save the stock!"
        redirect '/stocks/new'
      end
    else
      flash[:notice] = "Stock already exists!"
      redirect '/stocks/new'
    end
  end

  get '/stocks/:id' do
    @stock = Stock.find(params[:id])
    erb :'stocks/show'
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
