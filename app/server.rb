# Server
class Chitter < Sinatra::Base
  enable :sessions
  require_relative 'controllers/users'
  
  helpers do
    def current_user
      @current_user ||= session[:name]
    end
  end

end
