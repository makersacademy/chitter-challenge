require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup.rb'

class Chitter < Sinatra::Base

  use Rack::MethodOverride

  enable :sessions
  set :sessions_secret, 'super secret'
  register Sinatra::Flash
  
  get '/' do 
    'Chitter-Challenge'
    erb :'index'
  end

  get '/peeps' do 
    @peeps  = Peeps.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new_peeps'
  end


  post '/peeps' do
    Peeps.create(activity: params[:activity])
    redirect to('/peeps')
  end







  get '/user/new' do
    erb :'user/new'
  end

  post '/users' do
    @user = User.create(name: params[:name],email: params[:email],username: params[:username],password: params[:password], password_confirmation: params[:password_confirmation])

    if @user.save  
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:notice] = "The password and confirmation password are not correct"
      erb :'user/new'
    end
  end

  helpers do  
    def current_user
      user ||= User.first(id: session[:user_id]) #what does this line of code mean?
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
      erb :'sessions/new' #The flash now error does not work
    end

  end

  delete '/sessions' do
    flash.now[:notice] = 'Goodbye!'
    session[:user_id] = nil
    erb :'sessions/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0


 end
