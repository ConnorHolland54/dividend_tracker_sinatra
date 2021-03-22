require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, "password_security"
    set :views, 'app/views'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.find_by(:email => params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/success'
    else
      # Faillure
    end
  end

  get '/success' do
    if logged_in?
      erb :home
    else
      redirect '/Login'
    end
  end

  get '/signup' do
    erb :signup
  end

  post "/signup" do
		user = User.new(:email => params[:email], :password => params[:password])

		if user.save
			redirect "/login"
		else
			redirect "/failure"
		end
	end

  get '/logout' do
    session.clear
    redirect '/login'
  end




  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
