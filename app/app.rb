require 'sinatra/base'
require './data_mapper_setup'
require 'sinatra/flash'



class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  set :views, proc { File.join(root, 'views') }
  use Rack::MethodOverride
  register Sinatra::Flash

    get '/' do
      redirect '/peeps'
    end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :'peeps/index'
  end

  post '/peeps' do
    if session[:user_id] == nil
      redirect to ('/users/new')
    else
      @user = current_user
      peep = Peep.create(message: params[:message], timestamp: Time.now)
      @user.peeps << peep
      @user.save
      redirect to('/peeps')
    end
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @exists = User.exists(params[:email])
    if user
      redirect to('/users/new')
    else
      @user = User.create(email: params[:email],
                  password: params[:password],
                  username: params[:username])
      @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end


  delete '/sessions' do
    session.clear
    flash.now[:notice] = ["Goodbye!"]
  end

  helpers do
    def current_user
      current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end