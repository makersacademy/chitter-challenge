ENV["RACK_ENV"] ||= "development"

require_relative 'datamapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  set :session_secret,  'SUPER SECRET'

  get '/' do
    @peeps = Peep.all
    erb :'peep/all'
  end

  get '/peep/new' do
    erb :'peep/new'
  end

  post '/peep' do
    Peep.create(body: params[:body])
    redirect '/'
  end

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/user' do
    @user = User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:error_messages] = @user.errors.full_messages
      erb :'user/new'
    end
  end

  get '/session/new' do
    erb :'/session/new'
  end

  post '/session' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:error_messages] = ['Username or password is incorrect']
      erb :'/session/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
