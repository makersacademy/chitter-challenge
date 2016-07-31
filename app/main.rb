class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  set :public_folder, 'public'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
    def active_page?(path='/')
      request.path_info == path
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
