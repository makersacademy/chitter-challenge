
class Chitter < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '')

  set :views, Proc.new { File.join(root, "views") }

  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb

  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
