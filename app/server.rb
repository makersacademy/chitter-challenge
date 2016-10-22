class Chitter < Sinatra::Base

register Sinatra::Flash
enable :sessions

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
