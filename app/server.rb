class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :partial_template_engine, :erb

  enable :partial_underscores

  set :public_folder, Proc.new { File.join(root, 'static') }

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
