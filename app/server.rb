class Chitter < Sinatra::Base
  before do
    current_user
  end

  set :encrypted_sessions, 'valid'
  register Sinatra::Flash
  use Rack::MethodOverride
  use Rack::Session::Pool

  helpers do
    def current_user
      @user ||= User.get(session[:user_id])
    end

    def user_paramaters
      {
        name: params[:name],
        username: params[:username],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:confirm_password]
      }
    end
  end
end
