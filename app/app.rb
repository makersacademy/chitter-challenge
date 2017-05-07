ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
$LOAD_PATH << "#{Dir.pwd}"
require 'app/data_mapper_setup'
require 'sinatra/flash'

class ChitterApp < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    erb :index
  end

  get '/user_sign_up' do
    @user = User.new
    erb :user_sign_up
  end

  post '/create_user' do
    @user = User.new(username: params[:username],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :user_sign_up
    end
  end

  get '/peeps' do
    @user = User.get(session[:id])
    erb :peeps
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end

  delete '/sessions' do
    session[:id] = nil
    flash.keep[:notice] = 'See you again soon!'
    redirect to '/peeps'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = 'The email or password is incorrect'
      erb :'sessions/new'
    end
  end

  run! if app_file == $0

end
