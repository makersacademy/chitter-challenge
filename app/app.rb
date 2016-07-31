ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  use Rack::MethodOverride
  register Sinatra::Flash

  require_relative 'data_mapper_setup'

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect to '/cheeps'
  end

  get '/cheeps' do
    @cheeps = Cheep.all.reverse
    erb :'cheeps/index'
  end

  post '/cheeps' do
    cheep = Cheep.create(content: params[:content],
                         user_id: session[:user_id],
                         time: Time.now)
    cheep.save
    redirect to '/cheeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  get '/cheeps/new' do
    erb :'cheeps/new'
  end


  post '/users' do
    @user = User.create( name: params[:name],
                        email: params[:email],
                        username: params[:username],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/'
    else
      flash.now[:errors] = ["The username or password is incorrect"]
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to '/'
  end

  get '/cancel' do
    redirect to '/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
