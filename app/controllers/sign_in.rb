class SignIn < Sinatra::Base
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

  post '/sign_up' do
    @user = User.new(name: params[:name],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:id] = @user.id
      redirect '/main'
    else
      flash.next[:errors] = @user.errors.full_messages
      redirect '/'
    end
  end

  get '/main' do
    @peeps = current_user.peeps
    erb :main
  end
end
