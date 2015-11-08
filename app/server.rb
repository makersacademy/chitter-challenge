class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'



  register Sinatra::Flash
  register Sinatra::Partial

  set :partial_template_engine, :erb
  enable :partial_underscores

  use Rack::MethodOverride

  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "views") }

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end