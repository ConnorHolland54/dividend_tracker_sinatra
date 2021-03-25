require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, "password_security"
    set :views, 'app/views'
    use Rack::Flash, :sweep => true
  end


  get '/' do
    erb :welcome
  end

  helpers do
    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/login'
      end
    end

    def fetch_stocks
      current_user.stocks
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
