require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get "/" do
    erb :index
  end

  helpers do
		def logged_in?
			!!session[:id]
		end

		def current_user
			current_user ||=User.find(session[:id])
		end
	end


end
