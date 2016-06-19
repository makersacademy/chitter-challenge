ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative './models/init'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
  	@peeps = Peep.all
  	@users = User.all
    erb :index
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
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to('/')
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(:name => params[:name],
                     :email => params[:email],
                     :username => params[:username],
                     :password => params[:password],
                     :password_confirmation => params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/peeps/new' do
  	erb :'peeps/new'
  end

  post '/peeps' do
  	@peep = Peep.new(content: params[:content], created_at: params[:created_at], user_id: session[:user_id])
  	if @peep.save
      redirect to('/peeps')
    else
      flash.now[:errors] = @peep.errors.full_messages
      erb :'peeps/new'
    end
  end

  get '/peeps' do
  	@peeps = Peep.all
  	@users = User.all
  	erb :'peeps/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
