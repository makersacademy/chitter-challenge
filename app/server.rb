class Chitter < Sinatra::Base
  
  register Sinatra::Flash
  register Sinatra::Partial
  
  enable :sessions
  enable :partial_underscores  
  
  set :session_secret, 'super secret'
  set method_override: true
  set :partial_template_engine, :erb
  
 
  
  
  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
    
    def stream
     @stream ||= Messagestream.create message: "Welcome to Chitter"
    end
  end
  
  run! if app_file == $0
end