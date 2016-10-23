require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  
  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
