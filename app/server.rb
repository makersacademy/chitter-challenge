class ChitterApp < Sinatra::Base

  register Sinatra::Flash
  register Sinatra::Partial
  enable :sessions

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end


  run! if app_file == $0
end
