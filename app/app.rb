require 'sinatra/base'
require 'data_mapper'
require './app/data_mapper_setup'
require 'sinatra/flash'

class App < Sinatra::Base

  set :views, proc { File.join(root, '..', '/app/views') }
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash


  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(message: params[:message], time: Time.new)
    redirect to('/peeps')
  end

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/user' do
    @user = User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/user/new'
    end
  end

  def current_user
    @user ||= User.get(session[:user_id])
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


  run! if app_file == $0
end
