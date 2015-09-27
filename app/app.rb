require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base
  run! if app_file == $PROGRAM_NAME
  use Rack::MethodOverride
  register Sinatra::Flash

  set :views, proc { File.join(root, 'views') }

  enable :sessions
  set :session_secret, 'super secret'

  # 0 Seeing peeps

  # Amend this so that only the user can post.
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


  # 1. Registering
  get '/' do
    erb :index
  end

  post '/user/sign-up' do
    #we initialize the object without saving it.
    @user = User.create(email: params[:email], password: params[:password],
    name: params[:name], username: params[:username])
    if @user.save #return true or false if successfuly saved
      session[:user_id] = @user.id
      redirect :'/peeps'
    else
      flash.now[:errors] = ["The email or username is not available"]
      redirect '/'
    end
  end

  helpers do # Need to refactor as a module
    def current_user
      User.get(session[:user_id])
    end
  end

  # 2. Log in
  post '/user/login' do
    user = User.login(params[:user], params[:login_password])
    if user
      session[:user_id] = user.id
      redirect to '/peeps'
    else
      flash.now[:errors] = ['The username or password is incorrect']
      redirect to '/'
    end
  end

  # 3. Sign out
  delete '/user/login' do
    flash.next[:notice] = "Goodbye #{current_user.name}"
    session[:user_id] = nil
    redirect to '/peeps'
  end
end
