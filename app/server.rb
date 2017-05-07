class Chitter < Sinatra::Base
  before do
    current_user
  end

  set :encrypted_sessions, 'valid'
  register Sinatra::Flash
  use Rack::MethodOverride
  use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :secret => 'your_secret'

  helpers do
    def current_user
      @user ||= User.get(session[:user_id])
    end
  end
end
