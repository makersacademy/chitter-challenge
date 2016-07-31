ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

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

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(content: params[:peep])
    redirect to '/peeps'
  end

  get '/signup' do
    erb :signup
  end

  post '/newuser' do
    user = User.create(email: params[:email],
    password: params[:password],
    name: params[:name],
    username: params[:username])
    session[:user_id] = user.id
    redirect to('/')
  end

  get '/login' do
    erb :login
  end

  post '/logincheck' do
    user = User.authenticate(params[:email], params[:password])
    #authenticate method returns the authenticated user
    if user  #if authenticated user == user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = "The email or password is incorrect"
      erb :login
    end
  end

  delete '/logout' do
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect to ('/')
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
