# Server
class Chitter < Sinatra::Base
  enable :sessions
  
  helpers do
    def current_user
      @current_user ||= session[:name]
    end
  end

end
