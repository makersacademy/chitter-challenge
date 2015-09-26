require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base
  run! if app_file == $PROGRAM_NAME

  register Sinatra::Flash

  set :views, proc { File.join(root, 'views') }

  enable :sessions
  set :session_secret, 'super secret'

  # 0 Seeing peeps
  post '/peeps' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'/peeps/new'
  end


  # 1. Regestering
  get '/' do
    erb :index
  end

  post '/user/sign-up' do
    #we initialize the object without saving it.
    @user = User.create(email: params[:email], password: params[:password],
    name: params[:name], username: params[:username])
    if @user.save #return true or false if successfuly saved
      session[:user_id] = @user.id
      redirect :'/user'
    else
      flash[:errors] = @user.errors.full_messages
      redirect '/'
    end
  end

  get '/user' do
    erb :'user/index'
  end

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end

  # 2. Log in
  post '/user/login' do
    user = User.login(params[:user], params[:login_password])
    if user
      session[:user_id] = user.id
      redirect to '/user'
    else
      flash.now[:errors] = ['The username or password is incorrect']
      redirect to '/'
    end
  end
end
