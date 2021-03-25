
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
    redirect_if_not_logged_in
    erb :'stocks/new'
  end

  post '/stocks' do
    redirect_if_not_logged_in
    ticker = params[:ticker].upcase
    stock_info = Api.get_info(ticker)

    if stock_info.empty?
      flash[:notice] = "Stock does not exist!"
      redirect '/stocks/new'
    end


    stock = Stock.new(:symbol => stock_info['Symbol'], :name => stock_info["Name"], :description => stock_info["Description"], :dividend_per_share => stock_info["DividendPerShare"], :dividend_date => stock_info["DividendDate"], :ex_dividend_date => stock_info['ExDividendDate'], :shares => 0, :user_id => current_user.id)
    if !current_user.stocks.find_by(:symbol => ticker)
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
    redirect_if_not_logged_in
    @stock = Stock.find(params[:id])
    erb :'stocks/show'
  end

  patch '/stocks' do
    redirect_if_not_logged_in
    stock = current_user.stocks.find_by(:name => params[:stock])
    stock.shares = params[:value]
    stock.save
    redirect '/stocks'
  end

  delete '/stocks/:id' do
    redirect_if_not_logged_in
    stock = Stock.find(params[:id])
    stock.destroy
    redirect '/stocks'
  end
end
