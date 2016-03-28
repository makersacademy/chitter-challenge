require 'pry'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, "super secret"
  register Sinatra::Flash

  # register Sinatra::Partial
  # set :partial_template_engine, :erb
  # enable :partial_underscores

  get '/' do
    erb :login
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
