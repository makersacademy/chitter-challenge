ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup'
require './app/models/peep'
require './app/models/user'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super_secret'

  get '/' do
    redirect :'/peeps'
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end

  post '/peeps' do
    new_peep = Peep.create(peep: params[:peep], user_id: session[:user_id])
    new_peep.save
    redirect :'/peeps'
  end

  get '/peeps' do
    @all_peeps = Peep.all
    erb :'peeps/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps/new'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    flash.keep[:notice] = 'See you next time!'
    session[:user_id] = nil
    redirect to '/sessions/new'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
