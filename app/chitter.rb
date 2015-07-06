require 'sinatra/base'
require 'sinatra/flash'
require_relative '../datamapper_setup.rb'
require_relative './models/user'
require_relative './models/peep'

class App < Sinatra::Base

  set :views, proc { File.join(root, '..', 'views') }
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
  	@user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], name: params[:name], username: params[:username])
  	if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:error] = @user.errors.full_messages#'Password does not match'	
      erb :'/users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:error] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    flash.now[:notice] = 'Goodbye!'
    session[:user_id] = nil
    erb :'sessions/new'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    if session[:user_id]
      if (params[:peep] != '')
        Peep.create(message: params[:peep], time: Time.now, user_id: current_user.id, username: current_user.username, name: current_user.name)
        redirect '/peeps'
      else
        flash.now[:notice] = 'You must enter a message'
        erb :'/peeps/new'
      end
    else
      flash.now[:notice] = 'You must be logged in to peep'
      erb :'/sessions/new'
    end
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/peeps'
  end

  helpers do
    def current_user
      return false unless session[:user_id]
      current_user ||= User.first(id: session[:user_id])
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0

end