class UserController < ApplicationController

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(:email => params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/stocks'
    else
      flash[:notice] = "Incorrect email or password!"
      redirect '/login'
    end
  end

  get '/signup' do
    erb :'users/signup'
  end

  post "/signup" do
		user = User.new(:email => params[:email], :password => params[:password])

		if user.save
			redirect "/login"
		else
      user.errors.full_messages.first
      flash[:notice] = user.errors.full_messages.first
      redirect '/signup'
		end
	end

  get '/logout' do
    session.clear
    redirect '/login'
  end

end
