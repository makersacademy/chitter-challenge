require 'sinatra/base'
require_relative  './models/user'
require_relative  './models/peeps'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :'/index'
  end

  get '/sessions/new' do
    erb :'/new_session'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
    redirect '/users'
    else
      erb :'/new_session'
    end
  end

  get '/users/new_user' do
      erb :'/new_user'
  end

  post '/users/new' do
    @user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    if @user.save
      session[:user_id] = @user.id
    redirect '/users'
    else
      redirect '/users/new'
    end
  end


  get '/users' do
    @peeps = Peep.all
    current_user
    session[:user_id]
    erb :'start_chitter'
  end

  post '/users/logout' do
    session[:user_id] = nil
    redirect '/'
  end

  #peep related
  post '/post/new' do
    if current_user
      Peep.create(user_id: @current_user.id, username: @current_user.username, content: params[:post])
      redirect('/users')
    else
      redirect('/')
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
