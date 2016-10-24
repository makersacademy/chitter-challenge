ENV['RACK_ENV'] ||= "development"
require "sinatra/base"
require "sinatra/flash"
require_relative "models/peep"
require_relative "models/user"
require_relative "models/data_mapper_setup"

data_mapper_configure

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  delete '/sessions'do
    @peeps = Peep.all
    @users = User.all
    session.clear
    flash.now[:notice] = "Goodbye!"
    erb :index
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    @users = User.all
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  get '/sessions/new' do
    erb :'sessions/sign_in'
  end

  post '/peeps/new' do
    Peep.create(message: params[:message], user_id: session[:user_id])
    redirect '/peeps'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    p user
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/sign_in'
    end
  end

  post '/users' do
    @user = User.new(email: params[:email],
                username: params[:username],
                name: params[:name],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
