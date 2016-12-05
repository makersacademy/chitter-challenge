class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  set(:cookie_options) do
    { :expires => Time.now + 3600 }
  end
  set :public_folder, Proc.new { File.join(root, 'static') }
  register Sinatra::Flash
  use Rack::MethodOverride
  set :app_file, __FILE__

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
