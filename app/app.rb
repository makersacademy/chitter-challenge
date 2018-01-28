ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require './app/models/database_setup'


class  Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  before do
    @peeps = Peep.all(order: :created_at.desc)
  end

  get '/' do
    redirect '/register/signup'
  end

  get '/register/signup' do
    @user = User.new
    erb :'register/signup'
  end

  post '/register/signup' do
    @user = User.create(username: params[:username],
                          email: params[:email],
                          password: params[:password])
    if @user.save
      session[:user_id] = @user.id

      redirect '/home/homepage'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'register/signup'
    end
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/home/homepage')
    else
      flash.now[:errors] = ['The email or password is incorrect']
    end
  end

  post '/peep_new' do
    Peep.create(peep:params[:peep], user: current_user)

    redirect '/home/homepage'
  end

  get '/home/homepage' do

    erb :'home/homepage'
  end


  run! if app_file == $0
end
