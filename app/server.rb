require 'pry'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, "super secret"
  register Sinatra::Flash
  use Rack::MethodOverride


  get '/' do
    erb :login
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
