
class Chitter < Sinatra::Base

  register Sinatra::Flash
  use Rack::MethodOverride
  enable :sessions

  helpers do
    def current_user
      @current_user = User.first(id: session[:user_id])
    end
  end

end
