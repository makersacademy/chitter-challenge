class Chitter < Sinatra::Base
  use Rack::MethodOverride
  set :app_file, __FILE__
  enable :sessions
  set :session_secret, 'super secret'


  register Sinatra::Flash
  register Sinatra::Partial

  set :partial_template_engine, :erb
  enable :partial_underscores

  get '/' do
    redirect to('/peeps')
  end

  get "/log-in" do
    erb(:log_in)
  end

  helpers do

    def log_in(user)
      session[:user_id] = user.id
      redirect to("/users/#{user.id}")
    end

    def current_user?(user)
      current_user == user
    end

    def current_user
      @user = User.get(session[:user_id])
    end

    def logged_in?
      !session[:user_id].nil?
    end

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
