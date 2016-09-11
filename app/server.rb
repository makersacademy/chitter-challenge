ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  register Sinatra::Partial
  
  enable :sessions
  enable :partial_underscores
  set :session_secret, 'super secret'
  set :public_folder, Proc.new { File.join(root, 'static') }
  set :partial_template_engine, :erb

  helpers do
    def current_user
      @current_user ||= Users.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
