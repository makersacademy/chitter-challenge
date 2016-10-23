ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  use Rack::MethodOverride

  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'


  get '/' do
    'Hello Chitter!'
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do # save a new link
    erb :'peeps/new'
  end

  post '/chitter' do
    peep = Peep.new(peep: params[:peep])
    peep.save
    redirect '/chitter'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      @status = 'match'
      redirect '/chitter'
    else
      flash.now[:notice] = 'Password and confirmation password do not match or Email address is already registered'
      erb :'/users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/chitter')
    else
      flash.now[:notice] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect to '/chitter'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
