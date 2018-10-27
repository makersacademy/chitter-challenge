require 'sinatra/base'
require 'sinatra/flash'
require './lib/chitter'
require './lib/user'
require 'pry'

class ChitterApp < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/chitter' do
    @user = User.find(session[:user_id]) if session[:user_id] != nil
    @peeps = Chitter.all_peeps
    erb(:index)
  end

  get '/chitter/new' do
    @user = User.find(session[:user_id]) if session[:user_id] != nil
    erb(:new)
  end
# I am not sure whether this routing is right; could be post '/chitter'
  post '/chitter/save_new' do
    @user = Chitter.create(session[:user_id], params[:content])
    redirect('/chitter')
  end

  get '/chitter/signup' do
    erb(:signup)
  end
# I am not sure whether this routing is right; could be post '/users'
  post '/chitter/save_new_user' do
    user = User.create(params[:first_name], params[:last_name], params[:email], params[:username], params[:password])
    session[:user_id] = user.user_id
    redirect('/chitter')
  end

  get '/chitter/login' do
    erb(:login)
  end

  post '/chitter/users' do
    @user = User.authenticate(params[:username], params[:password])
    if @user
      session[:user_id] = @user.user_id
      redirect('/chitter')
    else
      redirect('/chitter/login')
    end
  end

  get '/chitter/logout' do
    session[:user_id] = nil
    redirect('/chitter')
  end

  run! if app_file == $0

end
