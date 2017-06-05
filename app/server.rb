class Chitter < Sinatra::Base
  register Sinatra::Flash
  include BCrypt
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET']

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end 
