class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'


  helpers do
    def session_user
      @session_user ||= User.get(session[:user_id])
    end
  end


  get '/' do
    @new_user = User.new
    erb :'user/index'
  end

  run! if app_file == $0
end
