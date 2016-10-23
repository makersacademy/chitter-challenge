ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/data_mapper_setup'
require_relative 'models/user'
require_relative 'models/peep'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    @peeps = Peep.all.reverse
    @users = User.all
    erb :index
  end

  post '/peep/new' do
    Peep.create(user: User.first(id: session[:user_id]),
    timePosted: (Time.now),
    content: params[:content])
    redirect '/'
  end

  get '/signup/new' do
    @user = User.new
    erb :signup
  end

  post '/signup' do
    @user = User.new(name: params[:name],
    email: params[:email],
    username: params[:username],
    password: params[:password],
    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :signup
    end
  end

  get '/sessions/new' do
    @user = User.new
    erb :login
  end

  post '/sessions' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect to('/')
  else
    flash.now[:errors] = ['The email or password is incorrect']
    erb :'login'
  end
end

  run! if app_file == $0
end
