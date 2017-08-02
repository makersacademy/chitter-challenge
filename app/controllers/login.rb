class Login < Sinatra::Base
  enable :sessions
  set :session_secret, 'super-secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  def current_user
    @current_user ||= User.get(session[:id])
  end

  get '/' do
    @user = User.new
    erb :sign_up
  end

  get '/sessions/new' do
    erb :session_new
  end

  post '/session' do
    redirect '/sessions/new'
  end

  post '/log_in' do
    @user = User.first(:email => params[:email])
    if @user
      session[:id] = @user.id
      redirect '/main'
    else
      flash.next[:no_user] = 'Please sign up first'
      redirect '/'
    end
  end
end
